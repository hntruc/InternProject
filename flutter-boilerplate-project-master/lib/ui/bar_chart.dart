// @dart=2.9
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:boilerplate/models/electricity/electricity.dart';

class barCharts extends StatelessWidget {
  final List<Electricity> data;
  barCharts({@required this.data});

  @override
  Widget build(BuildContext context) {
    // charts.NumericAxisSpec yAxisStyling = charts.NumericAxisSpec(
    //     renderSpec: charts.GridlineRendererSpec(
    //   labelStyle: charts.TextStyleSpec(
    //     fontSize: 12,
    //     color: charts.ColorUtil.fromDartColor(Colors.grey.shade500),
    //   ),
    //   lineStyle: new charts.LineStyleSpec(
    //       color: charts.ColorUtil.fromDartColor(Colors.grey.shade400)),
    // ));

    // charts.OrdinalAxisSpec xAxisStyling = charts.OrdinalAxisSpec(
    //   renderSpec: charts.GridlineRendererSpec(
    //     labelStyle: charts.TextStyleSpec(
    //       fontSize: 12,
    //       color: charts.ColorUtil.fromDartColor(Colors.grey.shade500),
    //     ),
    //     // labelRotation: 90, // <- just an example / don't need these rotated
    //     lineStyle:
    //         new charts.LineStyleSpec(color: charts.MaterialPalette.transparent),
    //   ),
    //   showAxisLine:
    //       false, // doesn't seem to work on it's own - need above 'transparent' line
    // );

    List<charts.Series<Electricity, String>> series = [
      charts.Series(
        id: "Subscribers",
        domainFn: (Electricity series, _) => series.date,
        measureFn: (Electricity series, _) => series.amount,
        data: data,
        labelAccessorFn: (Electricity series, _) =>
            series.amount > 0 ? '${series.amount.toString()} kWH' : '',
        insideLabelStyleAccessorFn: (Electricity series, _) {
          final color = charts.MaterialPalette.white;

          return new charts.TextStyleSpec(color: color);
        },
        fillColorFn: (_, __) =>
            charts.MaterialPalette.blue.shadeDefault.lighter,
      )

      //colorFn: (Electricity series, _) => series.barColor),
    ];
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, top: 0, bottom: 12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: charts.BarChart(
                series,
                animate: true,
                vertical: false,
                barRendererDecorator: new charts.BarLabelDecorator<String>(),

                domainAxis: new charts.OrdinalAxisSpec(),
                primaryMeasureAxis: new charts.NumericAxisSpec(
                    renderSpec: new charts.NoneRenderSpec()),
                //barGroupingType: charts.BarGroupingType.grouped,

                // defaultRenderer: new charts.BarRendererConfig(
                //     maxBarWidthPx: 20,
                //     cornerStrategy: const charts.ConstCornerStrategy(30)),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
