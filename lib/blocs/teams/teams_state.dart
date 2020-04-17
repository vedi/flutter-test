import 'package:equatable/equatable.dart';
import 'package:motivator/models/team.dart';

abstract class TeamsState extends Equatable {
  const TeamsState();
}

class TeamsInitial extends TeamsState {
  @override
  List<Object> get props => [];
}

class TeamsLoadedSuccess extends TeamsState {
  final List<Team> teams;

  TeamsLoadedSuccess(this.teams);

  @override
  List<Object> get props => [teams];
}

class TeamsLoadedFailure extends TeamsState {
  final String errorMessage;

  TeamsLoadedFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
