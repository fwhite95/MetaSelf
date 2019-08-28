import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta_health/redux_src/models/rxapp_state.dart';
import 'package:redux/redux.dart';
import 'package:meta_health/redux_src/actions/update_email_pass_actions.dart';

class EmailTextField extends StatelessWidget{

  final Function onEditingCallback;
  final TextEditingController emailController;

  EmailTextField({this.onEditingCallback, this.emailController});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      decoration: InputDecoration(
        labelText: 'Username',
        filled: true,
      ),
      onEditingComplete: onEditingCallback,
      controller: emailController,
    );
  }
}

class EmailTextFieldContainer extends StatelessWidget{

  EmailTextFieldContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm){
        return EmailTextField(
          onEditingCallback: vm.onEditingCallback,
          emailController: vm.emailController
        );
      },
    );
  }
}

class _ViewModel{
  final Function onEditingCallback;
  final TextEditingController emailController;

  _ViewModel({this.onEditingCallback, this.emailController});

   static _ViewModel fromStore(Store<AppState> store){
    return _ViewModel(
      onEditingCallback: () {
        print('onEditingCallback');
        store.dispatch(UpdateEmailAction(store.state.emailController.text));
      },
      emailController: store.state.emailController,
    );
  }

}

