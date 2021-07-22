import 'dart:io';
import 'dart:typed_data';
import 'package:boilerplate/ui/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:boilerplate/ui/pdf/pdf.dart';

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

class _notificationScreenState extends State<notificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(context),
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
                            onPressed: () {},
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
                  singleNew(context)
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
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => welcomeScreen()));
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
                    "THÔNG BÁO VỀ LỊCH CẮT ĐIỆN HÀ NỘI 10 - 14/7/2021",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: TextStyle(fontSize: 16),
                  ),
                  padding: const EdgeInsets.only(top: 4, left: 20),
                ),
                onTap: () => {
                  prepareTestPdf(context).then((path) => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FullPdfViewerScreen(path)))
                      })
                },
              ),
              InkWell(
                child: Container(
                  child: Text(
                    "Dưới đây là lịch cắt điện Hà Nội ngày 10-14/7 chi tiết",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  padding: const EdgeInsets.only(top: 4, left: 20),
                ),
                onTap: () => {
                  prepareTestPdf(context).then((path) => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FullPdfViewerScreen(path)))
                      })
                },
              )
            ]),
          ),
        ],
      ),
    ),
  );
}
