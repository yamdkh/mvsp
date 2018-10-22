import 'dart:async';

import 'package:mvsp/Model/Person.dart';
import 'package:mvsp/Presenter/Injector.dart';

abstract class ContractFetchPerson {
  void fetchPersonList(List<Person> persons);
}

class PresenterPerson {
  ContractFetchPerson contractPerson;
  PersonRepository personRepository;

  PresenterPerson(this.contractPerson) {
    personRepository = Injector().personsData;
  }

  Future<void> load() async {
    contractPerson.fetchPersonList(await personRepository.fetchPersonRepo());
  }
}


