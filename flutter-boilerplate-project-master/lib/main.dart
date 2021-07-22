//import 'package:boilerplate/ui/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/ui/welcome/welcome.dart';

void main() {
  runApp(Test());
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: welcomeScreen(), debugShowCheckedModeBanner: false);
  }
}
