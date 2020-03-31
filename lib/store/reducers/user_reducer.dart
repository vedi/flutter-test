import 'package:redux/redux.dart';
import 'package:motivator/models/user.dart';
import 'package:motivator/store/actions/thunk_actions.dart';

final userReducer = combineReducers<User>([
  TypedReducer<User, LoginResultAction>((state, action) {
    return action.user;
  }),
  TypedReducer<User, LogoutAction>((state, action) {
    return null;
  }),
]);
