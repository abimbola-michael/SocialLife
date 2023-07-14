// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String name;
  String img;
  String message;
  User({
    required this.name,
    required this.img,
    required this.message,
  });

  User copyWith({
    String? name,
    String? img,
    String? message,
  }) {
    return User(
      name: name ?? this.name,
      img: img ?? this.img,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'img': img,
      'message': message,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: (map["name"] ?? '') as String,
      img: (map["img"] ?? '') as String,
      message: (map["message"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, img: $img, message: $message)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.img == img && other.message == message;
  }

  @override
  int get hashCode => name.hashCode ^ img.hashCode ^ message.hashCode;
}
