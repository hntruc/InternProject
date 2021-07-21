import 'package:flutter/material.dart';

class notificationScreen extends StatefulWidget {
  const notificationScreen({Key? key}) : super(key: key);

  @override
  _notificationScreenState createState() => _notificationScreenState();
}

class _notificationScreenState extends State<notificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
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
                  singleNew(),
                  singleNew(),
                  singleNew(),
                  singleNew(),
                  singleNew(),
                  singleNew(),
                  singleNew(),
                  singleNew()
                ],
              )),
            ),
          ]),
        ));
  }
}

PreferredSizeWidget _appBar() {
  return AppBar(
    title: Center(
      child: Padding(
          padding: const EdgeInsets.only(left: 50), child: Text("Quý khách")),
    ),
    backgroundColor: Colors.blue[900],
    actions: [
      IconButton(
          onPressed: () {
            print("Sth");
          },
          icon: Icon(Icons.notifications, size: 32))
    ],
  );
}

Widget singleNew() {
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
                onTap: () => print("Tapped"),
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
                onTap: () => print("Tapped"),
              )
            ]),
          ),
        ],
      ),
    ),
  );
}
