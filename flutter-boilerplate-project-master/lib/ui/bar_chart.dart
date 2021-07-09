// @dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:boilerplate/models/electricity/electricity.dart';

class barCharts extends StatelessWidget {
  final List<Electricity> data;
  barCharts({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Electricity, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: data,
          domainFn: (Electricity series, _) => series.date,
          measureFn: (Electricity series, _) => series.amount,
          colorFn: (Electricity series, _) => series.barColor)
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.only(left: 12, right: 12, top: 0, bottom: 12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            children: <Widget>[
              Expanded(child: charts.BarChart(series, animate: true))
            ],
          ),
        ),
      ),
    );
  }
}
