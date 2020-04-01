import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:motivator/blocs/authentication/authentication.dart';
import 'package:motivator/blocs/blocs.dart';
import 'package:motivator/containers/teams_page_container.dart';
import 'package:motivator/router/route_observer.dart';
import 'package:motivator/routes.dart';
import 'package:redux/redux.dart';

import '../models/app_state.dart';
import '../router/main_route.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/splash_page.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  final Store<AppState> store;

  const App({
    Key key,
    @required this.store,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return StoreProvider(
          store: store,
          child: WillPopScope(
            onWillPop: () {
              BlocProvider.of<RouteBloc>(context).add(RoutePopped());
              return Future(() => true);
            },
            child: MaterialApp(
              navigatorKey: navigatorKey,
              navigatorObservers: [routeObserver],
              title: 'Motivator',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              initialRoute: Routes.home,
              onGenerateRoute: _getRoute,
            ),
          ),
        );
      },
    );
  }

  MaterialPageRoute _getRoute(RouteSettings settings) {
    Widget widget;
    switch (settings.name) {
      case Routes.home:
        widget = HomePage();
        break;
      case Routes.login:
        widget = LoginPage.withBloc();
        break;
      case Routes.teams:
        widget = TeamsPageContainer();
        break;
      default:
        widget = SplashPage();
    }
    return MainRoute(widget, settings: settings);
  }
}
