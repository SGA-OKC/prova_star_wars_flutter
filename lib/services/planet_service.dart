import 'dart:convert';
import 'package:http/http.dart' as http;

class PlanetService {
  final String proxyUrl = 'https://api.allorigins.win/raw?url=';

  Future<List<Map<String, dynamic>>> fetchPlanets() async {
    final url = '${proxyUrl}https://swapi.dev/api/planets/';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List planets = data['results'];
      return planets.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Erro ao carregar planetas');
    }
  }
}
