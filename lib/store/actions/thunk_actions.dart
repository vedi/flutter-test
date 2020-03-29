import 'package:motivator/models/app_state.dart';
import 'package:motivator/models/user.dart';
import 'package:redux/redux.dart';

import '../../api_helper.dart';

abstract class AppThunkAction {
  run(Store<AppState> store);
}

class LoginAction extends AppThunkAction {
  run(Store<AppState> store) async {
    final user = await ApiHelper.instance.loginWithGoogle();
    store.dispatch(LoginResultAction(user));
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
