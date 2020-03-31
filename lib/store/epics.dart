import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motivator/models/team.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:motivator/models/app_state.dart';
import 'package:motivator/store/actions/actions.dart';

Stream<dynamic> teamsEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return actions
      .where((action) => action is RequestTeamsDEAction)
      .flatMap((requestAction) {
        return _getTeams()
          .map((snapshot) {
            return new TeamsDEAction(
                snapshot.documents
                    .map((documentSnapshot) => Team.fromSnapshot(documentSnapshot))
            );
          })
          .takeUntil(actions.where((action) => action is CancelTeamsDEAction));
  });
}

Stream<QuerySnapshot> _getTeams() {
  return Firestore.instance.collection("teams")
      .snapshots();
}
