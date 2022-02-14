import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-login',
  template: `
     <section class="hero is-primary is-bold">
      <div class="hero-body">
      <div class="container">
      <h1 class = "title">Login</h1>
</div>
</div>
</section>
<section class ="section">
  <div class="container">
     <form>
       <div class ="field">
         <label class="label">Email ID</label>
         <input type ="type" name="email" class="id">
</div>
<div class ="field">
         <label class="label">Password</label>
         <input type="password" name ="password" class="password">
</div>

<button type="submit" class="button is-medium is-warning">
Login
</button>

</form>
</div>
</section>
  `,
  styles: [
  ]
})
export class LoginComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

}
