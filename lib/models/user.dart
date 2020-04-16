import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

@immutable
class User {
  final String id;

  User({this.id});

  User copyWith({
    String id,
  }) {
    return User(
      id: id,
    );
  }

  @override
  int get hashCode =>
      id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  String toString() {
    return 'User{id: $id}';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }

  factory User.fromData(Map<String, dynamic> data) {
    return User(id: data['id']);
  }
}
