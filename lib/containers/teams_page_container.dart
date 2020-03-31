import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:motivator/components/pages/login_page.dart';
import 'package:motivator/components/pages/teams_page.dart';
import 'package:motivator/models/app_state.dart';
import 'package:motivator/models/team.dart';
import 'package:motivator/store/actions/actions.dart';
import 'package:motivator/store/actions/thunk_actions.dart';
import 'package:redux/redux.dart';

class TeamsPageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      onInit: (store) => store.dispatch(new RequestTeamsDEAction()),
      onDispose: (store) => store.dispatch(new CancelTeamsDEAction()),
      builder: (context, vm) {
        return TeamsPage(
          teams: vm.teams,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Team> teams;

  _ViewModel({
    @required this.teams,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      teams: store.state.teams,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is _ViewModel &&
              runtimeType == other.runtimeType &&
              teams == other.teams;

  @override
  int get hashCode => teams.hashCode;
}
