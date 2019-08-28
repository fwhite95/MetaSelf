import 'package:redux/redux.dart';
import 'package:meta_health/redux_src/models/rxapp_state.dart';
import 'package:meta_health/redux_src/actions/update_email_pass_actions.dart';
import 'package:meta_health/redux_src/actions/navigation_actions.dart';
import 'package:meta_health/redux_src/models/keys.dart';

/*
List<Middleware<AppState>> createNavigationMiddleware(){
  return[
    TypedMiddleware<AppState, NavigateReplaceAction>(_navigateReplace),
    TypedMiddleware<AppState, NavigatePushAction>(_navigate),
  ];
}

_navigateReplace(Store<AppState> store, action, NextDispatcher next){
  final routeName = (action as NavigateReplaceAction).routeName;
  if(store.state.route.last != routeName){
    Keys.navKey.currentState.pushReplacementNamed(routeName);
  }
  next(action);
}

_navigate(Store<AppState> store, action, NextDispatcher next){
  final routeName = (action as NavigatePushAction).routeName;
  if(store.state.route.last != routeName){
    Keys.navKey.currentState.pushNamed(routeName);
  }
  next(action);
}
*/