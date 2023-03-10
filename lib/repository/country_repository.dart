import 'dart:convert';

import 'package:test_task/models/country.dart';
import 'package:http/http.dart' as http;

class CountryRepository {
  final String baseUrl = 'https://restcountries.com/v2';

  Future<List<Country>?> getAll() async {
    try {
      final resposne = await http.get(Uri.parse('$baseUrl/all'));
      if (resposne.statusCode == 200) {
        final responseBody = (json.decode(resposne.body) as List<dynamic>)
            .map((e) => Map<String, dynamic>.from(e))
            .toList();

        return responseBody.map((e) => Country.fromJson(e)).toList();
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
