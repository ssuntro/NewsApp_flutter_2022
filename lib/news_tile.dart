import 'package:flutter/material.dart';
import 'package:news_app/DM/news_category.dart';

import 'DM/news.dart';
import 'news_status_widget.dart';

class NewsTile extends StatelessWidget {
  final News model;

  NewsTile({@required this.model, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(0),
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              shadowColor: Colors.pink,
              padding: EdgeInsets.all(0)),
          onPressed: () {
            print("aaaa");
          },
          child: Row(
            children: [
              Image.asset(model?.category?.imagepath ?? "assets/default.png"),
              Container(
                width: 10,
              ),
              Flexible(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model?.title ?? "",
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                  (model?.status != null
                      ? NewsStatusWidget(
                          model: model.status,
                        )
                      : Container())
                ],
              ))
            ],
          ),
        ));
  }
}
