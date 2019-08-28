import 'package:redux/redux.dart';
import 'package:meta_health/redux_src/models/rxapp_state.dart';
import 'package:meta_health/redux_src/actions/update_email_pass_actions.dart';
import 'package:meta_health/redux_src/actions/navigation_actions.dart';
import 'package:meta_health/redux_src/models/keys.dart';

class RxNavigationMiddleware extends MiddlewareClass<AppState>{
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if(action is NavigateToHomePageAction){
      Keys.navKey.currentState.pushNamed("/homepage");
    }
    next(action);
  }
}