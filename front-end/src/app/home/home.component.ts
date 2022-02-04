import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  template: `
    <section class="hero is-primary is-bold is-fullheight-with-navbar">
    <div class="hero-body">
    <div class="container has-text-centered">
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <h1 class="title" style="color:orange;font-style:italic;font-size:400%;-webkit-text-stroke-width: 1px;
  -webkit-text-stroke-color: black;">
    The GatoRest Inn  
    </h1>
    </div>
    </div>
    </section>
  `,
  styles: [`
    .hero{
      background-image:url('/assets/images/home-background.jpg') !important;
      background-size:cover;
      background-position:center center;
    }
  `]
})
export class HomeComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

}
