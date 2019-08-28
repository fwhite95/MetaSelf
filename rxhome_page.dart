import 'package:flutter/material.dart';
import '../containers/rxauth_button/rxauth_button_container.dart';
import '../containers/email_textfield.dart';

class RxHomePage extends StatelessWidget{

  final String title;
  RxHomePage(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //SizedBox(height: 120,),
              EmailTextFieldContainer(),
              SizedBox(height: 12,),
              //Password textfield
              TextField(
                decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true
                ),
                obscureText: true,
              ),
              ButtonBar(
                children: <Widget>[
                  //Sign up button
                  FlatButton(
                    child: Text('Sign up'),
                  ),
                  AuthButtonContainer(),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}