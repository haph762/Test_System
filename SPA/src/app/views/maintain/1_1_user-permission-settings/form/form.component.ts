import { Component, ElementRef, Input, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { IconButton } from '@constants/common.constants';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { ModalService } from '@services/modal.service';
import { InjectBase } from '@utilities/inject-base-app';
import { Users } from '@models/common/users';
import { S_1_1_UserPermissionSettingsService } from '@services/maintain/s-1-1-user-permission-settings.service';
import { CaptionConstants, MessageConstants } from '@constants/message.enum';

@Component({
  selector: 'app-form',
  templateUrl: './form.component.html',
  styleUrls: ['./form.component.scss']
})
export class FormComponent extends InjectBase implements OnInit, OnDestroy {
  @Input() id: string;
  user: Users;
  userEditConst: Users;
  IConButton = IconButton;
  type: string = 'Add';
  @ViewChild('modalUser', { static: false }) modalUser: ModalDirective;
  constructor(private modalService: ModalService,
    private userPermissionSettingService: S_1_1_UserPermissionSettingsService,
    private el: ElementRef) {
    super();
  }

  ngOnInit() {
    if (!this.id) {
      return;
    }
    this.modalService.add(this);
    this.userPermissionSettingService.editUserSource.asObservable().subscribe((res) => {
      this.user = res ? res : <Users>{ is_active: true };
      this.type = (this.functionUtility.checkEmpty(this.user.account)) ? 'Add' : 'Edit';
      if (this.type === 'Edit') {
        this.userEditConst = JSON.parse(JSON.stringify(this.user));
      }
    })
  }

  addOrEditUser() {
    this.spinnerService.show();
    if (this.type === 'Add') {
      this.userPermissionSettingService.addUser(this.user).subscribe({
        next: (res) => {
          if (res) {
            this.modalUser.hide();
            this.userPermissionSettingService.changeDataSource.next(true);
            this.snotifyService.success(MessageConstants.CREATED_OK_MSG, CaptionConstants.SUCCESS);
          } else {
            this.snotifyService.error(MessageConstants.CREATED_ERROR_MSG, CaptionConstants.ERROR);
          }
        },
        error: () => {
          this.snotifyService.error(MessageConstants.UN_KNOWN_ERROR, CaptionConstants.ERROR);
          this.spinnerService.hide();
        },
        complete: () => {
          this.spinnerService.hide();
        }
      });
    } else {
      if (JSON.stringify(this.user) === JSON.stringify(this.userEditConst)) {
        this.snotifyService.error('Please change info user', CaptionConstants.ERROR);
        this.spinnerService.hide();
      } else {
        this.userPermissionSettingService.editUser(this.user).subscribe({
          next: (res) => {
            this.modalUser.hide();
            this.userPermissionSettingService.changeDataSource.next(true);
            this.snotifyService.success(MessageConstants.UPDATED_OK_MSG, CaptionConstants.SUCCESS);
          },
          error: () => {
            this.snotifyService.error(MessageConstants.UPDATED_ERROR_MSG, CaptionConstants.ERROR);
            this.spinnerService.hide();
          },
          complete: () => {
            this.spinnerService.hide();
          }
        })
      }
    }
  }
  open() {
    this.modalUser.show();
  }

  // remove self from modal service when directive is destroyed
  ngOnDestroy(): void {
    this.modalService.remove(this.id);
    this.el.nativeElement.remove();
  }
}
