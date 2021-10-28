import 'package:angular/angular.dart';
import 'package:amplify_explorer/home_component.template.dart' as home;
import 'package:amplify_explorer/service/transform_service.dart';

import 'main.template.dart' as ng;

void main() {
  runApp(home.HomeComponentNgFactory, createInjector: injector);
}

@GenerateInjector(const [
  const ClassProvider(TransformService),
])
final InjectorFactory injector = ng.injector$Injector;
