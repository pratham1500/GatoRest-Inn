import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-contact',
  template: `
    <section class="hero is-primary is-bold">
      <div class="hero-body">
      <div class="container">
      <h1 class = "title">Contact Us</h1>
</div>
</div>
</section>
<section class ="section">
  <div class="container">
     <form>
       <div class ="field">
         <label class="label">Name</label>
         <input type ="type" name="name" class="input">
</div>
<div class ="field">
         <label class="label">Email</label>
         <input type ="type" name="email" class="input">
</div>
<div class ="field">
         <label class="label">Your Message</label>
         <textarea name="message" class="textarea"></textarea>
</div>

<button type="submit" class="button is-large is-warning">
Send
</button>

</form>
</div>
</section>
  `,
  styles: [
  ]
})
export class ContactComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

}
