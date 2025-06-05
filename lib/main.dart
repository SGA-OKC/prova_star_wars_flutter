import 'package:flutter/material.dart';
import 'screens/planets_screen.dart';
import 'screens/vehicles_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars API',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Star Wars API')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Ver Planetas'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => PlanetsScreen()));
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Ver Veículos'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => VehiclesScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
