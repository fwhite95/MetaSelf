import 'package:meta_health/redux_src/models/rxapp_state.dart';
import 'package:meta_health/redux_src/reducers/auth_reducer.dart';
import 'package:meta_health/redux_src/reducers/email_update_reducer.dart';
import 'package:meta_health/redux_src/reducers/navigation_reducer.dart';

AppState appReducer(AppState state, action){
  return AppState(
    isLoading: false,
    currentUser: authReducer(state.currentUser, action),
    email: updateEmailReducer(state.email, action),
  );
}