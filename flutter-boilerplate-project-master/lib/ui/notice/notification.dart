import 'dart:io';
import 'dart:typed_data';
import 'package:boilerplate/ui/content/html.dart';
import 'package:boilerplate/ui/dashboard/dashboard.dart';
import 'package:boilerplate/ui/notice/all_notification.dart';
import 'package:boilerplate/ui/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

const String _documentPath = 'assets/pdf_files/electricity.pdf';

Future<String> prepareTestPdf(context) async {
  final ByteData bytes =
      await DefaultAssetBundle.of(context).load(_documentPath);
  final Uint8List list = bytes.buffer.asUint8List();

  final tempDir = await getTemporaryDirectory();
  final tempDocumentPath = '${tempDir.path}/$_documentPath';

  final file = await File(tempDocumentPath).create(recursive: true);
  file.writeAsBytesSync(list);
  return tempDocumentPath;
}

class notificationScreen extends StatefulWidget {
  const notificationScreen({Key? key}) : super(key: key);

  @override
  _notificationScreenState createState() => _notificationScreenState();
}

final elec_money = "1.000.000";

class _notificationScreenState extends State<notificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: new FloatingActionButton(
          elevation: 2.0,
          child: Image.asset("assets/images/money01.png"),
          backgroundColor: Colors.green.shade100,
          onPressed: () {
            Alert(
                context: context,
                type: AlertType.info,
                title: "Thông báo",
                desc: "Tiền điện đến giờ là: ${elec_money}đ rồi đấy!",
                //image: Image.asset("assets/images/money01.png"),
                buttons: [
                  DialogButton(
                    child: Text("OK!"),
                    onPressed: () => Navigator.pop(context),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(0, 179, 134, 1.0),
                      Color.fromRGBO(52, 138, 199, 1.0)
                    ]),
                  )
                ]).show();
          },
        ),
        body: Container(
          color: new Color(0xFFf5f6fa),
          child: Column(children: [
            Flexible(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 35,
                  child: ListTile(
                    title: Row(
                      children: [
                        Text(
                          'Tin tức',
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 190),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      allNotificationScreen()));
                            },
                            child: const Text(
                              'Xem tất cả \u{25B6}',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            Flexible(
                child: Container(
              padding: EdgeInsets.only(top: 0, bottom: 0),
              child: Divider(
                thickness: 5,
                color: Colors.amber[200],
                indent: 16,
                endIndent: 290,
              ),
            )),
            Container(
              height: MediaQuery.of(context).size.height - 200,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  singleNew(context),
                  singleNew(context),
                  singleNew(context),
                  singleNew(context),
                  singleNew(context),
                ],
              )),
            ),
          ]),
        ));
  }
}

PreferredSizeWidget _appBar(context) {
  return AppBar(
    title: Center(child: Text("Quý khách")),
    backgroundColor: Color(0xFF008080),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => dashboardScreen()));
          },
          icon: Icon(Icons.notifications, size: 32))
    ],
  );
}

Widget singleNew(context) {
  return Container(
    padding: EdgeInsets.all(8.0),
    child: Card(
      color: Colors.white,
      child: Row(
        children: [
          Flexible(
              child: Container(
            padding: EdgeInsets.only(left: 8.0),
            height: 100.0,
            width: 80.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Warning.svg/2219px-Warning.svg.png",
              ),
            ),
          )),
          Container(
            padding: EdgeInsets.all(10.0),
            height: 100.0,
            width: 270.0,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              InkWell(
                child: Container(
                  child: Text(
                    "THÔNG BÁO TẠM NGƯNG CUNG CẤP ĐIỆN KHẨN CẤP",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: TextStyle(fontSize: 16),
                  ),
                  padding: const EdgeInsets.only(top: 4, left: 20),
                ),
                onTap: () => {
                  // prepareTestPdf(context).then((path) => {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) =>
                  //                   FullPdfViewerScreen(path)))
                  //     })
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => htmlContentScreen()))
                },
              ),
              InkWell(
                child: Container(
                  child: Text(
                    "Công Ty Điện Lực Sài Gòn trân trọng thông báo: trong ngày 30/08/2021",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  padding: const EdgeInsets.only(top: 4, left: 20),
                ),
                onTap: () => {
                  // prepareTestPdf(context).then((path) => {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) =>
                  //                   FullPdfViewerScreen(path)))
                  //     })
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => htmlContentScreen()))
                },
              )
            ]),
          ),
        ],
      ),
    ),
  );
}


// Container(
//               width: 40,
//               height: 40,
//               alignment: Alignment.bottomRight,
//               child: DraggableFab(
//                   child: Stack(
//                 children: [
//                   Image.asset("assets/images/textbox.png"),
//                   Center(
//                     child: Text("Tiền điện"),
//                   )
//                 ],
//               )),
//             )