import 'package:flutter/material.dart';
import 'redux_src/redux_app.dart';
import 'package:meta_health/redux_src/utils/store.dart';


void main() async {
  var store = await createStore();
  runApp(new RxMainApp(store));
}
