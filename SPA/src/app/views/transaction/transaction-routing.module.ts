import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppGuard } from '@guards/app.guard';
import { getInfoMenu } from '@utilities/function-utility';

const routes: Routes = [
  {
    path: 'edi-transaction',
    canLoad: [AppGuard],
    loadChildren: () => import('./c-2-6-edi-transaction/c-2-6-edi-transaction.module').then(m => m.C26EdiTransactionModule),
    data: {
      role: getInfoMenu('2.6')?.unique
    }
  }

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TransactionRoutingModule { }
