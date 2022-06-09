import 'package:flutter/material.dart';
import 'package:news_app/news.dart';
import 'package:news_app/news_category.dart';
import 'package:news_app/news_status.dart';

class AddNewsPage extends StatelessWidget {
  final Function(News) onAddButtonDidClick;

  AddNewsPage({@required this.onAddButtonDidClick});
  final model = News(
      title: "newNewsJa ${DateTime.now().toString()}",
      body:
          "ntentdsadklfhf;afdsadklfh;hf;afcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentdsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afdsadklfsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentdsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afdsadklfsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentdsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afdsadklfsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent",
      url: "google.com",
      status: NewsStatus.pendingResponse,
      category: NewsCategory.animal);
  static const routeName = '/add-news';
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key('some key here'),
        direction: DismissDirection.down,
        onDismissed: (_) => Navigator.pop(context),
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text('Add news'),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: Text(
                            model.title,
                            softWrap: true,
                            style: TextStyle(fontSize: 18),
                          )),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              onAddButtonDidClick(model);
                              Navigator.of(context).pop();
                            },
                            child: Text("Add"),
                          ),

                          // Row(
                          //   children: [
                          //     IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                          //     IconButton(onPressed: () {}, icon: Icon(Icons.abc))
                          //   ],
                          // )
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Text(model.body, softWrap: true),
                      SizedBox(
                        height: 100,
                      ),
                      Row(
                        children: [
                          Text("url: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(model.url)
                        ],
                      ),
                      Row(
                        children: [
                          Text("Status: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(model.status.name.toUpperCase())
                        ],
                      ),
                      Row(
                        children: [
                          Text("Category: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(model.category.name.toUpperCase())
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )

            // body: Center(
            //   child: CircularProgressIndicator(),
            // )
            ));
  }
}
