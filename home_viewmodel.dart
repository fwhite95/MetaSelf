import 'package:meta_health/redux_src/models/rxapp_state.dart';
import 'package:redux/redux.dart';
import 'package:meta_health/redux_src/actions/update_email_pass_actions.dart';
import 'package:meta_health/redux_src/actions/rxauth_actions.dart';
import 'package:meta_health/redux_src/actions/homepage_actions.dart';

class HomeViewModel{

  //TODO home page viewmodel
  ///data to build graph
  //weight
  final int relWeight = 2;
  final int healthWeight = 3;
  final int moneyWeight = 5;
  final int workWeight = 10;
  //data
  //series
  //chart
  //chart widget(this is just padding and a sized box so built on other page)

  //need middleware to pull data from firestore to build graph and other stuff

  ///buttons
  //main button = goes to stats, task page, and account
  //add task button

  ///Buttons for task/cat page navigation
  //Health
  //money
  //relationships
  //work

  final String email;

  ///navigation
  //task pages
  final Function navigateToMoneyTaskPage;
  /*
  final Function navigateToTaskCreationPage;
  final Function navigateToTaskPage;
  final Function navigateToHealthTaskPage;
  final Function navigateToRelTaskPage;
  final Function navigateToWorkTaskPage;
  //other navigation
  final Function navigateToAccountPage;
  final Function navigateToStatsPage;
  */

  HomeViewModel({this.email,
  this.navigateToMoneyTaskPage,
  });

  static HomeViewModel fromStore(Store<AppState> store){
    return HomeViewModel(
      email: store.state.email,
      navigateToMoneyTaskPage: () => store.dispatch(new NavigateToMoneyTaskPageAction()),
    );
  }

}