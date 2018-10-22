import 'dart:async';

import 'package:mvsp/Model/Person.dart';

class MockPerson implements PersonRepository {
  @override
  Future<List<Person>> fetchPersonRepo() {
    return Future.value(mockPersons);
  }
}

final List<Person> mockPersons = [
  Person('Marry', 12, 'Mock'),
  Person('Alex', 32, 'Mock'),
  Person('YahYa', 43, 'Mock'),
  Person('Kind', 65, 'Mock'),
  Person('JoJo', 34, 'Mock'),
  Person('SubWay', 16, 'Mock'),
  Person('Name', 12, 'Mock'),
];
