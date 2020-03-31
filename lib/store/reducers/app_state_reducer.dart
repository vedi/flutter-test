import 'package:motivator/models/app_state.dart';

import 'loading_reducer.dart';
import 'navigation_reducer.dart';
import 'teams_reducer.dart';
import 'user_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    user: userReducer(state.user, action),
    route: navigationReducer(state.route, action),
    teams: teamsReducer(state.teams, action),
  );
}
