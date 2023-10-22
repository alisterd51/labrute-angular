import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DojoComponent } from './dojo.component';

describe('DojoComponent', () => {
  let component: DojoComponent;
  let fixture: ComponentFixture<DojoComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [DojoComponent]
    });
    fixture = TestBed.createComponent(DojoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
