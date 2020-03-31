


import 'package:motivator/models/team.dart';

class TodosNotLoadedAction {}

class NavigateReplaceAction {
  final String routeName;

  NavigateReplaceAction(this.routeName);

  @override
  String toString() {
    return 'NavigateReplaceAction{routeName:$routeName}';
  }
}

class NavigatePushAction {
  final String routeName;

  NavigatePushAction(this.routeName);

  @override
  String toString() {
    return 'NavigatePushAction{routeName:$routeName}';
  }
}

class NavigatePopAction {
  @override
  String toString() {
    return 'NavigatePopAction{}';
  }
}

class RequestTeamsDEAction {
  @override
  String toString() {
    return 'RequestTeams{}';
  }
}

class CancelTeamsDEAction {
  @override
  String toString() {
    return 'CancelTeamsDEAction{}';
  }
}

class TeamsDEAction {
  final List<Team> teams;

  TeamsDEAction(this.teams);

  @override
  String toString() {
    return 'TeamsDEAction{teams: $teams}';
  }
}
