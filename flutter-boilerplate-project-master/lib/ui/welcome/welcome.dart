import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:boilerplate/constants/text_style.dart';
import 'package:boilerplate/ui/login/my_login.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  _welcomeScreenState createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.black],
                  //stops: [0.1, 0.4, 0.7, 0.9],
                )),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.network(
                          "https://hozota.com/upload/images/20170915183529526794_a.jpg",
                          width: 150,
                          height: 150,
                        ),
                      ),
                      SizedBox(height: 50.0),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Tiết kiệm hôm nay",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text("Thắp sáng ngày mai",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 10,
                            child: new Divider(
                              thickness: 5,
                              color: Colors.amber,
                              indent: 0,
                              endIndent: 230,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                                "Đăng ký thành viên để tham gia các chương trình tích điểm đổi quà hấp dẫn",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          _buildLoginBtn(context),
                          SizedBox(
                            height: 30,
                          ),
                          _buildRegisterBtn()
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

Widget _buildLoginBtn(context) {
  return Container(
    height: 50,
    padding: EdgeInsets.symmetric(vertical: 0),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: const Text(
        "Đăng nhập",
        style: TextStyle(fontSize: 20),
      ),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.black.withOpacity(0.05)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                  side: BorderSide(color: Colors.white)))),
    ),
  );
}

Widget _buildRegisterBtn() {
  return Container(
    height: 50,
    padding: EdgeInsets.symmetric(vertical: 0),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () => print("Login is pressed"),
      child: const Text(
        "Đăng ký",
        style: TextStyle(color: Colors.blueGrey, fontSize: 20),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                  side: BorderSide(color: Colors.white)))),
    ),
  );
}
