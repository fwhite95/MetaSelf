import 'package:flutter/material.dart';
import 'package:redux/redux.dart';                              // new
import 'package:flutter_redux/flutter_redux.dart';
import 'models/rxapp_state.dart';
import 'pages/rxhome_page.dart';
import 'reducers/rxapp_reducer.dart';
import 'middleware/rxauth_middleware.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:meta_health/redux_src/ui/login_page.dart';
import 'package:meta_health/redux_src/models/keys.dart';
import 'package:meta_health/redux_src/middleware/navigation_middleware.dart';
import 'package:meta_health/redux_src/ui/home_page.dart';
import 'package:meta_health/redux_src/utils/app_routes.dart';

class RxMainApp extends StatefulWidget{
  final Store<AppState> store;

  RxMainApp(this.store);

  @override
  _RxMainAppState createState() => _RxMainAppState();
}

class _RxMainAppState extends State<RxMainApp>{

  final String title = 'MetaSelf';


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreProvider(
      store: widget.store,
      child: MaterialApp(
        title: title,
        home: HomePage(), //can change this to focus on different pages
        navigatorKey: Keys.navKey,
        routes: <String, WidgetBuilder>{
          "/login": (BuildContext context) => new LogInPage(),
          "/homepage": (BuildContext context) => new HomePage(),
        },
      ),

    );


  }
}