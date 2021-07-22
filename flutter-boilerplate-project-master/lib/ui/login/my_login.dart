import 'package:boilerplate/ui/forgot_pwd/forgot_pwd.dart';
import 'package:boilerplate/ui/notice/notification.dart';
import 'package:boilerplate/ui/register/register01.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/ui/welcome/welcome.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          child: Column(
            children: <Widget>[
              Expanded(
                child: signUpCardUI(context),
              ),
            ],
          )),
    );
  }
}

Widget signUpCardUI(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 80,
        ),
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "Đăng nhập",
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
        ),
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 60),
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
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.call,
                              color: Colors.grey,
                            ),
                            hintText: 'Nhập số điện thoại',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 52,
                        padding: EdgeInsets.only(
                            top: 0, left: 16, right: 16, bottom: 0),
                        margin: EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.vpn_key,
                              color: Colors.grey,
                            ),
                            hintText: 'Nhập mật khẩu',
                          ),
                          obscureText: true,
                        ),
                      ),
                      //Spacer(),
                      SizedBox(
                        height: 30,
                      ),
                      _buildForgotPwdBtn(context),
                      _buildLogInBtn(context),
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

Widget _buildLogInBtn(context) {
  return Container(
    height: 70,
    padding: EdgeInsets.all(10),
    width: double.infinity,
    child: ElevatedButton(
      child: Text(
        'Đăng nhập'.toUpperCase(),
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      onPressed: () {
        //Navigator.of(context).pushNamed('home');
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => notificationScreen()));
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color(0xFF20B2AA)),
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
        Text("Chưa có tài khoản?", style: TextStyle(fontSize: 16)),
        TextButton(
          child: Text("Đăng ký ngay",
              style: TextStyle(color: Colors.red, fontSize: 16)),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => registerScreen01()));
          },
        )
      ],
    ),
  );
}

Widget _buildForgotPwdBtn(context) {
  return Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.only(right: 14),
      child: TextButton(
        child: Text("Quên mật khẩu?",
            style: TextStyle(color: Colors.grey, fontSize: 18)),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => forgotPwdScreen()));
        },
      ));
}
