import { S_2_6EdiTransactionService } from '@services/transaction/s-2-6-edi-transaction.service';
import { InjectBase } from '@utilities/inject-base-app';
import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { BsDatepickerConfig } from 'ngx-bootstrap/datepicker';
import { IconButton } from '@constants/common.constants';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.scss']
})
export class MainComponent extends InjectBase implements OnInit {

  extensions: string = '.xls, .xlsm, .xlsx';
  iconButton = IconButton;
  bsConfig: Partial<BsDatepickerConfig> = <Partial<BsDatepickerConfig>>{};
  startDate: Date;
  endDate: Date;
  title: string = '';
  @ViewChild('inputRef') inputRef: ElementRef<HTMLInputElement>;
  constructor(
    private ediTransactionService: S_2_6EdiTransactionService,
  ) {
    super();
  }

  ngOnInit(): void {
    this.route.data.subscribe(res => this.title = res['title']);
  }

  downLoad() {
    let fromDate = this.startDate ? this.functionUtility.getDateFormat(new Date(this.startDate)) : '';
    let toDate = this.endDate ? this.functionUtility.getDateFormat(new Date(this.endDate)) : '';
    if (fromDate === 'NaN/NaN/NaN' || toDate === 'NaN/NaN/NaN')
      return this.snotifyService.error('Declare Date Error', 'Error');

    this.spinnerService.show();
    this.ediTransactionService.exportExcel(fromDate, toDate).subscribe({
      next: (result: Blob) => {
        this.functionUtility.exportExcel(result, 'FDITransaction');
      },
      error: () => { this.snotifyService.error('UnknownError', 'Error'); },
      complete: () => this.spinnerService.hide(),
    });
  }

  import(event: any) {
    if (event.target.files && event.target.files[0]) {
      const fileNameExtension = event.target.files[0].name.split('.').pop();
      if (!this.extensions.includes(fileNameExtension)) {
        return this.snotifyService.error('Invalid Extension File', 'Error');
      } else {
        const formData = new FormData();
        formData.append('file', event.target.files[0]);
        this.spinnerService.show();
        this.ediTransactionService.importExcel(formData).subscribe({
          next: (res) => {
            if (res.isSuccess) {
              event.target.value = '';
              this.snotifyService.success('Success', 'Success');
            } else {
              this.snotifyService.error(res.error, 'Error');
            }
            this.inputRef.nativeElement.value = "";
          },
          error: () => {
            event.target.value = '';
            this.snotifyService.error('UnknownError', 'Error');

          }
        }).add(() => this.spinnerService.hide());
      }
    }
  }
}
