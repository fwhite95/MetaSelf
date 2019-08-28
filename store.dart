import 'package:flutter/material.dart';
import 'package:redux/redux.dart';                              // new
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta_health/redux_src/models/rxapp_state.dart';
import 'package:meta_health/redux_src/reducers/rxapp_reducer.dart';
import 'package:meta_health/redux_src/middleware/rxauth_middleware.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:meta_health/redux_src/middleware/rxnav_middleware.dart';


Future<Store<AppState>> createStore() async{
  return Store(
    appReducer,
    initialState: AppState(),
    middleware: [
      RxNavigationMiddleware(),
    ]
      ..addAll(createAuthMiddleware())
      ..add(LoggingMiddleware.printer()),
  );
}