
import 'package:meta_health/redux_src/models/rxapp_state.dart';
import 'package:redux/redux.dart';
import 'package:meta_health/redux_src/actions/update_email_pass_actions.dart';
import 'package:meta_health/redux_src/actions/rxauth_actions.dart';

class LoginViewModel{

  final String email;
  final String password;

  //final Function(String) validateEmail;
  //final Function(String) validatePassword;
  final Function(String) updateEmail;
  final Function(String) updatePassword;
  final Function(String email, String password) login;

  //navigation
  final Function navigateToHomePage;

  LoginViewModel({
   this.email,
    this.password,
    this.updateEmail,
    this.updatePassword,
    this.login,
  this.navigateToHomePage});

  static LoginViewModel fromStore(Store<AppState> store){
    return LoginViewModel(
      email: store.state.email,
      password: store.state.password,
      updateEmail: (email) => store.dispatch(new UpdateEmailAction(email)),
      updatePassword: (password) => store.dispatch(new UpdatePasswordAction(password)),
      login: (email, password) {
        store.dispatch(LogIn(email, password));
      },
      navigateToHomePage: () => store.dispatch(new NavigateToHomePageAction()),
    );
  }

}