import 'dart:async';

abstract class PersonRepository {
  Future<List<Person>> fetchPersonRepo();
}

class Person {
  final String name;
  final int age;
  final String nat;

  const Person(this.name, this.age, this.nat);

  @override
  String toString() {
    return 'Name: $name age: $age Statue: $nat';
  }

  Person.fromMap(Map<String, dynamic> map)
      : name = '${map['name']['first']} ${map['name']['last']}',
        age = map['registered']['age'],
        nat = map['nat'];
}
