import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-footer',
  template: `
    <footer class="footer">
    <table style="width: 100%">
    <colgroup>
      <col span="1" style="width: 30%;padding:0 15;">
      <col span="1" style="width: 17.5%;">
      <col span="1" style="width: 17.5%;">
      <col span="1" style="width: 17.5%;">
      <col span="1" style="width: 17.5%;">
    </colgroup>
    <tbody>
      <tr>
        <th style="font-size: 200%;">GatoRest Inn</th>
        <th style="font-size: 110%;">Explore</th>
        <th style="font-size: 110%;">Visit</th>
        <th style="font-size: 110%;">Connect With Us</th>
        <th style="font-size: 110%;">Admin</th>
      </tr>
      <tr>
        <td>The home for Gators.</td>
        <td style="font-size: 80%;"><a style="color: black;">Home</a></td>
        <td style="font-size: 80%;" rowspan="2"><a style="color: black;">FLG-0270, Florida Gymnasium,<br>University of Florida</a></td>
        <td style="font-size: 80%;"><a style="color: black;">Contact Us</a></td>
        <td style="font-size: 80%;"><a style="color: black;">Admin Login</a></td>
      </tr>
      <tr>
        <td></td>
        <td style="font-size: 80%;"><a style="color: black;">About</a></td>
        <td style="font-size: 80%;">1800-GATOREST</td>

      </tr>
      <tr>
        <td></td>
        <td style="font-size: 80%;"><a style="color: black;">Our Rooms</a></td>
        <td></td>
        <td style="font-size: 80%;"><a style="color: black;">info@gatorestinn.com</a></td>

      </tr>
    </tbody>
</table>
    </footer>
  `,
  styles: [
  ]
})
export class FooterComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

}
