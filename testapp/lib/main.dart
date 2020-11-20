import 'package:flutter/material.dart';
import 'package:testapp/Hieght_Calculation.dart';
import 'package:testapp/Tray_Number.dart';

class MyAppBar extends StatelessWidget {
  static const String _title = 'Calculation for Absorbers';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: MyScaffold(),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Calculation for Absorbers'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Calculation for number of trays'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppBarTrays()),
                  );
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                },
              ),
              ListTile(
                title: Text('Calculation of height of tower'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppBarTower()),
                  );
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fields in a Widget subclass are always marked "final".

}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new SizedBox(
            width: 200.0,
            height: 100.0,
            child: new RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppBarTrays()),
                );
              },
              color: Colors.blue,
              elevation: 5,
              child: const Text('Number of Trays',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
          const SizedBox(height: 30),
          new SizedBox(
            width: 200.0,
            height: 100.0,
            child: new RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppBarTower()),
                );
              },
              color: Colors.blue,
              elevation: 5,
              child: const Text('Height Calculation',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: MyAppBar(),
  ));
}
