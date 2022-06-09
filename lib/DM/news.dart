import 'package:flutter/material.dart';
import 'package:news_app/DM/news_category.dart';
import 'package:news_app/DM/news_status.dart';

class News {
  final String title; //let, val == final
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
