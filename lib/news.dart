import 'package:flutter/material.dart';

import 'news_category.dart';
import 'news_status.dart';

class News {
  final String title;
  final String body;
  final String url;
  final NewsStatus status;
  final NewsCategory category;

  News(
      {@required this.title,
      @required this.body,
      @required this.url,
      @required this.status,
      @required this.category});
}
