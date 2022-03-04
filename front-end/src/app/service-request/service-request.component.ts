import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-service-request',
  template: `
<section class="section is-medium">
  <div class="container has-text-centered">
  <table style="width: 100%;">
    <tr>
      <td style="padding:30px 15px">
        <div class="box">
          <button class="button is-primary">Order Food</button>
        </div>
      </td>
      <td style="padding:30px 15px">
        <div class="box">
          <button class="button is-primary">Request Maintenance</button>
        </div>
      </td>
    </tr>
    <tr>
      <td style="padding:30px 15px">
      <div class="box">
          <button class="button is-primary">Request Housekeeping</button>
        </div>
      </td>
      <td style="padding:30px 15px">
      <div class="box">
          <button class="button is-primary">View Service Requests</button>
        </div>
      </td>
    </tr>
  </table>
</div>
</section>
  `,
  styles: [
  ]
})
export class ServiceRequestComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

}
