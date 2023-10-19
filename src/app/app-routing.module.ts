import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CellComponent } from './cell/cell.component';
import { HomeComponent } from './home/home.component';
import { NotFoundComponent } from './not-found/not-found.component';
import { LevelUpComponent } from './level-up/level-up.component';
import { ArenaComponent } from './arena/arena.component';
import { VersusComponent } from './versus/versus.component';
import { FightComponent } from './fight/fight.component';
import { AchievementsComponent } from './achievements/achievements.component';
import { BruteNotFoundComponent } from './brute-not-found/brute-not-found.component';
import { HallComponent } from './hall/hall.component';
import { TournamentGlobalComponent } from './tournament-global/tournament-global.component';
import { TournamentComponent } from './tournament/tournament.component';
import { RankingComponent } from './ranking/ranking.component';
import { DestinyComponent } from './destiny/destiny.component';
import { TournamentHistoryComponent } from './tournament-history/tournament-history.component';

const routes: Routes = [
  {
    path: '',
    component: HomeComponent
  },
  {
    path: 'oauth/callback',
    component: HomeComponent
  },
  {
    path: 'achievements',
    component: AchievementsComponent
  },
  {
    path: 'brute-not-found',
    component: BruteNotFoundComponent
  },
  {
    path: 'hall',
    component: HallComponent
  },
  {
    path: ':brutName',
    children: [
      {
        path: 'cell',
        component: CellComponent
      },
      {
        path: 'level-up',
        component: LevelUpComponent
      },
      {
        path: 'arena',
        component: ArenaComponent
      },
      {
        path: 'versus/:opponentName',
        component: VersusComponent
      },
      {
        path: 'fight/:fightID',
        component: FightComponent
      },
      {
        path: 'tournament/global/:date',
        component: TournamentGlobalComponent
      },
      {
        path: 'tournament/:date',
        component: TournamentComponent
      },
      {
        path: 'ranking',
        component: RankingComponent
      },
      {
        path: 'ranking/:rank',
        component: RankingComponent
      },
      {
        path: 'destiny',
        component: DestinyComponent
      },
      {
        path: 'tournaments',
        component: TournamentHistoryComponent
      },
      {
        path: 'achievements',
        component: AchievementsComponent
      },
      {
        path: '',
        redirectTo: 'cell',
        pathMatch: 'full'
      }
    ]
  },
  {
    path: '**',
    component: NotFoundComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
