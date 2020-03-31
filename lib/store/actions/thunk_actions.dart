import 'package:motivator/models/app_state.dart';
import 'package:motivator/models/user.dart';
import 'package:redux/redux.dart';

import '../../api_helper.dart';
import '../../routes.dart';
import 'actions.dart';

abstract class AppThunkAction {
  run(Store<AppState> store);
}

class LoginAction extends AppThunkAction {
  run(Store<AppState> store) async {
    final user = await ApiHelper.instance.loginWithGoogle();
    store.dispatch(LoginResultAction(user));
    store.dispatch(NavigatePushAction(Routes.home));
  }

  @override
  String toString() {
    return 'LoginAction{}';
  }
}

class LoginResultAction {
  final User user;
  LoginResultAction(this.user);

  @override
  String toString() {
    return 'LoginResultAction{user: $user}';
  }
}

class LogoutAction extends AppThunkAction {
  run(Store<AppState> store) async {
    await ApiHelper.instance.logout();
    store.dispatch(LogoutResultAction());
    store.dispatch(NavigatePushAction(Routes.login));
  }
  @override
  String toString() {
    return 'LogoutAction{}';
  }
}

class LogoutResultAction {
  LogoutResultAction();

  @override
  String toString() {
    return 'LogoutResultAction{}';
  }
}
