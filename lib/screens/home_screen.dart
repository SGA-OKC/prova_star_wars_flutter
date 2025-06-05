import 'package:flutter/material.dart';
import '../models/character.dart';
import '../services/swapi_service.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personagens Star Wars')),
      body: FutureBuilder<List<Character>>(
        future: SwapiService.fetchCharacters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erro: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum personagem encontrado.'));
          } else {
            final characters = snapshot.data!;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return ListTile(
                  title: Text(character.name),
                  subtitle: Text('Nascimento: ${character.birthYear}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(character: character),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
