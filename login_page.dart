import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta_health/redux_src/models/rxapp_state.dart';
import 'package:redux/redux.dart';
import 'package:meta_health/redux_src/actions/update_email_pass_actions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta_health/redux_src/actions/rxauth_actions.dart';
import 'login_viewmodel.dart';

class LogInPage extends StatefulWidget{
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage>{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) => SafeArea(
        child: Container(
          color: Colors.white,
          child: StoreConnector<AppState, LoginViewModel>(
              builder: (_, viewModel) => content(viewModel, constraints),
              converter: (store) => LoginViewModel.fromStore(store)),
        ),
      )),
    );
  }

  //Structure of login page
Widget content(LoginViewModel viewModel, BoxConstraints constraints){
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      children: <Widget>[
        SizedBox(height: 80,),
        //Where the logo would go
        Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Text('MetaHealth Login'),
          ],
        ),
        SizedBox(height: 12,),
        emailInput(viewModel),
        SizedBox(height: 12,),
        passwordInput(viewModel),
        ButtonBar(
          children: <Widget>[
            FlatButton(
              child: Text('Sign Up'),
            ),
            loginBtn(() {
              viewModel.login(viewModel.email, viewModel.password);
              viewModel.navigateToHomePage();
            })
          ],
        )
      ],
    );
}

//email textfield
Widget emailInput(LoginViewModel viewModel){
    return TextField(
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
        decoration: InputDecoration(
          labelText: 'Email',
        ),
        //need onEditingComplete to update viewModel
        //or onChanged
        onChanged: (email){
          viewModel.updateEmail(email); //similar to validate email call from redux example
        },
      );
}

//password Text field
Widget passwordInput(LoginViewModel viewModel){
  return TextField(
      obscureText: true,
      keyboardType: TextInputType.text,
      controller: _passwordController,
      decoration: InputDecoration(
          labelText: 'Password',
      ),
      //need onEditingComplete to update viewModel
      onChanged: (password){
        viewModel.updatePassword(password);
      },
    );
}

Widget actionButton(VoidCallback callback, String label){
    return RaisedButton(
      child: Text(label),
      color: Colors.pink,
      onPressed: callback,
    );
}

//login button
Widget loginBtn(VoidCallback callback) => actionButton(callback, 'Login');

}