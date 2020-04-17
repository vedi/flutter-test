import 'package:equatable/equatable.dart';
import 'package:motivator/models/team.dart';

abstract class TeamsEvent extends Equatable {
  const TeamsEvent();
}

class TeamsLoadingStarted extends TeamsEvent {
  @override
  List<Object> get props => [];
}

class TeamsLoadingFailed extends TeamsEvent {
  final String errorMessage;

  TeamsLoadingFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class TeamsLoadingHappened extends TeamsEvent {
  final List<Team> teams;

  TeamsLoadingHappened(this.teams);

  @override
  List<Object> get props => [teams];
}

class TeamsCreated extends TeamsEvent {
  final Team team;

  TeamsCreated(this.team);

  @override
  List<Object> get props => [team];
}

class TeamsUpdated extends TeamsEvent {
  final Team team;

  TeamsUpdated(this.team);

  @override
  List<Object> get props => [team];
}

class TeamsDeleted extends TeamsEvent {
  final Team team;

  TeamsDeleted(this.team);

  @override
  List<Object> get props => [team];
}
