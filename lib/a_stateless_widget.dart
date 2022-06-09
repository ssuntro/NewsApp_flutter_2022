import 'package:flutter/material.dart';

class AStatelessWidget extends StatelessWidget with WidgetsBindingObserver {
  final String parsedString;

  AStatelessWidget({this.parsedString}) {
    print("AStatelessWidget is init");
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(parsedString + " lesssssss"),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("didChangeAppLifecycleState - ${state}");
    super.didChangeAppLifecycleState(state);
  }
}
