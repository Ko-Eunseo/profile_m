import 'dart:convert';

class Education {
  final int id;
  final DateTime? from;
  final DateTime? to;
  final String? school;
  final String? title;
  final String? description;
  Education({
    required this.id,
    this.from,
    this.to,
    this.school,
    this.title,
    this.description,
  });

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      id: map['id'] as int,
      from: map['from'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['from'] as int)
          : null,
      to: map['to'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['to'] as int)
          : null,
      school: map['school'] != null ? map['school'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  factory Education.fromJson(String source) =>
      Education.fromMap(json.decode(source) as Map<String, dynamic>);
}
