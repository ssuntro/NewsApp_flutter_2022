import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'a_stateful_widget.dart';
import 'a_stateless_widget.dart';
import 'main_news_page.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key) {
    print("SplashPage - init widget");
  }

  final String title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  _SplashPageState() {
    print("_SplashPageState - construct");
  }
  @override
  void didUpdateWidget(SplashPage oldWidget) {
    print("_SplashPageState - didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // print("_MyHomePageState - dispose");
    _controller.dispose();
    super.dispose();
  }

//////
  AnimationController _controller; //6 places
  var showButton = false;
  @override
  void initState() {
    print("_SplashPageState - initState");
    super.initState();
    _controller = AnimationController(vsync: this);
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => MainNewsPage()));
    });
  }

  Widget buildButton() {
    print("buildButton has been called");
    return showButton
        ? ElevatedButton(
            onPressed: () {
              setState(() {
                // print("setState when button did click");
              });
            },
            child: const Text('Button ja'),
          )
        : Container(
            // ~invisible view - to group things, can see if set bgColor

            color: Colors.amber,
            height: 10,
            width: 10,
          );
  }

  Widget buildLottie() {
    print("buildLottie has been called");
    return Lottie.asset('assets/dino.json', controller: _controller,
        onLoaded: (composition) {
      setState(() {
        print("setState when Lottie did load");
        _controller..duration = composition.duration;
        showButton = !showButton;
        // ..forward();
      });
      print("Lottie did load");
      // Future.delayed(const Duration(milliseconds: 5000), () {});
      _controller.repeat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildLottie(),
          buildButton(),
          AStatelessWidget(
            parsedString: DateTime.now().toString(),
          ),
          AStatefulWidget(
            parsedString: DateTime.now().toString(),
          ),
        ],
      ),
    );

    // floatingActionButton: FloatingActionButton(
    //   onPressed: () {},
    //   tooltip: 'Increment',
    //   child: Icon(Icons.add),
    // ),
    // );
  }
}
