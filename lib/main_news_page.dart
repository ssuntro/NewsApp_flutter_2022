import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/news_status.dart';
import 'package:news_app/news_status_widget.dart';

class MainNewsPage extends StatelessWidget {
  static const routeName = "main-news-page";

  MainNewsPage() {}

  final model = [
    {"title": "111", "status": NewsStatus.responded, "category": "animal"},
    {"title": "222", "status": NewsStatus.closed, "category": "globalWarming"},
    {"title": "333", "status": NewsStatus.closed, "category": "globalWarming"},
    {
      "title": "444",
      "status": NewsStatus.pendingResponse,
      "category": "finance"
    }
  ];

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
        appBar: AppBar(
          title: Text("Aaa"),
        ),
        body: ListView.builder(
            itemCount: 4,
            itemBuilder: (_, index) {
              return Container(
                  padding: EdgeInsets.all(0),
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shadowColor: Colors.pink,
                        padding: EdgeInsets.all(0)),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset("assets/animal.jpeg"),
                        Container(
                          width: 10,
                        ),
                        Flexible(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (model[index]["title"] is String)
                                  ? (model[index]["title"] as String)
                                  : "",
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),
                            ((model[index]["status"] is NewsStatus)
                                ? NewsStatusWidget(
                                    model:
                                        (model[index]["status"] as NewsStatus))
                                : Container())
                          ],
                        ))
                      ],
                    ),
                  ));
            }));
  }
}
