import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:motivator/components/app.dart';

import 'route_event.dart';
import 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  @override
  RouteState get initialState => RouteState.initial();

  @override
  Stream<RouteState> mapEventToState(
    RouteEvent event,
  ) async* {
    if (event is RouteReplaced) {
      var routes = List<String>.from(state.routes);
      if (routes.last != event.routeName) {
        routes.removeLast();
        routes.add(event.routeName);
        navigatorKey.currentState.pushReplacementNamed(event.routeName);
      }
      yield state.copyWith(routes: routes);
    } else if (event is RoutePushed) {
      var routes = List<String>.from(state.routes);
      if (routes.last != event.routeName) {
        routes.add(event.routeName);
        navigatorKey.currentState.pushNamed(event.routeName);
      }
      yield state.copyWith(routes: routes);
    } else if (event is RoutePopped) {
      var routes = List<String>.from(state.routes);
      if (routes.length > 1) {
        routes.removeLast();
      }
      yield state.copyWith(routes: routes);
    }
  }
}
