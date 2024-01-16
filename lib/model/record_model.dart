import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RecordModel {
  final int id;
  final String? title;
  final String? body;
  final DateTime? createdAt;

  RecordModel({
    required this.id,
    this.title,
    this.body,
    this.createdAt,
  });

  RecordModel copyWith({
    int? id,
    String? title,
    String? body,
    DateTime? createdAt,
  }) {
    return RecordModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory RecordModel.fromMap(Map<String, dynamic> map) {
    return RecordModel(
      id: map['id'] as int,
      title: map['title'] != null ? map['title'] as String : null,
      body: map['body'] != null ? map['body'] as String : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : DateTime.now(),
    );
  }

  factory RecordModel.fromJson(String source) =>
      RecordModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
