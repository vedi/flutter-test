import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:motivator/components/organisms/app_drawer.dart';
import 'package:motivator/components/pages/login_page.dart';
import 'package:motivator/models/app_state.dart';
import 'package:motivator/store/actions/thunk_actions.dart';
import 'package:motivator/store/selectors.dart';
import 'package:redux/redux.dart';

class LoginPageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return LoginPage(
          onSignInWithGoogle: vm.onFilterSelected,
        );
      },
    );
  }
}

class _ViewModel {
  final Function() onFilterSelected;

  _ViewModel({
    @required this.onFilterSelected,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      onFilterSelected: () {
        store.dispatch(LoginAction());
      },
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              runtimeType == other.runtimeType &&
              onFilterSelected == other.onFilterSelected;

  @override
  int get hashCode => onFilterSelected.hashCode;
}
