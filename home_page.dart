import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta_health/redux_src/models/rxapp_state.dart';
import 'home_viewmodel.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:meta_health/redux_src/utils/menu_button.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) => SafeArea(
        child: Container(
          child: StoreConnector<AppState,HomeViewModel>(
              builder: (_, viewModel) => content(viewModel, constraints),
              converter: (store) => HomeViewModel.fromStore(store)),
        ),
      )),
    );
  }

  //structure of homepage
Widget content(HomeViewModel viewModel, BoxConstraints constraints){

  //graph data
  var data = [
    CatWeightGraph('Health', viewModel.healthWeight,
        charts.Color.fromHex(code: '#097703'), Icon(Icons.local_hospital)),
    CatWeightGraph('Money', viewModel.moneyWeight,
        charts.Color.fromHex(code: '#f8fc0c'), Icon(Icons.monetization_on)),
    CatWeightGraph('Relationships', viewModel.relWeight,
        charts.Color.fromHex(code: '#e50000'), Icon(Icons.healing)),
    CatWeightGraph('Work', viewModel.workWeight,
        charts.Color.fromHex(code: '#a50111'), Icon(Icons.work)),
  ];

  var series = [
    charts.Series(
      domainFn: (CatWeightGraph graphData, _) => graphData.cat,
      measureFn: (CatWeightGraph graphData, _) => graphData.weight,
      colorFn: (CatWeightGraph graphData, _) => graphData.color,
      id: 'Weight',
      data: data,
      labelAccessorFn: (CatWeightGraph row, _) => '${row.cat} : ${row.weight}'
    )
  ];

  var chart = charts.PieChart(
    series,
    animate: false,
    defaultRenderer: charts.ArcRendererConfig(arcWidth: 100,
    arcRendererDecorators: [
      charts.ArcLabelDecorator()
    ]),
  );

  var chartWidget = Padding(
    padding: EdgeInsets.all(32),
    child: SizedBox(
      height: 400,
      child: chart,
    ),
  );

  //Make it a drawer or something for now this is ridiculous can change it later
    return Stack(
      children: <Widget>[

            ListView(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text('The Title Here'),
                ),
                //chart
                chartWidget,
                //category cards
                catCard('Money', Icon(Icons.monetization_on), 'moneyPage'),

              ],
            ),
        Align(
          alignment: Alignment.topLeft,
          child: MenuButton(),
        ),
      ],
    );

}



}//end of homepage class

class CatWeightGraph{
  final String cat;
  final int weight;
  final charts.Color color;
  final Icon icon;

  CatWeightGraph(this.cat, this.weight, this.color, this.icon);

}

Widget catCard(String category, Icon icon, String route){
  return Card(
    child: Center(
      child: ListTile(
        title: Text('$category', textAlign: TextAlign.center,),
        trailing: icon,
        onTap: () {

        },
      ),
    ),
    color: Colors.pinkAccent,
    margin: EdgeInsets.fromLTRB(40, 15, 40, 15),
  );
}