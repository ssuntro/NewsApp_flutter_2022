import 'dart:io';
import 'dart:math';

import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:news_app/news.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class NewsPage extends StatefulWidget {
  static const routeName = 'news-page';

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Event buildEvent({News model, Recurrence recurrence}) {
    return Event(
      title: model.title,
      description: model.body,
      location: 'News app',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(minutes: 30)),
      allDay: false,
      iosParams: IOSParams(
        reminder: Duration(minutes: 40),
      ),
      androidParams: AndroidParams(
        emailInvites: ["ann@ktbg.com"],
      ),
      recurrence: recurrence,
    );
  }

  onShareButtonDidClick({String path}) async {
    // try {
    //   await launchUrl(Uri.parse('https://flutter.dev'));
    // } catch (error) {}

    // jumpTofb();

    try {
      await launchUrl(Uri.parse(path));
    } catch (error) {
      print("error");
    }
  }

  jumpTofb() async {
    try {
      // final canLaunch = await canLaunchUrl(Uri.parse('fb://profile/555'));

      if (Platform.isIOS) {
        await launchUrl(Uri.parse(
            ['fb://profile/555', 'itms-apps://apple.com/app/id284882215'][1]));
      }
      if (Platform.isAndroid) {
        await launchUrl(Uri.parse(
            ['fb://page/555', 'market://details?id=com.facebook.katana'][1]));
      }
    } catch (error) {
      print("error");
    }
  }

  ///bridging native
  @override
  initState() {
    super.initState();
    _getTitle();
  }

/////bridging
  static const platform = MethodChannel('flutter.native/helper');
  String _title = 'Unknown';
  Future<void> _getTitle() async {
    String title;
    try {
      final String result = await platform
          .invokeMethod('helloFromNativeCode'); //helloFromNativeCode
      title = result;
    } on PlatformException catch (e) {
      title = "Failed to contract native code: '${e.message}'.";
    }

    setState(() {
      _title = title;
    });
  }

//////
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context).settings.arguments ??
        <String, dynamic>{}) as Map;
    final model = arguments["news"] as News;
    final onRemove = arguments["onRemove"] as Function(String);
    return Scaffold(
      appBar: AppBar(
        title: Text("${_title}"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Text(
                      model?.title ?? "",
                      softWrap: true,
                      style: TextStyle(fontSize: 18),
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: model == null
                              ? null
                              : () {
                                  Add2Calendar.addEvent2Cal(
                                    buildEvent(model: model),
                                  );
                                },
                          child: Icon(Icons.calendar_month),
                        ),
                        ElevatedButton(
                          onPressed: model == null
                              ? null
                              : () {
                                  onShareButtonDidClick(path: model.url);
                                },
                          child: Icon(Icons.ios_share),
                        ),
                        ElevatedButton(
                            onPressed: (model == null || onRemove == null)
                                ? null
                                : () {
                                    Navigator.of(context).pop();
                                    onRemove(model.title);
                                  },
                            child: Icon(Icons.remove_circle),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                            )),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Text(model?.body ?? "", softWrap: true),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
