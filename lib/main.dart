import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivator/resources/user_repository.dart';
import 'package:provider/provider.dart';

import 'blocs/authentication/authentication.dart';
import 'blocs/blocs.dart';
import 'components/app.dart';
import 'resources/teams_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
      MultiProvider(
        providers: [
          Provider<UserRepository>(create: (_) => UserRepository()),
          Provider<TeamsRepository>(create: (_) => TeamsRepository()),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<AuthenticationBloc>(
                create: (context) =>
                AuthenticationBloc(context)
                  ..add(AppStarted()),
              ),
              BlocProvider<RouteBloc>(
                create: (context) => RouteBloc(),
              ),
            ],
            child: App(),
        ),
      ),
  );
}
