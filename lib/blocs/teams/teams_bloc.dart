import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:motivator/resources/teams_repository.dart';
import 'package:provider/provider.dart';
import './teams.dart';

class TeamsBloc extends Bloc<TeamsEvent, TeamsState> {
  TeamsRepository _teamsRepository;
  StreamSubscription _subscription;

  @override
  TeamsState get initialState => TeamsInitial();

  TeamsBloc(BuildContext context):
        this._teamsRepository = Provider.of<TeamsRepository>(context, listen: false);

  @override
  Stream<TeamsState> mapEventToState(TeamsEvent event) async* {
    if (event is TeamsLoadingStarted) {
      yield* _mapTeamLoadingStartedToState();
    } else if (event is TeamsCreated) {
      yield* _mapTeamsCreatedToState(event);
    } else if (event is TeamsUpdated) {
      yield* _mapTeamsUpdatedToState(event);
    } else if (event is TeamsDeleted) {
      yield* _mapTeamsDeletedToState(event);
    } else if (event is TeamsLoadingHappened) {
      yield* _mapTeamsLoadingHappenedToState(event);
    }
  }

  Stream<TeamsState> _mapTeamLoadingStartedToState() async* {
    print('_subscription: $_subscription');
    _subscription?.cancel();
    _subscription = _teamsRepository.fetch().listen(
          (teams) => add(TeamsLoadingHappened(teams)),
    );
  }

  Stream<TeamsState> _mapTeamsCreatedToState(TeamsCreated event) async* {
    _teamsRepository.create(event.team);
  }

  Stream<TeamsState> _mapTeamsUpdatedToState(TeamsUpdated event) async* {
    _teamsRepository.update(event.team);
  }

  Stream<TeamsState> _mapTeamsDeletedToState(TeamsDeleted event) async* {
    _teamsRepository.delete(event.team);
  }

  Stream<TeamsState> _mapTeamsLoadingHappenedToState(TeamsLoadingHappened event) async* {
    yield TeamsLoadedSuccess(event.teams);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
