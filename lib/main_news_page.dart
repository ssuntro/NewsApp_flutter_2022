import 'package:flutter/material.dart';
import 'package:news_app/DM/news.dart';
import 'package:news_app/DM/news_category.dart';
import 'package:news_app/DM/news_status.dart';

import 'news_tile.dart';

class MainNewsPage extends StatefulWidget {
  static const routeName = "main-news-page";

  MainNewsPage() {}

  @override
  State<MainNewsPage> createState() => _MainNewsPageState();
}

class _MainNewsPageState extends State<MainNewsPage> {
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
    News(title: "444", status: NewsStatus.pendingResponse, category: null)
  ];

  var isReorderEnabled = false;

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
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isReorderEnabled = !isReorderEnabled;
                      });
                    },
                    child: Text("Reorder")),
                ElevatedButton(onPressed: () {}, child: Text("Refresh")),
              ],
            )
          ],
        ),
        body: ReorderableListView.builder(
          itemCount: model.length,
          itemBuilder: (_, index) {
            return NewsTile(
                model: model[index],
                color: isReorderEnabled ? Colors.amber : Colors.white,
                key: Key(model[index].title ?? ""));
          },
          onReorder: (oldIndex, newIndex) {
            print("reorder ja");

            if (!isReorderEnabled) {
              return;
            }
            if (oldIndex < newIndex) {
              newIndex = newIndex - 1;
            }
            final News news = model.removeAt(oldIndex);
            model.insert(newIndex, news);
          },
        ));
  }
}
