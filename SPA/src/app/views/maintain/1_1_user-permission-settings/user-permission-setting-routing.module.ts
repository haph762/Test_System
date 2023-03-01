import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MainComponent } from './main/main.component';
import {getInfoMenu} from "@utilities/function-utility";
const routes: Routes = [
  {
    path: '',
    component: MainComponent,
    data: {
      title: getInfoMenu('1.1')?.name
    }
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class UserPermissionSettingRoutingModule {

}
