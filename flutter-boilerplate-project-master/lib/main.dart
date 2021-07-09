import 'package:boilerplate/ui/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Test());
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: dashboardScreen(), debugShowCheckedModeBanner: false);
  }
}
