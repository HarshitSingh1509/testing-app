import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:testapp/CurveArea.dart';

class GraphPrint extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  GraphPrint(
      {@required this.g1,
      @required this.y1,
      @required this.p,
      @required this.ls,
      @required this.x2,
      @required this.kxa,
      @required this.kya,
      @required this.cl,
      @required this.n});
  final double g1;
  final double y1;
  final double p;
  final double ls;
  final double x2;
  final double kxa;
  final double kya;
  final List<List> cl;
  final int n;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(
          g1: g1,
          y1: y1,
          p: p,
          ls: ls,
          x2: x2,
          kxa: kxa,
          kya: kya,
          cl: cl,
          n: n),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage(
      {Key key,
      @required this.g1,
      @required this.y1,
      @required this.p,
      @required this.ls,
      @required this.x2,
      @required this.kxa,
      @required this.kya,
      @required this.cl,
      @required this.n})
      : super(key: key);
  final double g1;
  final double y1;
  final double p;
  final double ls;
  final double x2;
  final double kxa;
  final double kya;
  final List<List> cl;
  final int n;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_SalesData> chartData = [];
  List<_SalesData> chartData1 = [];
  @override
  Widget build(BuildContext context) {
    double eg1 = widget.g1;
    double y2 = widget.y1;
    double ep = widget.p;
    double els = widget.ls;
    double x1 = widget.x2;
    double ekxa = widget.kxa;
    double ekya = widget.kya;
    List<List> x = widget.cl;
    int n1 = widget.n;
    int m = 10;
    int n = 2;
    var s = List.generate(m, (i) => List(n1), growable: false);

    s = [
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

    for (int j = 0; j < n1; j++) {
      chartData.add(_SalesData(x[j][0], x[j][1]));
    }
    double gs = eg1 * (1 - y2);
    print(gs);
    double cy1 = (eg1 * y2 - ep * eg1 * y2) / gs;
    double y1 = cy1 / (1 + cy1);
    double cy2 = y2 / (1 - y2);
    double cx1 = x1 / (1 - x1);
    double cx2 = (gs * (cy2 - cy1) / els) + cx1;
    double x2 = cx2 / (1 + cx2);
    print(y1);
    print(x2);
    print(y2);

    int k = 0;
    var q = List.generate(50, (w) => List(4), growable: false);

    double mop = (y2 - y1) / (x2 - x1);
    for (double j = x1; j < x2;) {
      chartData1.add(_SalesData(j, (mop * j + y1)));
      j = j + 0.000001;
    }
    for (double i = 0.000005; i <= x2;) {
      double xa = i;
      double ya = mop * xa + y1;
      double mtie = -1 * (ekxa / ekya);
      double y = ya - mtie * xa;
      for (int j = 0; j < n1 - 1; j++) {
        double ax1 = xa, ay1 = ya, ax2 = 0, ay2 = y;
        double bx1 = x[j][0],
            by1 = x[j][1],
            bx2 = x[j + 1][0],
            by2 = x[j + 1][1];
        double d = (by2 - by1) * (ax2 - ax1) - (bx2 - bx1) * (ay2 - ay1);
        if (d != 0) {
          double uA =
              ((bx2 - bx1) * (ay1 - by1) - (by2 - by1) * (ax1 - bx1)) / d;
          double uB =
              ((ax2 - ax1) * (ay1 - by1) - (ay2 - ay1) * (ax1 - bx1)) / d;
          print(ax1 + uA * (ax2 - ax1));
          print(ay1 + uA * (ay2 - ay1));
          if (((ax1 + uA * (ax2 - ax1))) > bx1 &&
              ((ax1 + uA * (ax2 - ax1)) < bx2) &&
              ((ay1 + uA * (ay2 - ay1)) < by2) &&
              ((ay1 + uA * (ay2 - ay1)) > by1)) {
            print('hi,Im here');
            q[k][0] = xa;
            q[k][1] = ya;
            q[k][2] = ax1 + uA * (ax2 - ax1);
            q[k][3] = ay1 + uA * (ay2 - ay1);
            break;
          }
        }
      }
      double c = x2 / 49;
      i = i + c;
      k = k + 1;
      //print(q);
    }
    print(q);
    print(k);
    var r = List.generate(50, (i) => List(2), growable: false);
    for (int l = 0; l < k; l++) {
      r[l][0] = q[l][1];
      r[l][1] = 1 / (((1 - r[l][0]) * (r[l][0] - q[l][3])));
    }
    print(r);
    double sumArea = 0;
    for (int o = 0; o < k - 1; o++) {
      sumArea = sumArea + (r[o + 1][1] + r[o][1]) * (r[o + 1][0] - r[o][0]) / 2;
    }
    double gld = gs / (1 - y1);
    double g = (eg1 + gld) / 2;
    double z = (g * sumArea) / (ekya * 3600);
    return Scaffold(
        appBar: AppBar(
          title: Text('Result'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 500,
              child: SfCartesianChart(
                  zoomPanBehavior: ZoomPanBehavior(
                      // Enables pinch zooming
                      enablePinching: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <CartesianSeries>[
                    SplineSeries<_SalesData, double>(
                      dataSource: chartData,
                      xValueMapper: (_SalesData sales, _) => sales.xcomp,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                    ),
                    LineSeries<_SalesData, double>(
                      dataSource: chartData,
                      xValueMapper: (_SalesData sales, _) => sales.xcomp,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                    ),
                    LineSeries<_SalesData, double>(
                      dataSource: chartData1,
                      xValueMapper: (_SalesData sales, _) => sales.xcomp,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                    ),
                  ]),
            ),
            Container(
                height: 100,
                child: Text(
                  sumArea.toString(),
                  style: TextStyle(fontSize: 30),
                )),
            // )
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CurveArea(area: sumArea, q: r, z: z, n: n1)),
                );
              },
              child: Text('Submit'),
              color: Colors.green,
            ),
          ],
        ));
  }
}

class _SalesData {
  _SalesData(this.xcomp, this.sales);

  double xcomp;
  double sales;
}
