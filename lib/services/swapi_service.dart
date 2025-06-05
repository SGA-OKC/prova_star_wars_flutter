import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class SwapiService {
  static Future<List<Character>> fetchCharacters() async {
    // Novo proxy confiável
    final encodedUrl = Uri.encodeComponent('https://swapi.dev/api/people/');
    final proxyUrl = 'https://api.allorigins.win/get?url=$encodedUrl';

    final response = await http.get(Uri.parse(proxyUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final contents = json.decode(data['contents']); // Aqui é o truque
      final List results = contents['results'];
      return results.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar personagens (status ${response.statusCode})');
    }
  }
}
