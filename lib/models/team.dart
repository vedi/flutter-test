import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

@immutable
class Team {
  final String name;

  Team({this.name});

  factory Team.fromSnapshot(DocumentSnapshot snapshot) {
    return Team(name: snapshot.data["name"]);
  }

  Team copyWith({
    String name,
  }) {
    return Team(
      name: name,
    );
  }

  @override
  int get hashCode =>
      name.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Team &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  String toString() {
    return 'Team{name: $name}';
  }
}
