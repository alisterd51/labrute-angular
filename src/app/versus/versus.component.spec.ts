import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VersusComponent } from './versus.component';

describe('VersusComponent', () => {
  let component: VersusComponent;
  let fixture: ComponentFixture<VersusComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [VersusComponent]
    });
    fixture = TestBed.createComponent(VersusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
