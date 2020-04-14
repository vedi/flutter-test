import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivator/blocs/authentication/authentication.dart';
import 'package:motivator/blocs/blocs.dart';
import 'package:motivator/router/route_observer.dart';
import 'package:motivator/routes.dart';

import '../router/main_route.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/splash_page.dart';
import 'pages/teams_page.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      navigatorObservers: [routeObserver],
      title: 'Motivator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.home,
      onGenerateRoute: _getRoute,
    );
  }

  MaterialPageRoute _getRoute(RouteSettings settings) {
    Widget widget;
    switch (settings.name) {
      case Routes.home:
        widget = HomePage();
        break;
      case Routes.login:
        widget = BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(context),
          child: LoginPage(),
        );
        break;
      case Routes.teams:
        widget = BlocProvider<TeamsBloc>(
          create: (context) {
            return TeamsBloc(context)..add(TeamsLoadingStarted());
          },
          child: TeamsPage(),
        );
        break;
      default:
        widget = SplashPage();
    }
    return MainRoute(widget, settings: settings);
  }
}
