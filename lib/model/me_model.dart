import 'dart:convert';
import 'package:equatable/equatable.dart';

class Me extends Equatable {
  final int id;
  final String? title;
  final String? description;

  const Me({
    required this.id,
    this.title,
    this.description,
  });

  @override
  String toString() => 'Me(id: $id, title: $title, description: $description)';

  Me copyWith({
    int? id,
    String? title,
    String? description,
  }) {
    return Me(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [id, title, description];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory Me.fromMap(Map<String, dynamic> map) {
    return Me(
      id: map['id'] as int,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Me.fromJson(String source) =>
      Me.fromMap(json.decode(source) as Map<String, dynamic>);
}
