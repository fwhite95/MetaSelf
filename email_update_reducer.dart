import 'package:redux/redux.dart';
import 'package:meta_health/redux_src/actions/update_email_pass_actions.dart';
import 'package:flutter/material.dart';


String updateEmailReducer(String email, action){
  if(action is UpdateEmailAction){
    print('in updateEmail Reducer');
    //breaks on calling text from the action
    email = action.email;
    print('Email: $email');
    return email;
  } else{
    return email;
  }
}

String updatePasswordReducer(String password, action){
  if(action is UpdatePasswordAction){
    print('in updatePasswordReducer');
    print('$password, : ${action.password}');
    password = action.password;
    return password;
  }else {
    return password;
  }
}