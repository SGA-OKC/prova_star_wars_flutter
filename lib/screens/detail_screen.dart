import 'package:flutter/material.dart';
import '../models/planet.dart';
import '../models/starship.dart';

class DetailScreen extends StatelessWidget {
  final Planet? planet;
  final Starship? starship;

  const DetailScreen({super.key, this.planet, this.starship});

  @override
  Widget build(BuildContext context) {
    final isPlanet = planet != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isPlanet ? planet!.name : starship!.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isPlanet
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome: ${planet!.name}', style: TextStyle(fontSize: 20)),
                  Text('Clima: ${planet!.climate}', style: TextStyle(fontSize: 20)),
                  Text('População: ${planet!.population}', style: TextStyle(fontSize: 20)),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome: ${starship!.name}', style: TextStyle(fontSize: 20)),
                  Text('Modelo: ${starship!.model}', style: TextStyle(fontSize: 20)),
                  Text('Fabricante: ${starship!.manufacturer}', style: TextStyle(fontSize: 20)),
                ],
              ),
      ),
    );
  }
}
