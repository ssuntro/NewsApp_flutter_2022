import 'package:flutter/material.dart';

class AddNewsPage extends StatelessWidget {
  Widget titleLine() {
    return Row(
      children: [
        Flexible(
            child: Text(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          softWrap: true,
          style: TextStyle(fontSize: 18),
        )),
        SizedBox(
          width: 20,
        ),
        ElevatedButton(onPressed: () {}, child: Text("Add"))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('annja'),
      direction: DismissDirection.down,
      onDismissed: (_) => Navigator.pop(context),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Add news"),
        ),
        body: Column(
          children: [titleLine()],
        ),
      ),
    );
  }
}
