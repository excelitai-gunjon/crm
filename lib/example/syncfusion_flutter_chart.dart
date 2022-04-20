import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartsExample extends StatefulWidget {
  const ChartsExample({Key? key}) : super(key: key);

  @override
  _ChartsExampleState createState() => _ChartsExampleState();
}

class _ChartsExampleState extends State<ChartsExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: SfSparkAreaChart(
                  data: const <double>[18, 24, 30, 14, 28],
                )
            )
        )
    );
  }
}
class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
