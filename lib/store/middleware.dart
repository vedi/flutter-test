import 'package:motivator/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../data_provider.dart';
import 'actions/thunk_actions.dart';

void _appThunkActionMiddleware<AppState>(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) {
  if (action is AppThunkAction) {
    next(action.run);
  } else {
    next(action);
  }
}

List<Middleware<AppState>> createMiddleware(
  DataProvider dataProvider,
) {
  return [
    _appThunkActionMiddleware,
    thunkMiddleware,
  ];
}
