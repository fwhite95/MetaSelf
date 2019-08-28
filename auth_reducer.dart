//redux_src
import 'package:firebase_auth/firebase_auth.dart';
import '../actions/rxauth_actions.dart';
import 'package:redux/redux.dart';

final authReducer = combineReducers<FirebaseUser>([
  TypedReducer<FirebaseUser, LogInSuccessful>(_logIn),
  TypedReducer<FirebaseUser, LogOut>(_logOut),
]);

//reducer methods
FirebaseUser _logIn(FirebaseUser user, action){
  return action.user;
}

Null _logOut(FirebaseUser user, action){
  return null;
}

