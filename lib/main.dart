import 'package:flutter/material.dart';
import 'package:news_app/main_news_page.dart';
import 'package:news_app/news_list.dart';
import 'package:news_app/news_page.dart';
import 'package:news_app/splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: NewsList(),
        child: MaterialApp(
          routes: {
            MainNewsPage.routeName: (ctx) => MainNewsPage(),
            // AddNewsPage.routeName: (ctx) => AddNewsPage(),
            NewsPage.routeName: (ctx) => NewsPage(),
          },
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashPage(title: 'News App'),
        ));
  }
}
