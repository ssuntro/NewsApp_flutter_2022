import 'package:flutter/material.dart';

import 'news_category.dart';
import 'news_status.dart';

class NewsTile extends StatelessWidget {
  final NewsCategory category;
  final String title;
  final NewsStatus status;
  final Color color;
  final void Function(String) onDidClick;

  NewsTile(
      {@required this.category,
      @required this.title,
      @required this.status,
      @required this.color,
      @required this.onDidClick,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(0),
        height: 100,
        // color: index % 2 == 0 ? Colors.amber : Colors.blue,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: color,
              onPrimary: Colors.black,
              shadowColor: Colors.transparent,
              padding: EdgeInsets.all(0)),
          onPressed: () {
            onDidClick(title);
          },
          child: Row(
            children: [
              Image.asset(category.imagepath ?? "assets/images/default.png"),
              // Image.network(
              //     "https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg"),
              Container(
                width: 10,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      // style: TextStyle(backgroundColor: Colors.red),
                    ),

                    SizedBox(
                      height: 25,
                      child: IgnorePointer(
                        ignoring: true,
                        child: ElevatedButton(
                            child: Text(status.rawValue ?? ""),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: status
                                  .primaryColor, //Color.fromARGB(255, 198, 126, 210),
                              onPrimary: status
                                  .secondaryColor, //Color.fromARGB(255, 108, 8, 125),
                            )),
                      ),
                    )
                    // TextButton(
                    //     child: Text("Add to cart".toUpperCase(),
                    //         style: TextStyle(fontSize: 14)),
                    //     style: ButtonStyle(
                    //         padding:
                    //             MaterialStateProperty.all<EdgeInsets>(
                    //                 EdgeInsets.all(15)),
                    //         foregroundColor:
                    //             MaterialStateProperty.all<Color>(
                    //                 Colors.red),
                    //         shape: MaterialStateProperty.all<
                    //                 RoundedRectangleBorder>(
                    //             RoundedRectangleBorder(
                    //                 borderRadius:
                    //                     BorderRadius.circular(18.0),
                    //                 side: BorderSide(
                    //                     color: Colors.red)))),
                    //     onPressed: () => null),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}


// Card(
//           child: ListTile(
//             leading:
//                 Image.asset(category.imagepath ?? "assets/images/default.png"),
//             title: Text(
//               title,
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//               softWrap: false,
//               // style: TextStyle(backgroundColor: Colors.red),
//             ),
//             subtitle: IgnorePointer(
//                 ignoring: true,
//                 child: ElevatedButton(
//                     child: Text(status.rawValue ?? ""),
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       primary: status
//                           .primaryColor, //Color.fromARGB(255, 198, 126, 210),
//                       onPrimary: status
//                           .secondaryColor, //Color.fromARGB(255, 108, 8, 125),
//                     ))),
//             trailing: Icon(Icons.more_vert),
//           ),
//         )
