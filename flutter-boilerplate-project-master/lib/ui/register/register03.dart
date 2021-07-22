import 'package:flutter/material.dart';
import 'package:boilerplate/ui/register/register04.dart';

class registerScreen03 extends StatefulWidget {
  const registerScreen03({Key? key}) : super(key: key);

  @override
  _registerScreen03State createState() => _registerScreen03State();
}

class _registerScreen03State extends State<registerScreen03> {
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
                        "Cài đặt mật khẩu",
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Nhập mật khẩu bao gồm 6 số",
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey.shade800),
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
                            hintText: 'Nhập mật khẩu',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
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
                        height: 20,
                      ),

                      _buildRegisterBtn(context),
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
    padding: EdgeInsets.only(top: 10, bottom: 10),
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
            .push(MaterialPageRoute(builder: (context) => registerScreen04()));
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
