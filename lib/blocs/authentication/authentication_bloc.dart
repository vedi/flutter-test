import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motivator/resources/user_repository.dart';
import 'package:provider/provider.dart';

import 'authentication.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => AuthenticationInitial();

  final UserRepository _userRepository;

  AuthenticationBloc(BuildContext context)
      : this._userRepository = Provider.of<UserRepository>(context, listen: false);

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        final name = await _userRepository.getUser();
        yield AuthenticationSignInSuccess(name);
      } else {
        yield AuthenticationSignInFailure();
      }
    } catch (_) {
      yield AuthenticationSignInFailure();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield AuthenticationSignInSuccess(await _userRepository.getUser());
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield AuthenticationSignInFailure();
    _userRepository.signOut();
  }
}


