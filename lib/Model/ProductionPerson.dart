

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvsp/Model/Person.dart';

class ProductionPerson implements PersonRepository {
  final url = 'https://api.randomuser.me/?results=10';

  @override
  Future<List<Person>> fetchPersonRepo() {
    return http.get(url).then((response) {
      final statusCode = response.statusCode;
      final body = response.body;

      if (statusCode != 200 || body == null) {
        throw Exception(
            'An error while fetch persons data StatusCode $statusCode');
      }

      final decodeBody = json.decode(body);
      final persons = decodeBody['results'] as List;

      return persons.map((prn) => Person.fromMap(prn)).toList();
    });
  }
}