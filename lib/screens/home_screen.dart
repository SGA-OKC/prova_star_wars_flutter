import 'package:flutter/material.dart';
import '../models/planet.dart';
import '../models/starship.dart';
import '../services/api_service.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Planet>> planets;
  late Future<List<Starship>> starships;

  @override
  void initState() {
    super.initState();
    planets = ApiService.fetchPlanets();
    starships = ApiService.fetchStarships();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Star Wars'),
          bottom: const TabBar(tabs: [
            Tab(text: 'Planetas'),
            Tab(text: 'Naves'),
          ]),
        ),
        body: TabBarView(children: [
          _buildPlanets(),
          _buildStarships(),
        ]),
      ),
    );
  }

  Widget _buildPlanets() {
    return FutureBuilder<List<Planet>>(
      future: planets,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
        if (snapshot.hasError) return Center(child: Text('Erro: ${snapshot.error}'));
        final list = snapshot.data!;
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) {
            final p = list[i];
            return ListTile(
              title: Text(p.name),
              subtitle: Text('Clima: ${p.climate}, População: ${p.population}'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailScreen(planet: p)),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildStarships() {
    return FutureBuilder<List<Starship>>(
      future: starships,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
        if (snapshot.hasError) return Center(child: Text('Erro: ${snapshot.error}'));
        final list = snapshot.data!;
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) {
            final s = list[i];
            return ListTile(
              title: Text(s.name),
              subtitle: Text('Modelo: ${s.model}, Fabricante: ${s.manufacturer}'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailScreen(starship: s)),
              ),
            );
          },
        );
      },
    );
  }
}
