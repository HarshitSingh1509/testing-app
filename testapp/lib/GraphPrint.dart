import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphPrint extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  GraphPrint();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_SalesData> chartData = [];
  List<_SalesData> chartData1 = [];
  @override
  Widget build(BuildContext context) {
    int m = 10;
    int n = 2;
    var x = List.generate(m, (i) => List(n), growable: false);

    x = [
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
    int n1 = 10;
    for (int j = 0; j < n1; j++) {
      chartData.add(_SalesData(x[j][0], x[j][1]));
    }
    double sumx = 0, sumy = 0, sumxy = 0, sumx2 = 0;
    for (int k = 0; k < n1; k++) {
      sumx = sumx + x[k][0];
      sumy = sumy + x[k][1];
      sumxy = sumxy + x[k][0] * x[k][1];
      sumx2 = sumx2 + x[k][0] * x[k][0];
    }
    double slope = (n1 * sumxy - sumx * sumy) / (n1 * sumx2 - sumx * sumx);
    double intercept = (sumy - slope * sumx) / n1;
    for (double p = 0; p < x[n1 - 1][0];) {
      chartData1.add(_SalesData(p, slope * p + intercept));
      p = p + 0.000001;
    }
    int k = 0;
    var q = List.generate(50, (w) => List(4), growable: false);
    double y2 = 0.15, y1 = 0.0088, x2 = 0.00249, x1 = 0;
    double mop = (y2 - y1) / (x2 - x1);
    for (double i = 0.000005; i < x2;) {
      double xa = i;
      double ya = mop * xa + y1;
      double mtie = -15.71;
      double y = ya - mtie * xa;
      for (int j = 0; j < 9; j++) {
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
      double c = x2 / 50;
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
          ],
        ));
  }
}

class _SalesData {
  _SalesData(this.xcomp, this.sales);

  double xcomp;
  double sales;
}
