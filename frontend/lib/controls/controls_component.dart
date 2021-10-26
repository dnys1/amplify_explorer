import 'package:angular/angular.dart';
import 'package:fo_components/fo_components.dart';

@Component(
  selector: 'controls',
  templateUrl: 'controls_component.html',
  styleUrls: ['controls_component.css'],
  directives: [
    FoRadioGroupComponent,
    FoRadioComponent,
  ],
)
class ControlsComponent {
  Object? value = 'a';
}
