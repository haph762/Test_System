import { Injectable } from '@angular/core';
import {HttpClient, HttpParams} from '@angular/common/http';
import {environment} from '@env/environment';
import {PaginationParam, PaginationResult} from '@utilities/pagination-utility';
import {Users} from '@models/common/users';
import {BehaviorSubject} from 'rxjs';
import {RolesUserStatus} from "@models/maintain/user-permission-settings";

@Injectable({
  providedIn: 'root'
})
export class S_1_1_UserPermissionSettingsService {
  apiUrl = environment.apiUrl;
  changeDataSource = new BehaviorSubject<boolean>(false);
  editUserSource = new BehaviorSubject<Users>(null);
  constructor(private http: HttpClient) { }
  getDataUsers(pagination: PaginationParam, account: string, is_active: string) {
    is_active = is_active === null ? 'all': is_active;
    const params = new HttpParams().appendAll({...pagination, account, is_active});
    return this.http.get<PaginationResult<Users>>(`${this.apiUrl}C_1_1_UserPermissionSettings/getDataUsers`, { params });
  }
  addUser(user: Users) {
    return this.http.post<boolean>(`${this.apiUrl}C_1_1_UserPermissionSettings/addUser`, user);
  }

  editUser(user: Users) {
    return this.http.put<boolean>(`${this.apiUrl}C_1_1_UserPermissionSettings/editUser`, user);
  }

  getRoleUser(account: string) {
    return this.http.get<RolesUserStatus[]>(`${this.apiUrl}C_1_1_UserPermissionSettings/getRoleUser`, {params: {account: account}});
  }

  updateRolesUser(data: RolesUserStatus[]) {
    return this.http.post<boolean>(`${this.apiUrl}C_1_1_UserPermissionSettings/updateRolesUser`, data);
  }
}
