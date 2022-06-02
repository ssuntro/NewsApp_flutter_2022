import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'a_stateful_widget.dart';
import 'a_stateless_widget.dart';
import 'main_news_page.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key) {
    print("Splash screen - contruct widget event");
  }

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  _SplashPageState() {
    print("_SplashPageState - contruct state");
  }

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    print("_SplashPageState - initState");
    // Future.delayed(const Duration(milliseconds: 5000), () {
    //   print("navigate to main_news_page");
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (_) => MainNewsPage()));
    // });

    _controller = AnimationController(vsync: this);
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
    _controller.dispose();
  }

  var isDisplay = false;
  Widget buildLottie() {
    print("buildLottie");
    return Lottie.asset('assets/dino.json', onLoaded: (composition) {
      setState(() {
        _controller
          ..duration = composition.duration
          ..forward();
      });
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
            AStatelessWidget(
              parsedString: DateTime.now().toString(),
            ),
            SizedBox(
              height: 100,
            ),
            AStatefulWidget(
              parsedString: DateTime.now().toString(),
            ),
          ],
        ),
      ),
    );
  }
}
