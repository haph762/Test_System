import {Component, ElementRef, Input, OnDestroy, OnInit, ViewChild} from '@angular/core';
import {S_1_1_UserPermissionSettingsService} from "@services/maintain/s-1-1-user-permission-settings.service";
import {ModalService} from "@services/modal.service";
import {ModalDirective} from "ngx-bootstrap/modal";
import {InjectBase} from "@utilities/inject-base-app";
import {IconButton} from "@constants/common.constants";
import {Users} from "@models/common/users";
import {RolesUserStatus} from "@models/maintain/user-permission-settings";
import {CaptionConstants, MessageConstants} from "@constants/message.enum";

@Component({
  selector: 'app-setting-role',
  templateUrl: './setting-role.component.html',
  styleUrls: ['./setting-role.component.css']
})
export class SettingRoleComponent extends InjectBase implements OnInit, OnDestroy {
  @Input() id: string;
  @ViewChild('modalAuthorizationUser', {static: false}) modalAuthorizationUser: ModalDirective;
  IconButton = IconButton;
  user: Users = <Users>{};
  rolesUser: RolesUserStatus[] = [];
  rolesUserConst: RolesUserStatus[] = [];
  constructor(private userPermissionSettingService: S_1_1_UserPermissionSettingsService,
              private modalService: ModalService,
              private el: ElementRef) {
    super();
  }

  ngOnInit() {
    if(! this.id)
      return
    this.modalService.add(this);
    this.userPermissionSettingService.editUserSource.asObservable().subscribe((res) => {
      this.user = res;
      if(this.user) {
        this.getRoleUser();
      }
    })
  }

  getRoleUser() {
    this.spinnerService.show();
    this.userPermissionSettingService.getRoleUser(this.user.account).subscribe({
      next: (res) => {
        this.rolesUser = res;
        this.rolesUserConst = JSON.parse(JSON.stringify(this.rolesUser));
      },
      error: () => {
        this.spinnerService.hide();
        this.snotifyService.error(MessageConstants.UN_KNOWN_ERROR, CaptionConstants.ERROR);
      },
      complete: () => {
        this.spinnerService.hide();
      }
    })
  }
  updateRolesUser() {
    let checkChangeRole = JSON.stringify(this.rolesUserConst) === JSON.stringify(this.rolesUser);
    if(checkChangeRole) {
      return this.snotifyService.error('Nothing has changed, Please change role of user!!!', CaptionConstants.ERROR)
    }

    this.userPermissionSettingService.updateRolesUser(this.rolesUser).subscribe({
      next: (res) => {
        if(res) {
          this.snotifyService.success(MessageConstants.UPDATED_OK_MSG, CaptionConstants.SUCCESS);
          this.modalAuthorizationUser.hide();
        } else {
          this.snotifyService.error(MessageConstants.UPDATED_ERROR_MSG, CaptionConstants.ERROR);
        }
      },
      error: () => {
        this.snotifyService.error(MessageConstants.UN_KNOWN_ERROR, CaptionConstants.ERROR);
        this.modalAuthorizationUser.hide();
      },
      complete: () => {
        this.modalAuthorizationUser.hide();
      }
    });
  }
  open() {
    this.modalAuthorizationUser.show();
  }

  // remove self from modal service when directive is destroyed
  ngOnDestroy(): void {
    this.modalService.remove(this.id);
    this.el.nativeElement.remove();
  }
}
