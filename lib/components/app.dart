import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:motivator/components/pages/teams_page.dart';
import 'package:motivator/containers/login_page_container.dart';
import 'package:motivator/router/route_observer.dart';
import 'package:motivator/routes.dart';
import 'package:redux/redux.dart';

import '../models/app_state.dart';
import '../router/main_route.dart';
import 'pages/home_page.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  final Store<AppState> store;

  const App({Key key, @required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        navigatorObservers: [routeObserver],
        title: 'Motivator',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: store.state.route[0],
        onGenerateRoute: _getRoute,
      ),
    );
  }

  MaterialPageRoute _getRoute(RouteSettings settings) {
    Widget widget;
    switch (settings.name) {
      case Routes.home:
        widget = HomePage();
        break;
      case Routes.login:
        widget = LoginPageContainer();
        break;
      case Routes.teams:
        widget = TeamPage();
        break;
      default:
        widget = HomePage();
    }

    return MainRoute(widget, settings: settings);
  }
}