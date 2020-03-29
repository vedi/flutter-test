import 'package:motivator/components/app.dart';
import 'package:motivator/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../data_provider.dart';
import 'actions/actions.dart';
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


List<Middleware<AppState>> _createNavigationMiddleware() {
  return [
    TypedMiddleware<AppState, NavigateReplaceAction>(_navigateReplace),
    TypedMiddleware<AppState, NavigatePushAction>(_navigate),
  ];
}

_navigateReplace(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigateReplaceAction).routeName;
  if (store.state.route.last != routeName) {
    navigatorKey.currentState.pushReplacementNamed(routeName);
  }
  next(action);
}

_navigate(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigatePushAction).routeName;
  if (store.state.route.last != routeName) {
    navigatorKey.currentState.pushNamed(routeName);
  }
  next(action);
}

List<Middleware<AppState>> createMiddleware(
  DataProvider dataProvider,
) {
  return [
    ..._createNavigationMiddleware(),
    _appThunkActionMiddleware,
    thunkMiddleware,
  ];
}
