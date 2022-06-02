import 'package:flutter/material.dart';

class AStatefulWidget extends StatefulWidget {
  final String parsedString;
  AStatefulWidget({this.parsedString}) {
    //typically parse and store here not leak to stateObj
    print("AStatefulWidget - new widget");
  }

  @override
  State<AStatefulWidget> createState() => _AStatefulWidgetState();
}

class _AStatefulWidgetState extends State<AStatefulWidget> {
  final String timeStamp = DateTime.now().toString();
  _AStatefulWidgetState() {
    print("_AStatefulWidgetState is constructed");
  }

  @override
  void initState() {
    print("_AStatefulWidgetState initState");
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AStatefulWidget oldWidget) {
    print("_AStatefulWidgetState didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print("_AStatefulWidgetState dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.parsedString + " fulllllll " + timeStamp),
    );
  }
}
