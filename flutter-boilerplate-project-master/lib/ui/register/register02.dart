import 'package:boilerplate/ui/register/register03.dart';
import 'package:flutter/material.dart';

class registerScreen02 extends StatefulWidget {
  const registerScreen02({Key? key}) : super(key: key);

  @override
  _registerScreen02State createState() => _registerScreen02State();
}

class _registerScreen02State extends State<registerScreen02> {
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
                        "Nhập mã OTP",
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Mã xác nhận OTP của bạn vừa được gửi tới số điện thoại 093***242",
                        style: TextStyle(fontSize: 16, color: Colors.black),
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
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.only(top: 0, bottom: 0),
                        margin: EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(16.0),
                            border: InputBorder.none,
                            isCollapsed: true,
                            hintText: 'Nhập mã OTP',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.teal,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //Spacer(),
                      SizedBox(
                        height: 30,
                      ),

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

Widget _buildRegisterTextBtn(context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          child: Text("Gửi lại OTP (25s)",
              style: TextStyle(color: Colors.red, fontSize: 17)),
          onPressed: () {
            print("Call send_OTP_function again");
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => registerScreen03()));
          },
        )
      ],
    ),
  );
}
