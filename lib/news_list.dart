import 'package:flutter/material.dart';

import 'news.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'news_category.dart';
import 'news_status.dart';

class NewsList with ChangeNotifier {
  List<News> _items = [];

  List<News> get items {
    return [..._items];
  }

  void reorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      // removing the item at oldIndex will shorten the list by 1.
      newIndex -= 1;
    }

    final News element = _items.removeAt(oldIndex);
    _items.insert(newIndex, element);
    notifyListeners();
  }

  void addItem(News aNews) {
    _items.add(aNews);
    notifyListeners();
  }

  void removeItemFor({String title}) {
    final index = _items.indexWhere((elem) => elem.title == title);
    _items.removeAt(index);
    notifyListeners();
  }

  Future<void> fetchFromNetwork() async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.hackingwithswift.com/samples/petitions-2.json'));
      if (response.statusCode >= 400) {
        throw HttpException("Error Jaaaa ${response.statusCode}");
      }

      final data = json.decode(response.body) as Map<String, dynamic>;
      final animals = (data["results"] as List<dynamic>).take(5).map((item) {
        return News(
            title: (item["title"] is String) ? (item["title"] as String) : "",
            body: (item["body"] is String) ? (item["body"] as String) : "",
            url: (item["url"] is String) ? (item["url"] as String) : "",
            status: (item["status"] is String)
                ? NewsStatus.values
                    .firstWhere((e) => e.rawValue == item["status"])
                : null,
            category: NewsCategory.animal);
      }).toList();

      final globalWarming =
          (data["results"] as List<dynamic>).getRange(5, 9).map((item) {
        return News(
            title: (item["title"] is String) ? (item["title"] as String) : "",
            body: (item["body"] is String) ? (item["body"] as String) : "",
            url: (item["url"] is String) ? (item["url"] as String) : "",
            status: (item["status"] is String)
                ? NewsStatus.values
                    .firstWhere((e) => e.rawValue == item["status"])
                : null,
            category: NewsCategory.globalWarming);
      }).toList();

      final finance =
          (data["results"] as List<dynamic>).getRange(10, 14).map((item) {
        return News(
            title: (item["title"] is String) ? (item["title"] as String) : "",
            body: (item["body"] is String) ? (item["body"] as String) : "",
            url: (item["url"] is String) ? (item["url"] as String) : "",
            status: (item["status"] is String)
                ? NewsStatus.values
                    .firstWhere((e) => e.rawValue == item["status"])
                : null,
            category: NewsCategory.finance);
      }).toList();
      _items = [...animals, ...globalWarming, ...finance];
    } catch (error) {
      _items = <News>[];
    } finally {
      notifyListeners();
    }
  }
}
