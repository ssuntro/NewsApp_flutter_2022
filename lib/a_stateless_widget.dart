import 'package:flutter/material.dart';

class AStatelessWidget extends StatelessWidget {
  final String parsedString;

  AStatelessWidget({this.parsedString}) {
    print("AStatelessWidget is init");
    // Future.delayed(const Duration(milliseconds: 5000), () {
    //     print("navigate to main_news_page");
    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (_) => MainNewsPage()));
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(parsedString + " lesssssss"),
    );
  }
}
