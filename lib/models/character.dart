class Character {
  final String name;
  final String gender;
  final String birthYear;

  Character({required this.name, required this.gender, required this.birthYear});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] ?? 'Desconhecido',
      gender: json['gender'] ?? 'Desconhecido',
      birthYear: json['birth_year'] ?? 'Desconhecido',
    );
  }
}
