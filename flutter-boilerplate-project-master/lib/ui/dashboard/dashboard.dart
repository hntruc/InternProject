import 'package:boilerplate/ui/speed_dial.dart';
import 'package:boilerplate/ui/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/constants/font_family.dart';
import 'package:boilerplate/models/electricity/electricity.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:boilerplate/ui/bar_chart.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class dashboardScreen extends StatefulWidget {
  @override
  _dashboardScreen createState() => _dashboardScreen();
}

class _dashboardScreen extends State<dashboardScreen> {
  // add dat
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(fontFamily: FontFamily.roboto),
      home: dbScreen(context),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Màn hình dashboard
Widget dbScreen(context) {
  final List<Electricity> data = [
    Electricity("06/07", 0, charts.ColorUtil.fromDartColor(Colors.blue)),
    Electricity("05/07", 0, charts.ColorUtil.fromDartColor(Colors.blue)),
    Electricity("04/07", 29, charts.ColorUtil.fromDartColor(Colors.blue)),
    Electricity("03/07", 25, charts.ColorUtil.fromDartColor(Colors.blue)),
    Electricity("04/08", 29, charts.ColorUtil.fromDartColor(Colors.blue)),
    Electricity("03/08", 25, charts.ColorUtil.fromDartColor(Colors.blue)),
    Electricity("04/09", 29, charts.ColorUtil.fromDartColor(Colors.blue)),
    Electricity("03/09", 25, charts.ColorUtil.fromDartColor(Colors.blue)),
    Electricity("04/10", 29, charts.ColorUtil.fromDartColor(Colors.blue)),
    Electricity("03/10", 25, charts.ColorUtil.fromDartColor(Colors.blue)),
    Electricity("04/10", 29, charts.ColorUtil.fromDartColor(Colors.blue)),
  ];
  return Scaffold(
      floatingActionButton: speedDial(),
      appBar: AppBar(
        title: Center(
            child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  "Theo dõi điện",
                  style: TextStyle(color: Colors.blue[900]),
                ))),
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => welcomeScreen()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue.shade900,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.headset_mic_rounded),
            color: Colors.blue[900],
            onPressed: () {
              print("Support btn is clicked.");
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 10),
            child: Text(
              "Hỗ trợ",
              style: TextStyle(color: Colors.blue[900]),
            ),
          ),
        ],
      ),
      body: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              Flexible(
                child: customerList(),
              ),
              electric(),
              Container(
                  padding: EdgeInsets.only(top: 0),
                  child: SingleChildScrollView(
                      child: SizedBox(
                          height: 400,
                          child: barCharts(
                            data: data,
                          ))))
            ],
          )));
}

// Component list khách hàng
Widget customerList() {
  return Container(
      padding: EdgeInsets.only(left: 12.0, top: 0.0),
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          customer(),
          Padding(padding: EdgeInsets.only(right: 8.0)),
          customer(),
          IconButton(
              onPressed: () {
                print("Pressed");
              },
              icon: Icon(Icons.add_sharp, size: 24))
        ],
      ));
}

// Element khách hàng
Widget customer() {
  return Container(
    width: 120,
    //padding: EdgeInsets.only(right: 12),

    child: Center(
        child: Text("Nguyễn Bá Phúc",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue[900]))),
    decoration: BoxDecoration(
      //border: Border.all(width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(5.0) //
          ),
      color: Colors.white,
    ),
  );
}

// Component tiền điện
Widget electric() {
  return Container(
      padding: EdgeInsets.all(12),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      width: 400,
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                "assets/images/bluebg.jpg",
              )),
          electric1(),
          electric2(),
          electric3(),
          Container(
              padding: EdgeInsets.only(top: 150, bottom: 0),
              child: Text("Chi tiết điện tiêu thụ",
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 16,
                      fontWeight: FontWeight.bold))),
          Container(
            padding: EdgeInsets.only(top: 166, bottom: 0),
            child: Divider(
              thickness: 3,
              color: Color(0xfffee48d),
              indent: 0,
              endIndent: 320,
            ),
          )
        ],
      ));
}

Widget electric1() {
  return Container(
    child: Row(
      children: [
        Flexible(
            child: Container(
                padding: EdgeInsets.only(top: 20, left: 12),
                child: Center(
                    child: Text(
                  "Tiền điện tạm tính tháng 7",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: FontFamily.roboto,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )))),
        Flexible(
            child: Container(
                padding: EdgeInsets.only(left: 154, top: 20),
                child: Image.asset(
                  "assets/images/question_mark.png",
                  width: 20,
                  height: 20,
                  color: Colors.white,
                )))
      ],
    ),
  );
}

Widget electric2() {
  return Container(
    padding: EdgeInsets.only(top: 44, left: 16),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.only(right: 4),
          child: Text(
            "1.144.787",
            style: TextStyle(
                color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 10),
            child: Text("VNĐ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16))),
      ],
    ),
  );
}

Widget electric3() {
  return Container(
      padding: EdgeInsets.only(top: 84, left: 18),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.only(top: 10, right: 3),
              child: Text("Tương đương",
                  style: TextStyle(color: Colors.white, fontSize: 14))),
          Container(
              padding: EdgeInsets.only(top: 12),
              child: Text("445.0",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14))),
          Container(
              padding: EdgeInsets.only(top: 12, left: 3),
              child: Text("kWH",
                  style: TextStyle(color: Colors.white, fontSize: 14))),
          Container(
              padding: EdgeInsets.only(top: 12, left: 38),
              child: Text("Cập nhật 1 ngày trước",
                  style: TextStyle(color: Colors.white, fontSize: 14))),
        ],
      ));
}
