import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BruteNotFoundComponent } from './brute-not-found.component';

describe('BruteNotFoundComponent', () => {
  let component: BruteNotFoundComponent;
  let fixture: ComponentFixture<BruteNotFoundComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [BruteNotFoundComponent]
    });
    fixture = TestBed.createComponent(BruteNotFoundComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
