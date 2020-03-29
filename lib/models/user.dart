import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

@immutable
class User {
  final String name;

  User({this.name});

  User copyWith({
    String name,
  }) {
    return User(
      name: name,
    );
  }

  @override
  int get hashCode =>
      name.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  String toString() {
    return 'User{name: $name}';
  }

  factory User.fromFirebaseUser(FirebaseUser firebaseUser) {
    return User(name: firebaseUser.displayName);
  }
}
