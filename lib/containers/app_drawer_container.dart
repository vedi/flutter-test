import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:motivator/components/organisms/app_drawer.dart';
import 'package:motivator/models/app_state.dart';
import 'package:motivator/store/actions/actions.dart';
import 'package:motivator/store/selectors.dart';
import 'package:redux/redux.dart';

class AppDrawerContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return AppDrawer(
          userName: vm.userName,
          onLogout: vm.onLogout,
        );
      },
    );
  }
}

class _ViewModel {
  final String userName;
  final Function() onLogout;

  _ViewModel({
    @required this.userName,
    @required this.onLogout,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      userName: getUser(store.state)?.name,
      onLogout: () => store.dispatch(LogoutAction()),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              runtimeType == other.runtimeType &&
              userName == other.userName;

  @override
  int get hashCode => userName.hashCode;
}
