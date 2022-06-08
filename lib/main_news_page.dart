import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MainNewsPage extends StatelessWidget {
  static const routeName = "main-news-page";

  MainNewsPage() {}

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
        appBar: AppBar(
          title: Text("Aaa"),
        ),
        body: ListView.builder(
            itemCount: 4,
            itemBuilder: (_, index) {
              return Container(
                  padding: EdgeInsets.all(0),
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shadowColor: Colors.pink,
                        padding: EdgeInsets.all(0)),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset("assets/animal.jpeg"),
                        Container(
                          width: 10,
                        ),
                        Flexible(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "aaaaaaaaaaaaaaaaaaaaaaahhhaaaaaaa",
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),
                            ElevatedButton(
                              child: Text("Animal"),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 198, 126, 210),
                                  onPrimary: Color.fromARGB(255, 108, 8, 125)),
                            )
                          ],
                        ))
                      ],
                    ),
                  ));
            }));
  }
}
