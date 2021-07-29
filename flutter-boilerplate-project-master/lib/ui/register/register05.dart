import 'package:boilerplate/ui/notice/notification.dart';
import 'package:boilerplate/ui/speed_dial.dart';
import 'package:flutter/material.dart';

class registerScreen05 extends StatefulWidget {
  const registerScreen05({Key? key}) : super(key: key);

  @override
  _registerScreen05State createState() => _registerScreen05State();
}

class _registerScreen05State extends State<registerScreen05> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color(0xFF008080),
            Color(0xFF2F4F4F),
          ])),
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Color(0xFF008080),
                Color(0xFF2F4F4F),
              ])),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 140,
                  ),
                  Expanded(
                    child: Container(
                        height: MediaQuery.of(context).size.height - 140,
                        child: signUpCardUI(context)),
                  ),
                ],
              ))),
    );
  }
}

Widget signUpCardUI(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 0, right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Đăng ký thành công",
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Chúc mừng bạn đã đăng ký tài khoản thành công.",
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey.shade800),
                      ),
                      Container(
                        child: Image.asset("assets/images/Completed-bro.png"),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 6),
                  child: Column(
                    children: <Widget>[
                      //Spacer(),
                      SizedBox(
                        height: 20,
                      ),

                      _buildGradientNextBtn(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildGradientNextBtn(context) {
  return Container(
    height: 70,
    padding: EdgeInsets.only(top: 10, bottom: 10),
    width: double.infinity,
    child: ElevatedButton(
      child: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //       Colors.cyan,
        //       Colors.indigo,
        //     ]),
        //     borderRadius: BorderRadius.circular(32)),
        //alignment: Alignment.center,
        //height: 70,
        //padding: EdgeInsets.only(left: 10, right: 102),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 70,
              padding: EdgeInsets.only(left: 10, right: 122),
              child: Text(
                "Trải nghiệm ngay",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              height: 70,
              child: Icon(Icons.navigate_next, size: 30),
            )
          ],
        ),
      ),
      onPressed: () {
        //Navigator.of(context).pushNamed('home');
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => notificationScreen()));
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.indigo),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                  side: (BorderSide(color: Colors.black))))),
    ),
  );
}
