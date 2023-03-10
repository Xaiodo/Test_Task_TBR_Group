import 'dart:convert';

import 'package:test_task/models/country.dart';
import 'package:http/http.dart' as http;

class CountryRepository {
  final String baseUrl = 'http://restcountries.com/v2';

  Future<Country?> getCountryByAlphacode(String? code) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/alpha/$code'),
      );
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        return Country.fromJson(responseBody);
      } else {
        return Country(
          name: 'Ukraine',
          callingCodes: ['380'],
          flag: 'https://flagcdn.com/ua.svg',
        );
      }
    } catch (e) {
      return null;
    }
  }

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
