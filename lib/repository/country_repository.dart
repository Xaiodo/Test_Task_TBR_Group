import 'dart:convert';

import 'package:test_task/models/country.dart';
import 'package:http/http.dart' as http;

class CountryRepository {
  final String baseUrl = 'https://restcountries.com/v2';

  Future<List<Country>?> getAll() async {
    try {
      final resposne = await http.get(Uri.parse('$baseUrl/all'));
      if (resposne.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(resposne.body);
        return List.generate(
          responseBody.length,
          (index) {
            return Country.fromJson(responseBody[index]);
          },
        );
      }
    } catch (e) {}
    return null;
  }
}
