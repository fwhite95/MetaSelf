import 'package:firebase_auth/firebase_auth.dart';
import '../models/rxapp_state.dart';
import '../actions/rxauth_actions.dart';
import 'package:redux/redux.dart';
import '../actions/update_email_pass_actions.dart';

//Middle ware intercepts actions
// and pauses the redux cycle to do something

List<Middleware<AppState>> createAuthMiddleware(){
  final logIn = _createLogInMiddleware();
  final logOut = _createLogOutMiddleware();

  return ([
    TypedMiddleware<AppState, LogIn>(logIn),
    TypedMiddleware<AppState, LogOut>(logOut),
  ]);
}

Middleware<AppState> _createLogInMiddleware(){

  //Middle functions always take
  //your store,
  //the action that has been dispatched
  //and a function called next

  return (Store store, action, NextDispatcher next) async{

    //FirebaseUser user;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    if(action is LogIn){
      try{
        print('entering action login try');
        FirebaseUser user = await _auth.signInWithEmailAndPassword(
            email: store.state.email,
            password: 'password1',
        );

        assert(user != null);
        assert(await user.getIdToken() != null);

        final FirebaseUser currentUser = await _auth.currentUser();
        assert(user.uid == currentUser.uid);

        //to check
        print('login: ${user.uid}');
        store.dispatch(LogInSuccessful(user: user));
        print('after dispatch?');
        //store.dispatch(NavigateToHomePageAction()); //go to homepage
      }catch(error){
        print('error for middleware');
        store.dispatch(LogInFail(error));
      }
    }
    next(action);
  };
}

Middleware<AppState> _createLogOutMiddleware(){

  return (Store store, action, NextDispatcher next) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try{
      print('Logout try');
      await _auth.signOut();
      store.dispatch(LogOutSuccessful());
    }catch(error){
      print(error);
    }
    next(action);
  };

}