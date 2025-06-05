class Vehicle {
  final String name;
  final String model;
  final String manufacturer;
  final String crew;

  Vehicle({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.crew,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      name: json['name'],
      model: json['model'],
      manufacturer: json['manufacturer'],
      crew: json['crew'],
    );
  }
}
