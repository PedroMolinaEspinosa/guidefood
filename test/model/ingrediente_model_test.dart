import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:guidefood/src/models/ingredient.dart';

import '../fake/ingrediente_fake.dart';
import '../fixtures/fixture_reader.dart';

void main() {
  test('Ingrediente fromJson should return a valid model', () async {
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('ingrediente.json'));

    final result = Ingrediente.fromJsonMap(jsonMap);

    expect(result, ingrediente1);
  });
}
