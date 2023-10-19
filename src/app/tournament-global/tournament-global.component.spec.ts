import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TournamentGlobalComponent } from './tournament-global.component';

describe('TournamentGlobalComponent', () => {
  let component: TournamentGlobalComponent;
  let fixture: ComponentFixture<TournamentGlobalComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [TournamentGlobalComponent]
    });
    fixture = TestBed.createComponent(TournamentGlobalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
