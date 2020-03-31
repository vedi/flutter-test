import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationSignInSuccess extends AuthenticationState {
  final String displayName;

  const AuthenticationSignInSuccess(this.displayName);

  @override
  List<Object> get props => [displayName];

  @override
  String toString() => 'AuthenticationSignInSuccess { displayName: $displayName }';
}

class AuthenticationSignInFailure extends AuthenticationState {
  @override
  List<Object> get props => [];
}
