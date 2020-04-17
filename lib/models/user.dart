import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User extends Equatable {
  final String id;
  final String email;

  User({this.id, this.email});

  User copyWith({
    String id,
    String email,
  }) {
    return User(
      id: id,
      email: email,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }

  factory User.fromData(FirebaseUser firebaseUser) {
    return User(
      id: firebaseUser.uid,
      email: firebaseUser.email,
    );
  }

  @override
  List<Object> get props => [id, email];
}
