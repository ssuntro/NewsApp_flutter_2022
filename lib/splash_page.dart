import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'main_news_page.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key) {
    print("Splash screen - contruct widget event");
  }

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _SplashPageState() {
    print("_SplashPageState - contruct state");
  }

  @override
  void initState() {
    super.initState();
    print("_SplashPageState - initState");
  }

  @override
  void didUpdateWidget(SplashPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("_SplashPageState - didUpdateWidget");
  }

  @override
  void dispose() {
    super.dispose();
    print("_SplashPageState - dispose");
  }

//
  Widget xx(BuildContext a) {
    return MainNewsPage();
  }

  var isDisplay = false;
  Widget buildLottie() {
    print("buildLottie");
    return Lottie.asset('assets/dino.json', onLoaded: (_) {
      // Future.delayed(const Duration(milliseconds: 5000), () {
      //   print("navigate to main_news_page");
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (_) => MainNewsPage()));
      // });

      setState(() {
        // isDisplay = !isDisplay;
      });
      print("setState is called.");
    });
  }

  Widget buildButton() {
    print("buildButton");
    return isDisplay
        ? ElevatedButton(onPressed: null, child: Text("aa"))
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildLottie(),
            buildButton(),
            // AStatelessWidget(),
            // AStatefulWidget()
          ],
        ),
      ),
    );
  }
}
