import 'package:flutter/material.dart';
import 'view/dashboard/Dashboard.dart';
import 'view/profile/Profile.dart';

class App extends StatefulWidget {
  App({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _AppState createState() => new _AppState();
}

class Page {
  Page(this.title, this.view);

  final String title;
  var view;
}

class _AppState extends State<App> {
  var pages = [
    new Page("Dashboard", () => new Dashboard()),
    new Page("Profile", () => new Profile()),
  ];
  var page;

  void _setPage(page) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would Dashboardear to hDashboarden.
      this.page = page;
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

    Page _page = this.page == null ? pages[0] : this.page;
    Color accentColor = Theme.of(context).primaryColor;
    var listTile = pages
        .map((page) => new Container(
//            margin: const EdgeInsets.all(15.0),
            padding: new EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
            decoration: page == _page
                ? new BoxDecoration(
                    color: accentColor.withAlpha(50),
                    border: new Border(
                        left: new BorderSide(color: accentColor, width: 5.0)),
                  )
                : null,
            child: new ListTile(
              leading: new Icon(Icons.home),
              contentPadding: new EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
              title: new Text(page.title),
              selected: page == _page,
              onTap: () {
                // change app state...
                _setPage(page);
                Navigator.pop(context); // close the drawer
              },
            )))
        .toList();
    return new Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(widget.title),
        ),
        drawer: new Drawer(
          child: new DrawerHeader(
            child:
                new ListView(children: listTile, padding: EdgeInsets.all(0.0)),
            margin: EdgeInsets.only(top:56.0),
            padding: new EdgeInsets.all(0.0),
          ),
        ),
        body: new Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: _page.view()));
  }
}
