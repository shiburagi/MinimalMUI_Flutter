import 'package:flutter/material.dart';
import 'package:minimal_mui/component/LineChart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);

  // This widget is the home page of your Dashboardlication. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the Dashboard widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would Dashboardear to hDashboarden.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    var chartWidget = new Padding(
      padding: new EdgeInsets.all(32.0),
      child: new SizedBox(
        height: 200.0,
        width: 290.0,
        child: new DashPatternLineChart.withSampleData(),
      ),
    );
    return new Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Card(
              margin: EdgeInsets.all(16.0),
              child: new Container(
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Column(children: [
                      new Container(
                        child: new Text("Overall Stats"),
                      ),
                      chartWidget
                    ])
                  ],
                ),
                padding: new EdgeInsets.all(12.0),
              ))
        ],
      ),
    );
  }
}
