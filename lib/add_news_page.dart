import 'package:flutter/material.dart';
import 'package:news_app/DM/news.dart';
import 'package:news_app/DM/news_category.dart';
import 'package:news_app/DM/news_status.dart';

class AddNewsPage extends StatelessWidget {
  final void Function(News) onAdded;
  AddNewsPage({@required this.onAdded});
  final model = News(
      title: "${DateTime.now().toString()}",
      body:
          "ntentdsadklfhf;afdsadklfh;hf;afcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentdsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afdsadklfsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentdsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afdsadklfsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentdsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afdsadklfsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afdsadklfh;hf;afcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent",
      url: "google.com",
      status: NewsStatus.pendingResponse,
      category: NewsCategory.animal);

  Widget titleLine(BuildContext context) {
    return Row(
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
              onAdded(model);
              Navigator.pop(context);
            },
            child: Text("Add"))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('annja'),
      direction: DismissDirection.down,
      onDismissed: (_) => Navigator.pop(context),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Add news"),
        ),
        body: Column(
          children: [
            titleLine(context),
            SizedBox(height: 100),
            Text(model.body, softWrap: true),
            SizedBox(height: 50),
            bottomLine(label: "url: ", value: "https://google.com"),
            bottomLine(label: "status: ", value: "https://google.com"),
            bottomLine(label: "category: ", value: "https://google.com")
          ],
        ),
      ),
    );
  }

  Widget bottomLine({String label, String value}) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value)
      ],
    );
  }
}
