import 'package:boilerplate/ui/notice/notification.dart';
import 'package:boilerplate/ui/speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class htmlContentScreen extends StatefulWidget {
  const htmlContentScreen({Key? key}) : super(key: key);

  @override
  _htmlContentScreenState createState() => _htmlContentScreenState();
}

final _htmlContent = """
  <!DOCTYPE html>
<html>
<head>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>
</head>
<body>

<h2 style = "font-size: 20px; color: grey; text-align:center"> <span style =" color: orange">  &#9888;</span> THÔNG BÁO VỀ LỊCH CẮT ĐIỆN HÀ NỘI 10 - 14/7/2021 </h2>
<p style = "color: grey"> Dưới đây là lịch cắt điện Hà Nội ngày 10-14/7 chi tiết: </p>
<h2>I. QUẬN BA ĐÌNH</h2>

<table style="width:100%">
  <tr>
    <th>NGÀY</th>
    <th>GIỜ</th> 
    <th>KHU VỰC</th>
  </tr>
  <tr>
    <td>10/07/2021</td>
    <td>Từ 00:00 Đến 07:00</td>
    <td>Công ty Cổ phần Đầu tư và xây dựng số 4 - Số 243 Đê La Thành</td>
  </tr>
  <tr>
    <td>11/07/2021</td>
    <td>Từ 00:00 Đến 07:00</td>
    <td>Trung tâm Kỹ thuật điện ảnh - Số 465B Hoàng Hoa Thám</td>
  </tr>
</table>

<h2>II. HUYỆN GIA LÂM</h2>

<table style="width:100%">
  <tr>
    <td>10/07/2021</td>
    <td>Từ 04:00 Đến 12:00</td>
    <td>Một phần xã Dương Xá, Kiêu Kỵ</td>
  </tr>
  <tr>
    <td>11/07/2021</td>
    <td>Từ 04:30 Đến 12:00</td>
    <td>Một phần KCN Phú Thị (không mất điện dân sinh)</td>
  </tr>
</table>

</body>
</html>

  """;

class _htmlContentScreenState extends State<htmlContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: speedDial(),
      appBar: AppBar(
        backgroundColor: Color(0xFF008080),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 160,
            child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Warning.svg/2219px-Warning.svg.png",
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.topLeft,
            child: Text(
              "THÔNG BÁO VỀ LỊCH CẮT ĐIỆN HÀ NỘI 10-14/7/2021",
              style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(6.0),
            alignment: Alignment.topLeft,
            child: Text(
              "2021-07-13 11:51:04",
              style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.all(6.0),
            child: Divider(
              thickness: 5,
              color: Colors.amber[200],
              indent: 0,
              endIndent: 290,
            ),
          ),
          Html(
            data: _htmlContent,
            style: {
              'table': Style(backgroundColor: Colors.white),
              'td': Style(
                backgroundColor: Colors.white,
                padding: EdgeInsets.all(10),
              ),
              'th': Style(padding: EdgeInsets.all(10), color: Colors.black),
              'tr': Style(
                  backgroundColor: Colors.white,
                  border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black))),
            },
          ),
        ],
      ))),
    );
  }
}
