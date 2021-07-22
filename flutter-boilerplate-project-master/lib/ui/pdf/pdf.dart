import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';

//const String _documentPath = 'assets/pdf_files/final_report.pdf';

class FullPdfViewerScreen extends StatelessWidget {
  final String pdfPath;

  FullPdfViewerScreen(this.pdfPath);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("Xem chi tiết thông tin"),
      ),
      path: pdfPath,
      primary: true,
    );
  }
}


// class pdfScreen extends StatefulWidget {
//   const pdfScreen({Key? key}) : super(key: key);

//   @override
//   _pdfScreenState createState() => _pdfScreenState();
// }

// class _pdfScreenState extends State<pdfScreen> {
//   Future<String> prepareTestPdf() async {
//     final ByteData bytes =
//         await DefaultAssetBundle.of(context).load(_documentPath);
//     final Uint8List list = bytes.buffer.asUint8List();

//     final tempDir = await getTemporaryDirectory();
//     final tempDocumentPath = '${tempDir.path}/$_documentPath';

//     final file = await File(tempDocumentPath).create(recursive: true);
//     file.writeAsBytesSync(list);
//     return tempDocumentPath;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("PDF File"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () => {
//                       prepareTestPdf().then((path) => {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         FullPdfViewerScreen(path)))
//                           })
//                     },
//                 child: Text("Open PDF File"))
//           ],
//         ),
//       ),
//     );
//   }
// }
