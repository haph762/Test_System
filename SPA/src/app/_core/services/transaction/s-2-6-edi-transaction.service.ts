import { OperationResult } from '@utilities/operation-result';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '@env/environment';

@Injectable({
  providedIn: 'root'
})
export class S_2_6EdiTransactionService {

  apiUrl: string = `${environment.apiUrl}C_2_6_EDITransaction/`;
  constructor(
    private http: HttpClient,
  ) { }

  importExcel(file: FormData) {
    return this.http.post<OperationResult>(`${this.apiUrl}ImportExcel`, file, {});
  }
  exportExcel(startDate: string, endDate: string) {
    let params = new HttpParams().set('startDate', startDate).set('endDate', endDate);
    return this.http.get(`${this.apiUrl}ExportExcel`, { params: params, responseType: 'blob' });
  }
}
