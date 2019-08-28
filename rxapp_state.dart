import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AppState{
  final bool isLoading;
  final FirebaseUser currentUser;

  //email and password for login/signup
  final String email;
  final String password;
  final emailController = TextEditingController();

  //navigation
  //final List<String> route;

  //constructor
AppState({
  this.isLoading = false,
  this.currentUser,
  this.password,
  this.email,
});

AppState copyWith({bool isLoading, String email}){
  return new AppState(
    isLoading: isLoading ?? this.isLoading,
    currentUser: currentUser ?? this.currentUser,
    email: email ?? this.email,
    password: password ?? this.password,
  );
}

@override
  String toString() {
    // TODO: implement toString
    return 'AppState{isLoading: $isLoading, currentUser: $currentUser}';
  }

}