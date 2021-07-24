import 'package:boilerplate/ui/dashboard/dashboard.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/ui/notice/notification.dart';
import 'package:boilerplate/ui/login/my_login.dart';
import 'package:boilerplate/ui/register/register01.dart';

class speedDial extends StatelessWidget {
  const speedDial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      marginBottom: 10, //margin bottom
      icon: Icons.menu, //icon on Floating action button
      activeIcon: Icons.close, //icon when menu is expanded on button
      backgroundColor: Colors.deepOrangeAccent, //background color of button
      foregroundColor: Colors.white, //font color, icon color in button
      activeBackgroundColor:
          Colors.deepPurpleAccent, //background color when menu is expanded
      activeForegroundColor: Colors.white,
      buttonSize: 56.0, //button size
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'), // action when menu opens
      onClose: () => print('DIAL CLOSED'), //action when menu closes

      elevation: 8.0, //shadow elevation of button
      shape: CircleBorder(), //shape of button

      children: [
        SpeedDialChild(
          //speed dial child
          child: Icon(Icons.home),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          label: 'Trang chủ',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => notificationScreen()))
          },
          onLongPress: () => {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => notificationScreen()))
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.login_outlined),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          label: 'Đăng nhập',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()))
          },
          onLongPress: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()))
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.app_registration_sharp),
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
          label: 'Đăng ký',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => registerScreen01()))
          },
          onLongPress: () => {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => registerScreen01()))
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.edit_location_alt_rounded),
          foregroundColor: Colors.white,
          backgroundColor: Colors.orangeAccent,
          label: 'Theo dõi điện',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => dashboardScreen()))
          },
          onLongPress: () => {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => dashboardScreen()))
          },
        ),

        //add more menu item children here
      ],
    );
  }
}
