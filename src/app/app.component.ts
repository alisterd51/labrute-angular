import { Component } from '@angular/core';
import { Application } from 'pixi.js';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'labrute-angular';

  game = new Application();
}
