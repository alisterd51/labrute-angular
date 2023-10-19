import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TournamentHistoryComponent } from './tournament-history.component';

describe('TournamentHistoryComponent', () => {
  let component: TournamentHistoryComponent;
  let fixture: ComponentFixture<TournamentHistoryComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [TournamentHistoryComponent]
    });
    fixture = TestBed.createComponent(TournamentHistoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
