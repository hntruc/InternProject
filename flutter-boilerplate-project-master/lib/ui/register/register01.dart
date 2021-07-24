import 'package:boilerplate/ui/login/my_login.dart';
import 'package:boilerplate/ui/register/register02.dart';
import 'package:boilerplate/ui/speed_dial.dart';
import 'package:flutter/material.dart';

class registerScreen01 extends StatefulWidget {
  const registerScreen01({Key? key}) : super(key: key);

  @override
  _registerScreen01State createState() => _registerScreen01State();
}

class _registerScreen01State extends State<registerScreen01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: speedDial(),
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
                        "Số điện thoại",
                        style: TextStyle(
                            color: Colors.blue.shade900, fontSize: 22),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Nhập số điện thoại của bạn để đăng ký.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        padding: EdgeInsets.only(
                            top: 0, left: 16, right: 16, bottom: 0),
                        margin: EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextFormField(
                          //textAlign: TextAlign.start,
                          //textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(16.0),
                            border: InputBorder.none,
                            isCollapsed: true,
                            icon: Icon(
                              Icons.call,
                              color: Colors.grey,
                            ),
                            hintText: 'Nhập số điện thoại',
                          ),
                        ),
                      ),

                      //Spacer(),
                      SizedBox(
                        height: 30,
                      ),

                      _buildRegisterBtn(context),
                      _buildRegisterTextBtn(context)
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

Widget _buildRegisterBtn(context) {
  return Container(
    height: 70,
    padding: EdgeInsets.all(10),
    width: double.infinity,
    child: ElevatedButton(
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 70,
            padding: EdgeInsets.only(left: 10, right: 182),
            child: Text(
              "Tiếp tục",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Container(
            height: 70,
            child: Icon(Icons.navigate_next, size: 30),
          )
        ],
      ),
      onPressed: () {
        //Navigator.of(context).pushNamed('home');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => registerScreen02()));
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFFc9c9d3)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                  side: (BorderSide(color: Colors.white))))),
    ),
  );
}

Widget _buildRegisterTextBtn(context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Bạn đã có tài khoản?", style: TextStyle(fontSize: 16)),
        TextButton(
          child: Text("Đăng nhập ngay",
              style: TextStyle(color: Colors.red, fontSize: 16)),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => LoginScreen()));
          },
        )
      ],
    ),
  );
}
