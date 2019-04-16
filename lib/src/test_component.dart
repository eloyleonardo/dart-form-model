import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  changeDetection: ChangeDetectionStrategy.OnPush,
  selector: 'app-test',
  template: '''
  <div [ngFormModel]="testForm">
    <input type="text" ngControl="text1">
  </div>
  ''',
  directives: [
    formDirectives,
  ],
  providers: [],
)
class TestComponent implements OnInit {
  ControlGroup testForm;
  final ChangeDetectorRef _changeDetectorRef;

  TestComponent(this._changeDetectorRef);

  @override
  void ngOnInit() {
    int x = 0;
    testForm = _getForm(x++);
    _processForm(testForm);

    Timer.periodic(new Duration(seconds: 5), (_) {
      testForm = _getForm(x++);
      _processForm(testForm);
      _changeDetectorRef.markForCheck();
    });
  }

  _getForm(int seed) {
    return ControlGroup({
      'id': Control('$seed'),
      'text1': Control('label $seed'),
    });
  }

  void _processForm(ControlGroup testForm) {
    testForm.valueChanges.listen((t) => print('changed: ${t}'));
    print('new form: ${testForm.value}');
  }
}
