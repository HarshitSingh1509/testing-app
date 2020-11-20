import 'package:flutter/material.dart';
import 'package:testapp/Tray_Number.dart';
import 'package:testapp/GraphPrint.dart';
import 'package:testapp/calculation_hieght.dart';

class AppBarTower extends StatelessWidget {
  static const String _title = 'Calculation for hieght of tower';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: MyStatefulWidget(),
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

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  final _g1 = TextEditingController();
  final _y1 = TextEditingController();
  final _p = TextEditingController();
  final _ls = TextEditingController();
  final _x2 = TextEditingController();
  final _kxa = TextEditingController();
  final _kya = TextEditingController();
  final _n = TextEditingController(text: '5');
  var c;

  String dropdownValue = 'Saved Example';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _g1,
                    decoration: const InputDecoration(
                      hintText: 'Flow rate of Gas (Kmol/hr)',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _y1,
                    decoration: const InputDecoration(
                      hintText: 'Mole fraction of gas in Gas Stream',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _p,
                    decoration: const InputDecoration(
                      hintText: 'Percentage of Gas to absorbed',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _ls,
                    decoration: const InputDecoration(
                      hintText: 'Solvent flow rate(Kmol/hr)',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _x2,
                    decoration: const InputDecoration(
                      hintText: 'Mole fraction of gas in solvent',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _kxa,
                    decoration: const InputDecoration(
                      hintText: 'Value of Kxa',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _kya,
                    decoration: const InputDecoration(
                      hintText: 'Value of Kya',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: Text(
                      'Data of Equilibrium Line',
                      style: TextStyle(fontSize: 18),
                    ),
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
                        if (newValue == 'Saved Example') {
                          c = 1;
                        } else {
                          c = 0;
                        }
                      });
                    },
                    items: <String>[
                      'Saved Example',
                      'Enter Data values Manually'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  if (c == 0)
                    TextFormField(
                      controller: _n,
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
                        //if (_formKey.currentState.validate()) {
                        //  if (_formKey.currentState.validate()) {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyApp(
                                  g1: double.parse(_g1.text),
                                  y1: double.parse(_y1.text),
                                  p: double.parse(_p.text),
                                  ls: double.parse(_ls.text),
                                  x2: double.parse(_x2.text),
                                  kxa: double.parse(_kxa.text),
                                  kya: double.parse(_kya.text),
                                  c: c,
                                  n: int.parse(_n.text))),
                        );
                        // Process data.
                        //}
                        // Process data.
                        // }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            )));
  }
}
