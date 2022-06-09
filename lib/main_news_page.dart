import 'package:flutter/material.dart';
import 'package:news_app/DM/news.dart';
import 'package:news_app/DM/news_category.dart';
import 'package:news_app/DM/news_status.dart';
import 'package:news_app/add_news_page.dart';
import 'package:news_app/network.dart';

import 'news_tile.dart';

List<News> stubData() => [
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

class MainNewsPage extends StatefulWidget {
  static const routeName = "main-news-page";

  MainNewsPage() {}

  @override
  State<MainNewsPage> createState() => _MainNewsPageState();
}

class _MainNewsPageState extends State<MainNewsPage> {
  var model = stubData();

  var isReorderEnabled = false;

  void onReorder(int oldIndex, int newIndex) {
    print("reorder ja");

    if (!isReorderEnabled) {
      return;
    }
    if (oldIndex < newIndex) {
      newIndex = newIndex - 1;
    }
    final News news = model.removeAt(oldIndex);
    model.insert(newIndex, news);
  }

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
        appBar: AppBar(
          leading: ElevatedButton(
            onPressed: () {
              showGeneralDialog(
                  transitionBuilder: (context, ani1, ani2, child) {
                    return SlideTransition(
                      position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                          .animate(ani1),
                      child: child,
                    );
                  },
                  context: context,
                  pageBuilder: (context, anim1, anim2) {
                    return AddNewsPage(
                      onAdded: (addedNews) {
                        setState(() {
                          model.add(addedNews);
                        });
                      },
                    );
                  });
            },
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
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        model = stubData();
                      });
                    },
                    child: Text("Refresh")),
              ],
            )
          ],
        ),
        body: RefreshIndicator(
          child: ReorderableListView.builder(
              itemCount: model.length,
              itemBuilder: (_, index) {
                return NewsTile(
                    model: model[index],
                    color: isReorderEnabled ? Colors.amber : Colors.white,
                    key: Key(model[index].title ?? ""));
              },
              onReorder: onReorder),
          onRefresh: onPullToRefresh,
        ));
  }

  Future<void> onPullToRefresh() {
    return Network.fetchNews().then((newModel) {
      setState(() {
        model = newModel;
      });
    });
  }
}
