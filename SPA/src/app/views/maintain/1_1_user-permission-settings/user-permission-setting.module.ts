import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgxSpinnerModule } from 'ngx-spinner';
import { PaginationModule } from "ngx-bootstrap/pagination";
import { ModalModule } from "ngx-bootstrap/modal";
import {UserPermissionSettingRoutingModule} from './user-permission-setting-routing.module';
import {MainComponent} from './main/main.component';
import {FormComponent} from './form/form.component';
import {SettingRoleComponent} from "./setting-role/setting-role.component";
import {NgSelectModule} from "@ng-select/ng-select";

@NgModule({
  declarations: [
    MainComponent,
    FormComponent,
    SettingRoleComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule ,
    NgxSpinnerModule,
    PaginationModule.forRoot(),
    ModalModule.forRoot(),
    NgSelectModule,
    UserPermissionSettingRoutingModule

  ]
})
export class UserPermissionSettingModule { }
