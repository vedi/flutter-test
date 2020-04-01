import 'package:equatable/equatable.dart';

abstract class RouteEvent extends Equatable {
  const RouteEvent();
}

class RouteReplaced extends RouteEvent {
  final String routeName;

  RouteReplaced(this.routeName);

  @override
  List<Object> get props => [routeName];
}

class RoutePushed extends RouteEvent {
  final String routeName;

  RoutePushed(this.routeName);

  @override
  List<Object> get props => [routeName];
}

class RoutePopped extends RouteEvent {
  @override
  List<Object> get props => [];
}
