import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { C26EdiTransactionRoutingModule } from './c-2-6-edi-transaction-routing.module';
import { MainComponent } from './main/main.component';
import { BsDatepickerModule } from 'ngx-bootstrap/datepicker';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    MainComponent
  ],
  imports: [
    CommonModule,
    C26EdiTransactionRoutingModule,
    BsDatepickerModule.forRoot(),
    FormsModule,
    ReactiveFormsModule,
  ]
})
export class C26EdiTransactionModule { }
