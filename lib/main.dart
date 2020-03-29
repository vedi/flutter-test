import 'package:flutter/material.dart';
import 'package:motivator/store/reducers/app_state_reducer.dart';
import 'package:redux/redux.dart';

import 'components/app.dart';
import 'data_provider.dart';
import 'store/middleware.dart';
import 'models/app_state.dart';

void main() {
  runApp(App(
    store: Store<AppState>(
      appReducer,
      initialState: AppState.loading(),
      middleware: createMiddleware(ApiDataProvider()),
    ),
  ));
}
