import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class EmailPassField extends StatelessWidget{

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      children: <Widget>[
        SizedBox(height: 80,),
        Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Text('MetaHealth Login'),
          ],
        ),
        SizedBox(height: 120,),
        TextField(
          decoration: InputDecoration(
            labelText: 'Username',
            filled: true,
          ),
          controller: emailController,
        ),
        SizedBox(height: 12,),
        TextField(
          decoration: InputDecoration(
              labelText: 'Password',
              filled: true
          ),
          obscureText: true,
          controller: passController,
        ),
      ],
    );
  }
}