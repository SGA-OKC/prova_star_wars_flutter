import 'package:flutter/material.dart';
import '../services/planet_service.dart';

class PlanetsScreen extends StatefulWidget {
  @override
  State<PlanetsScreen> createState() => _PlanetsScreenState();
}

class _PlanetsScreenState extends State<PlanetsScreen> {
  late Future<List<Map<String, dynamic>>> _planetsFuture;

  @override
  void initState() {
    super.initState();
    _planetsFuture = PlanetService().fetchPlanets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Planetas')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _planetsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          if (snapshot.hasError) return Center(child: Text('Erro: ${snapshot.error}'));

          final planets = snapshot.data!;
          return ListView.builder(
            itemCount: planets.length,
            itemBuilder: (context, index) {
              final planet = planets[index];
              return ListTile(
                title: Text(planet['name']),
                subtitle: Text('Clima: ${planet['climate']}\nTerreno: ${planet['terrain']}'),
              );
            },
          );
        },
      ),
    );
  }
}
