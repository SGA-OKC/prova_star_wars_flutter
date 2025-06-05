import 'package:flutter/material.dart';
import '../models/character.dart';

class DetailsScreen extends StatelessWidget {
  final Character character;

  const DetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${character.name}', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            Text('Gênero: ${character.gender}'),
            Text('Ano de nascimento: ${character.birthYear}'),
          ],
        ),
      ),
    );
  }
}
