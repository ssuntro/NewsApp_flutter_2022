import 'package:flutter/material.dart';
import 'package:news_app/DM/news_category.dart';
import 'package:news_app/DM/news_status.dart';

class News {
  final String title; //let, val == final
  final NewsStatus status;
  final NewsCategory category;

  News({@required this.title, @required this.status, @required this.category});
}
