// @dart=2.9
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Electricity {
  final String date;
  final int amount;
  final charts.Color barColor;

  Electricity(this.date, this.amount, this.barColor);
}
