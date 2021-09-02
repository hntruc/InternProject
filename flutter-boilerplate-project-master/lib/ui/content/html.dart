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

<h2 style = "font-size: 20px; color: grey; text-align:center"> <span style =" color: orange">  &#9888;</span>THÔNG BÁO TẠM NGƯNG CUNG CẤP ĐIỆN KHẨN CẤP</h2>
<p style = "color: grey"> Công Ty Điện Lực Sài Gòn trân trọng thông báo: trong ngày 30/08/2021, trên địa bàn Quận 1 và Quận 3 xảy ra ngưng cung cấp điện khẩn cấp một số đường dây trung thế và trạm hạ thế do sự cố, sự kiện bất khả kháng. Kính đề nghị Quý Khách Hàng xem mã trạm ( gồm 9 chữ số ) hoặc mã đường dây ( gồm 4 chữ số ) trong thông báo này, so sánh với mã trạm 2 hoặc 4 chữ số đầu của mã trạm ghi trên hóa đơn tiền điện để biết về tình hình tạm ngưng cung cấp điện.
Khi xảy ra những vấn đề liên quan đến mất an toàn trên hệ thống điện Thành phố, xin Quý Khách Hàng vui lòng gọi số điện thoại: 1900545454
Kính mong Quý Khách Hàng thông cảm. Chân thành cám ơn! 
Cụ thể về tình hình tạm ngưng cung cấp điện đột xuất như sau :
</p>

<table style="width:100%">
  <tr>
    <th>STT</th>
    <th>MÃ TRẠM/MÃ ĐƯỜNG DÂY</th> 
    <th>KHU VỰC CẮT ĐIỆN</th>
    <th>THỜI GIAN CẮT ĐIỆN</th>
    <th>LÝ DO</th> 
  </tr>
  <tr>
    <td>Q19P</td>
    <td>Từ 00:00 Đến 07:00</td>
    <td>Một phần Phường Nguyễn Cư Trinh Q1</td>
    <td>15:34	->	15:59</td>
    <td>Cắt điện chữa cháy</td>
  </tr>
  <tr>
    <td>L29F</td>
    <td>Từ 00:00 Đến 07:00</td>
    <td>Một phần Phường Nguyễn Cư Trinh Q1</td>
    <td>15:34	->	15:59</td>
    <td>Cắt điện chữa cháy</td>
  </tr>
  <tr>
    <td>S29F</td>
    <td>Từ 00:00 Đến 07:00</td>
    <td>Một phần Phường Đakao, Tân Định Q1</td>
    <td>10:27	->	10:35</td>
    <td>Cắt điện chữa cháy</td>
  </tr>
  <tr>
    <td>E1AO</td>
    <td>Từ 00:00 Đến 07:00</td>
    <td>Một phần Phường Đakao, Tân Định Q1</td>
    <td>10:27	->	10:35</td>
    <td>Cắt điện chữa cháy</td>
  </tr>
</table>

<h4>Công ty Điện lực Sài Gòn, trân trọng thông báo.</h4>

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
              "THÔNG BÁO TẠM NGƯNG CUNG CẤP ĐIỆN KHẨN CẤP",
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
              "30/08/2021 08:00",
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
