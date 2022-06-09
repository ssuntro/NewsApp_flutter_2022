import 'package:flutter/material.dart';

import 'DM/news_status.dart';

class NewsStatusWidget extends StatelessWidget {
  final NewsStatus model;

  NewsStatusWidget({@required this.model});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: ElevatedButton(
          child: Text(model.name),
          onPressed: () {
            print("aaaa");
          },
          style: ElevatedButton.styleFrom(
            primary: model.primaryColor,
            onPrimary: model.onPrimaryColor,
          )),
    );
  }
}
