import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Team extends Equatable {
  final String id;
  final String name;

  Team({
    @required this.id,
    @required this.name,
  });

  factory Team.fromSnapshot(DocumentSnapshot snapshot) {
    return Team(
      id: snapshot.data["id"],
      name: snapshot.data["name"],
    );
  }

  Team copyWith({
    String id,
    String name,
  }) {
    return Team(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  String toString() {
    return '''Team {
      id: $id
      name: $name
    }''';
  }

  Map<String, Object> toDocument() {
    return {
      id: id,
      name: name,
    };
  }

  @override
  List<Object> get props => [id, name];
}
