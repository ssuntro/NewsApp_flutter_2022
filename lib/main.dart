import 'package:flutter/material.dart';
import 'package:news_app/main_news_page.dart';
import 'package:news_app/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {MainNewsPage.routeName: (ctx) => MainNewsPage()},
      home: SplashPage(),
    );
  }
}
