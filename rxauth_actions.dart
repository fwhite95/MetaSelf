import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class LogIn{
  final String email;
  final String password;

  LogIn(this.email, this.password);
}

class LogInSuccessful{
  final FirebaseUser user;

  LogInSuccessful({@required this.user});

  @override
  String toString() {
    // TODO: implement toString
    return 'LogIn{user: $user}';
  }
}

class LogInFail{
  final dynamic error;
  LogInFail(this.error);

  @override
  String toString() {
    // TODO: implement toString
    return 'LogIn{There was an error loggin in: $error}';
  }
}

class LogOut{}

class LogOutSuccessful{
  LogOutSuccessful();

  @override
  String toString() {
    // TODO: implement toString
    return 'LogOut{user: null}';
  }
}

