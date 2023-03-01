import { Component, OnInit } from '@angular/core';
import {IconButton} from '@constants/common.constants';
import {Users} from '@models/common/users';
import {Pagination} from '@utilities/pagination-utility';
import {S_1_1_UserPermissionSettingsService} from '@services/maintain/s-1-1-user-permission-settings.service';
import {InjectBase} from '@utilities/inject-base-app';
import {CaptionConstants, MessageConstants} from '@constants/message.enum';
import {PageChangedEvent} from 'ngx-bootstrap/pagination';
import { ModalService } from '@services/modal.service';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.scss']
})
export class MainComponent extends InjectBase  implements OnInit  {
  account: string = '';
  is_active: string = 'all';
  actives = [
    { id: 'all', name: 'All'},
    { id: '1', name: 'Active'},
    { id: '0', name: 'No Active'},
  ]
  IconButton = IconButton;
  users: Users[] = [];
  pagination: Pagination = <Pagination> {
    pageNumber: 1,
    pageSize: 10
  };
  title: string = '';
  constructor(private userPermissionSettingService: S_1_1_UserPermissionSettingsService,
              private modalService: ModalService) {
    super();
  }

  ngOnInit() {
    this.route.data.subscribe(res => this.title = res['title']);
    this.userPermissionSettingService.changeDataSource.asObservable().subscribe((res) => {
      this.getDataUsers();
    })
    this.getDataUsers();
  }

  getDataUsers() {
    this.spinnerService.show();
    this.userPermissionSettingService.getDataUsers(this.pagination, this.account, this.is_active).subscribe({
      next: (res) => {
        this.users = res.result;
        this.pagination = res.pagination;
      },
      error: () => {
        this.snotifyService.error(MessageConstants.UN_KNOWN_ERROR, CaptionConstants.ERROR);
        this.spinnerService.hide();
      },
      complete: () => {
        this.spinnerService.hide();
      }
    });
  }
  search() {
    this.pagination.pageNumber === 1 ? this.getDataUsers() : this.pagination.pageNumber = 1;
  }
  openModalUser(id: string, user?: Users) {
    if(user) {
      this.userPermissionSettingService.editUserSource.next(user);
    } else {
      this.userPermissionSettingService.editUserSource.next(null);
    }
    this.modalService.open(id);
  }
  clear() {
    this.account = '';
    this.is_active = 'all';
    this.search();
  }
  pageChanged(e: PageChangedEvent) {
    this.pagination.pageNumber = e.page;
    this.getDataUsers();
  }
}
