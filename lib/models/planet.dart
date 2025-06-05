class Planet {
  final String name;
  final String climate;
  final String population;

  Planet({required this.name, required this.climate, required this.population});

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      name: json['name'],
      climate: json['climate'],
      population: json['population'],
    );
  }
}
