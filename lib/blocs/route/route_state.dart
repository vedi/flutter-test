import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:motivator/routes.dart';

class RouteState extends Equatable {
  final List<String> routes;
  const RouteState({
    @required this.routes,
  });

  factory RouteState.initial() {
    return RouteState(
      routes: [Routes.home],
    );
  }

  copyWith({
    List<String> routes,
  }) {
    return RouteState(
      routes: routes ?? this.routes,
    );
  }

  @override
  List<Object> get props => [routes];

  @override
  String toString() {
    return '''RouteState {
      routes: $routes,
    }''';
  }
}
