import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-signup',
  template: `
   <section class="hero is-primary is-bold">
      <div class="hero-body">
      <div class="container">
      <h1 class = "title">Sign Up</h1>
</div>
</div>
</section>
<section class ="section">
  <div class="container">
     <form>
     <div class ="field">
         <label class="label">First Name</label>
         <input type ="type" name="firstname" class="name">
</div>
<div class ="field">
         <label class="label">Last Name</label>
         <input type ="type" name="lastname" class="name">
</div>
       <div class ="field">
         <label class="label">Email ID</label>
         <input type ="type" name="email" class="id">
</div>
<div class ="field">
         <label class="label"> Create Password</label>
         <input type="password" name ="password" class="password">
</div>
<div class ="field">
         <label class="label"> Re-enter Password</label>
         <input type="password" name ="password" class="password">
</div>

<button type="submit" class="button is-medium is-warning">
Sign Up
</button>

</form>
</div>
</section>
  `,
  styles: [
  ]
})
export class SignupComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

}
