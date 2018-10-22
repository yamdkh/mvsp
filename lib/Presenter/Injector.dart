
import 'package:mvsp/Model/MockPerson.dart';
import 'package:mvsp/Model/Person.dart';
import 'package:mvsp/Model/ProductionPerson.dart';

class Injector {
  static final Injector _injector = Injector.internal();
  Injector.internal();

  factory Injector() => _injector;
  static SystemIsIn _systemIsIn;

  static void configure(SystemIsIn system) {
    _systemIsIn = system;
  }


  PersonRepository get personsData {
    switch (_systemIsIn) {
      case SystemIsIn.MOCK:
        return MockPerson();
        break;
      default:
        return ProductionPerson();
    }
  }
}

enum SystemIsIn { MOCK, PRODUCTION }
