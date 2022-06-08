import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/DM/news.dart';
import 'package:news_app/DM/news_category.dart';
import 'package:news_app/DM/news_status.dart';
import 'package:news_app/news_status_widget.dart';

class MainNewsPage extends StatelessWidget {
  static const routeName = "main-news-page";

  MainNewsPage() {}

  final model = [
    News(
        title: "111",
        status: NewsStatus.responded,
        category: NewsCategory.animal),
    News(
        title: "222",
        status: NewsStatus.closed,
        category: NewsCategory.globalWarming),
    News(
        title: "333",
        status: NewsStatus.closed,
        category: NewsCategory.globalWarming),
    News(title: null, status: NewsStatus.pendingResponse, category: null)
  ];

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
        appBar: AppBar(
          leading: ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          // title: Text("Aaa"),
          actions: [
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Reorder")),
                ElevatedButton(onPressed: () {}, child: Text("Refresh")),
              ],
            )
          ],
        ),
        body: ListView.builder(
            itemCount: model.length,
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
                        Image.asset(model[index].category?.imagepath ??
                            "assets/default.png"),
                        Container(
                          width: 10,
                        ),
                        Flexible(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model[index].title ?? "",
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),
                            (model[index].status != null
                                ? NewsStatusWidget(
                                    model: model[index].status,
                                  )
                                : Container())
                          ],
                        ))
                      ],
                    ),
                  ));
            }));
  }
}
