import 'dart:convert';
import 'package:http/http.dart' as http;

class VehicleService {
  final String proxyUrl = 'https://api.allorigins.win/raw?url=';

  Future<List<Map<String, dynamic>>> fetchVehicles() async {
    final url = '${proxyUrl}https://swapi.dev/api/vehicles/';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List vehicles = data['results'];
      return vehicles.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Erro ao carregar veículos');
    }
  }
}
