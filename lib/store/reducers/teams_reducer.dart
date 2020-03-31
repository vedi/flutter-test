import 'package:motivator/models/team.dart';
import 'package:motivator/store/actions/actions.dart';
import 'package:redux/redux.dart';

final teamsReducer = combineReducers<List<Team>>([
  TypedReducer<List<Team>, RequestTeamsDEAction>((state, action) {
    return [];
  }),
  TypedReducer<List<Team>, CancelTeamsDEAction>((state, action) {
    return null;
  }),
  TypedReducer<List<Team>, TeamsDEAction>((state, action) {
    return action.teams;
  }),
]);
