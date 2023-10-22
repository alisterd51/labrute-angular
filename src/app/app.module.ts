import { NgModule, isDevMode } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ServiceWorkerModule } from '@angular/service-worker';
import { CellComponent } from './cell/cell.component';
import { LevelUpComponent } from './level-up/level-up.component';
import { ArenaComponent } from './arena/arena.component';
import { VersusComponent } from './versus/versus.component';
import { FightComponent } from './fight/fight.component';
import { TournamentComponent } from './tournament/tournament.component';
import { TournamentGlobalComponent } from './tournament-global/tournament-global.component';
import { RankingComponent } from './ranking/ranking.component';
import { DestinyComponent } from './destiny/destiny.component';
import { TournamentHistoryComponent } from './tournament-history/tournament-history.component';
import { AchievementsComponent } from './achievements/achievements.component';
import { NotFoundComponent } from './not-found/not-found.component';
import { HomeComponent } from './home/home.component';
import { BruteNotFoundComponent } from './brute-not-found/brute-not-found.component';
import { HallComponent } from './hall/hall.component';
import { DojoComponent } from './dojo/dojo.component';

@NgModule({
  declarations: [
    AppComponent,
    CellComponent,
    LevelUpComponent,
    ArenaComponent,
    VersusComponent,
    FightComponent,
    TournamentComponent,
    TournamentGlobalComponent,
    RankingComponent,
    DestinyComponent,
    TournamentHistoryComponent,
    AchievementsComponent,
    NotFoundComponent,
    HomeComponent,
    BruteNotFoundComponent,
    HallComponent,
    DojoComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ServiceWorkerModule.register('ngsw-worker.js', {
      enabled: !isDevMode(),
      // Register the ServiceWorker as soon as the application is stable
      // or after 30 seconds (whichever comes first).
      registrationStrategy: 'registerWhenStable:30000'
    })
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
