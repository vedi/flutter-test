import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:motivator/components/organisms/app_drawer.dart';
import 'package:motivator/models/app_state.dart';
import 'package:motivator/store/actions/actions.dart';
import 'package:redux/redux.dart';

class AppDrawerContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return AppDrawer.withBloc(
//          onNavigate: vm.onNavigate,
        );
      },
    );
  }
}

class _ViewModel {
  final Function(String router) onNavigate;

  _ViewModel({
    @required this.onNavigate,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      onNavigate: (String route) => store.dispatch(NavigatePushAction(route)),
    );
  }
}
