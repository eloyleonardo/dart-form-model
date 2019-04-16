import 'package:angular/angular.dart';
import 'package:dart_form_model/src/test_component.dart';

@Component(
  selector: 'my-app',
  template: '''
    <h1>ngFormModel test</h1>
    <app-test></app-test>
  ''',
  directives: [TestComponent],
)
class AppComponent {}
