import 'package:flutter/material.dart';
import 'package:testapp/Hieght_Calculation.dart';
import 'package:testapp/Tray_Output.dart';

class AppBarTrays extends StatelessWidget {
  static const String _title = 'Calculation for number of Trays';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        resizeToAvoidBottomInset: false, // set it to false

        appBar: AppBar(
          title: const Text(_title),
        ),
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
                title: Text('Calculation of hieght of tower'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppBarTower()),
                  );
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  //Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: MyStatefulWidget(),
      ),
    );
  }

  // Fields in a Widget subclass are always marked "final".

}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  final _y2 = TextEditingController();
  final _xo = TextEditingController();
  final _gs = TextEditingController();
  final _gl = TextEditingController();
  final _y1 = TextEditingController();
  final _m = TextEditingController();
  final _e = TextEditingController();
  var c;
  String dropdownValue = 'output concentration of solute in gas';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: _y2,
            decoration: const InputDecoration(
              hintText: 'Molar percentage of solute in gas input',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _xo,
            decoration: const InputDecoration(
              hintText: 'Molar percentage of solute in solvent Input',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _gs,
            decoration: const InputDecoration(
              hintText: 'Gas flow rate',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _gl,
            decoration: const InputDecoration(
              hintText: 'Solvent flow rate',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _m,
            decoration: const InputDecoration(
              hintText: 'slope of equilibrium line',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _e,
            decoration: const InputDecoration(
              hintText: 'efficiency of tray',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.grey),
            underline: Container(
              height: 2,
              color: Colors.blue,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
                if (newValue == 'output concentration of solute in gas') {
                  c = 1;
                } else {
                  c = 0;
                }
              });
            },
            items: <String>[
              'output concentration of solute in gas',
              'output concentration of gas'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          TextFormField(
            controller: _y1,
            decoration: const InputDecoration(
              hintText: 'enter concentration',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChartApp(
                            y2: double.parse(_y2.text),
                            xo: double.parse(_xo.text),
                            gs: double.parse(_gs.text),
                            gl: double.parse(_gl.text),
                            y1: double.parse(_y1.text),
                            m: double.parse(_m.text),
                            e: double.parse(_e.text),
                            c: c)),
                  );
                  // Process data.
                } else {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Text(double.parse(_y2.text).toString()),
                      );
                    },
                  );
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
