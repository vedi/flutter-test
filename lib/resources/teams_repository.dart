import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motivator/models/team.dart';

class TeamsRepository {
  final _collection = Firestore.instance.collection('teams');

  Future<void> create(Team team) {
    return _collection.add(team.toDocument());
  }

  Future<void> delete(Team team) {
    return _collection.document(team.id).delete();
  }

  Stream<List<Team>> fetch() {
    return _collection.snapshots().map((querySnapshot) {
      return querySnapshot.documents
        .map((documentSnapshot) => Team.fromSnapshot(documentSnapshot))
        .toList();
    });
  }

  Future<void> update(Team team) {
    return _collection.document(team.id).updateData(team.toDocument());
  }
}
