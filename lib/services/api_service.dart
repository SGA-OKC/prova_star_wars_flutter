import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/planet.dart';
import '../models/starship.dart';

class ApiService {
  static const String baseUrl = 'https://swapi.dev/api';

  static Future<List<Planet>> fetchPlanets() async {
    final response = await http.get(Uri.parse('$baseUrl/planets/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results'];
      return results.map((json) => Planet.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar planetas');
    }
  }

  static Future<List<Starship>> fetchStarships() async {
    final response = await http.get(Uri.parse('$baseUrl/starships/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results'];
      return results.map((json) => Starship.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar naves');
    }
  }
}
