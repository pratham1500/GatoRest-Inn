import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-header',
  template: `
    <div class="navbar is-light">
      <div class="navbar-brand">
        <a class="navbar-item" routerLink="/">
          <img src="assets/images/logo.png" >
        </a>
      </div>
      <div class="navbar-end">
      <div class="buttons">
        <a class="button" routerLink="/contact"><strong>Contact Us</strong></a>
        <a class="button is-warning"><strong>Sign Up</strong></a>
        <a class="button is-dark"><strong>Login</strong></a>
      </div>
    </div>
    </div>
  `,
  styles: [
  ]
})
export class HeaderComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

}
