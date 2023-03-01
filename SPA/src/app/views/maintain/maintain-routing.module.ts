import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { getInfoMenu } from '@utilities/function-utility';
import {AppGuard} from "@guards/app.guard";

const routes: Routes = [
  {
    path: 'user-permission-settings',
    canLoad: [AppGuard],
    loadChildren: () => import('./1_1_user-permission-settings/user-permission-setting.module').then(m => m.UserPermissionSettingModule),
    data: {
      role: getInfoMenu('1.1')?.unique
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MaintainRoutingModule { }
