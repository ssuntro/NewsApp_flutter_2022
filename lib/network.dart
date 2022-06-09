import 'dart:convert';
import 'dart:io';

import 'package:news_app/DM/news.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/DM/news_category.dart';
import 'package:news_app/DM/news_status.dart';

class Network {
  static Future<List<News>> fetchNews() {
    return http
        .get(Uri.parse(
            "https://www.hackingwithswift.com/samples/petitions-2.json"))
        .then((response) {
      if (response.statusCode >= 400) {
        throw HttpException("http error ${response.statusCode}");
      }

      print("response");

      final data = json.decode(response.body) as Map<String, dynamic>;
      final animal = (data["results"] as List<dynamic>).take(5).map((item) {
        return News(
            title: (item["title"] is String) ? (item["title"] as String) : "",
            body: (item["body"] is String) ? (item["body"] as String) : "",
            url: (item["url"] is String) ? (item["url"] as String) : "",
            status: NewsStatus.values
                .firstWhere((e) => e.rawValue == item["status"]),
            category: NewsCategory.animal);
      }).toList();

      final globelWarming =
          (data["results"] as List<dynamic>).getRange(5, 10).map((item) {
        return News(
            title: (item["title"] is String) ? (item["title"] as String) : "",
            body: (item["body"] is String) ? (item["body"] as String) : "",
            url: (item["url"] is String) ? (item["url"] as String) : "",
            status: NewsStatus.values
                .firstWhere((e) => e.rawValue == item["status"]),
            category: NewsCategory.globalWarming);
      }).toList();

      final finance =
          (data["results"] as List<dynamic>).getRange(10, 15).map((item) {
        return News(
            title: (item["title"] is String) ? (item["title"] as String) : "",
            body: (item["body"] is String) ? (item["body"] as String) : "",
            url: (item["url"] is String) ? (item["url"] as String) : "",
            status: NewsStatus.values
                .firstWhere((e) => e.rawValue == item["status"]),
            category: NewsCategory.finance);
      }).toList();

      return [...animal, ...globelWarming, ...finance];
    }).catchError((err) {
      return <News>[];
    });
  }
}
