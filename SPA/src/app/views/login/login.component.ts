import { Component, OnInit } from "@angular/core";
import { InjectBase } from "@utilities/inject-base-app";
import { UserLoginParam } from '@models/auth/auth';
import { AuthService } from '@services/auth/auth.service';
import {CaptionConstants, MessageConstants} from '@constants/message.enum';
@Component({
  selector: "app-dashboard",
  templateUrl: "login.component.html",
  styleUrls: ["./login.component.scss"],
})
export class LoginComponent extends InjectBase implements OnInit {
  user: UserLoginParam = <UserLoginParam>{};

  constructor(
    private authService: AuthService
  ) {
    super();
  }

  ngOnInit() {
   if (this.authService.loggedIn) this.router.navigate(["/dashboard"]);
  }

  login() {
    this.spinnerService.show();
    this.authService.login(this.user).subscribe({
      next: () => {
        this.snotifyService.success(
          MessageConstants.LOGGED_IN,
          CaptionConstants.SUCCESS);
        this.spinnerService.hide();
      },
      error: () => {
        this.snotifyService.error(MessageConstants.LOGIN_FAILED, CaptionConstants.ERROR);
        this.spinnerService.hide();
      },
      complete: () => {
        this.router.navigate(["/dashboard"]);
        this.spinnerService.hide();
      }
    });
  }
}
