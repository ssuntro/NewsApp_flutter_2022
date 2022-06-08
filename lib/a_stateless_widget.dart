import 'package:flutter/material.dart';

class AStatelessWidget extends StatelessWidget with WidgetsBindingObserver {
  final String parsedString;

  AStatelessWidget({this.parsedString}) {
    print("AStatelessWidget is init");
    // WidgetsBinding.instance.addObserver(this); //with, implements, or extends
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(parsedString + " lesssssss"),
    );
  }
}
