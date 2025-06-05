import 'package:flutter/material.dart';
import '../services/vehicle_service.dart';

class VehiclesScreen extends StatefulWidget {
  @override
  State<VehiclesScreen> createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  late Future<List<Map<String, dynamic>>> _vehiclesFuture;

  @override
  void initState() {
    super.initState();
    _vehiclesFuture = VehicleService().fetchVehicles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Veículos')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _vehiclesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
          if (snapshot.hasError) return Center(child: Text('Erro: ${snapshot.error}'));

          final vehicles = snapshot.data!;
          return ListView.builder(
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              final vehicle = vehicles[index];
              return ListTile(
                title: Text(vehicle['name']),
                subtitle: Text('Modelo: ${vehicle['model']}\nFabricante: ${vehicle['manufacturer']}'),
              );
            },
          );
        },
      ),
    );
  }
}
