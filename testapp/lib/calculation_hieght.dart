import 'package:flutter/material.dart';
import 'package:testapp/GraphPrint.dart';

class MyApp extends StatelessWidget {
  MyApp(
      {@required this.g1,
      @required this.y1,
      @required this.p,
      @required this.ls,
      @required this.x2,
      @required this.kxa,
      @required this.kya,
      @required this.c,
      @required this.n});
  final double g1;
  final double y1;
  final double p;
  final double ls;
  final double x2;
  final double kxa;
  final double kya;
  final int c;
  final int n;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic TextFormFields',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyForm(
          g1: g1, y1: y1, p: p, ls: ls, x2: x2, kxa: kxa, kya: kya, c: c, n: n),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyForm extends StatefulWidget {
  MyForm(
      {Key key,
      @required this.g1,
      @required this.y1,
      @required this.p,
      @required this.ls,
      @required this.x2,
      @required this.kxa,
      @required this.kya,
      @required this.c,
      @required this.n})
      : super(key: key);
  final double g1;
  final double y1;
  final double p;
  final double ls;
  final double x2;
  final double kxa;
  final double kya;
  final int c;
  final int n;
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double eg1 = widget.g1;
    double y2 = widget.y1;
    double ep = widget.p;
    double els = widget.ls;
    double x1 = widget.x2;
    double ekxa = widget.kxa;
    double ekya = widget.kya;
    int ec = widget.c;
    int n;
    var t;
    if (ec == 1) {
      n = 10;
      t = List.generate(n, (i) => List(2), growable: false);
      t = [
        [0.00, 0.00],
        [0.000056, 0.00079],
        [0.00014, 0.00223],
        [0.00028, 0.0062],
        [0.000421, 0.0107],
        [0.000842, 0.0259],
        [0.0014, 0.0473],
        [0.00197, 0.0685],
        [0.00297, 0.104],
        [0.004, 0.16],
      ];
    } else {
      n = widget.n;
      t = List.generate(n, (i) => List(2), growable: false);
    }
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Data Values'),
        ),
        body: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // name textfield
                            if (ec == 1)
                              for (int i = 0; i < n; i++)
                                Padding(
                                    padding: const EdgeInsets.only(right: 32.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          child: TextFormField(
                                            initialValue: t[i][0].toString(),
                                            onSaved: (String value) {
                                              t[i][0] = double.parse(value);
                                            },
                                            decoration: InputDecoration(
                                                hintText: 'enter x'),
                                            validator: (v) {
                                              if (v.trim().isEmpty)
                                                return 'Please enter something';
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Container(
                                          width: 100,
                                          child: TextFormField(
                                            initialValue: t[i][1].toString(),
                                            onSaved: (String value) {
                                              t[i][1] = double.parse(value);
                                            },
                                            decoration: InputDecoration(
                                                hintText: 'enter y'),
                                            validator: (v) {
                                              if (v.trim().isEmpty)
                                                return 'Please enter something';
                                              return null;
                                            },
                                          ),
                                        ),
                                      ],
                                    )),
                            if (ec != 1)
                              for (int i = 0; i < n; i++)
                                Padding(
                                    padding: const EdgeInsets.only(right: 32.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          child: TextFormField(
                                            onSaved: (String value) {
                                              t[i][0] = double.parse(value);
                                            },
                                            decoration: InputDecoration(
                                                hintText: 'enter x'),
                                            validator: (v) {
                                              if (v.trim().isEmpty)
                                                return 'Please enter something';
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Container(
                                          width: 100,
                                          child: TextFormField(
                                            onSaved: (String value) {
                                              t[i][1] = double.parse(value);
                                            },
                                            decoration: InputDecoration(
                                                hintText: 'enter y'),
                                            validator: (v) {
                                              if (v.trim().isEmpty)
                                                return 'Please enter something';
                                              return null;
                                            },
                                          ),
                                        ),
                                      ],
                                    )),

                            SizedBox(
                              height: 40,
                            ),
                            FlatButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GraphPrint(
                                            g1: eg1,
                                            y1: y2,
                                            p: ep,
                                            ls: els,
                                            x2: x1,
                                            kxa: ekxa,
                                            kya: ekya,
                                            cl: t,
                                            n: n)),
                                  );
                                }
                              },
                              child: Text('Submit'),
                              color: Colors.green,
                            ),
                          ])),
                ))));
  }
}
