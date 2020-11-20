import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CurveArea extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  CurveArea({
    @required this.area,
    @required this.q,
    @required this.z,
    @required this.n,
  });
  final double area;
  final List<List> q;
  final double z;
  final int n;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(area: area, q: q, z: z, n: n),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({
    Key key,
    @required this.area,
    @required this.q,
    @required this.z,
    @required this.n,
  }) : super(key: key);
  final double area;
  final List<List> q;
  final double z;
  final int n;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_SalesData> chartData = [];
  @override
  Widget build(BuildContext context) {
    double area = widget.area;
    List<List> r = widget.q;
    double z = widget.z;
    int n = widget.n;
    for (int i = 0; i < n; i++) {
      chartData.add(_SalesData(r[i][0], r[i][1]));
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
              series: <ChartSeries>[
                SplineAreaSeries<_SalesData, double>(
                  dataSource: chartData,
                  xValueMapper: (_SalesData sales, _) => sales.xcomp,
                  yValueMapper: (_SalesData sales, _) => sales.sales,
                ),
              ],
            ),
          ),
          Container(
              height: 100,
              child: Text(
                'Area under curve-' + area.toString(),
                style: TextStyle(fontSize: 25),
              )),
          Container(
              height: 100,
              child: Text(
                'Height of packed column-' + z.toString(),
                style: TextStyle(fontSize: 25),
              )),
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.xcomp, this.sales);

  double xcomp;
  double sales;
}
