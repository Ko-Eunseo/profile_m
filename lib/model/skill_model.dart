import 'dart:convert';

class Skill {
  final int id;
  final String? name;
  final String? description;
  Skill({
    required this.id,
    this.name,
    this.description,
  });
  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      id: map['id'] as int,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  factory Skill.fromJson(String source) =>
      Skill.fromMap(json.decode(source) as Map<String, dynamic>);
}
