import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:motivator/resources/user_repository.dart';
import 'package:motivator/store/reducers/app_state_reducer.dart';
import 'blocs/authentication/authentication.dart';
import 'blocs/blocs.dart';
import 'components/app.dart';
import 'data_provider.dart';
import 'models/app_state.dart';
import 'store/middleware.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
      MultiProvider(
        providers: [
          Provider<UserRepository>(create: (_) => UserRepository()),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<AuthenticationBloc>(
                create: (context) =>
                AuthenticationBloc(context)
                  ..add(AppStarted()),
              ),
              BlocProvider<LoginBloc>(
                create: (context) => LoginBloc(context),
              ),
            ],
            child: App(
              store: Store<AppState>(
                appReducer,
                initialState: AppState.loading(),
                middleware: createMiddleware(ApiDataProvider()),
              ),
            ),
        ),
      ),
  );
}
