import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Tips extends StatefulWidget {
  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("Tips"),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl:
                "https://www.creativityatwork.com/featured-creativity-innovation-articles/",
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Center(
                  child: SpinKitThreeBounce( color: Colors.grey,),
                )
              : Stack(),
          /*Padding(
        padding: const EdgeInsets.fromLTRB(15, 12, 15, 10),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Creativity",
                  style: TextStyle(fontSize: 17),
                ),
                Divider(
                  color: Colors.black,
                ),
                WebView(
                  initialUrl: "https://codeseasy.com",
                  javascriptMode: JavascriptMode.unrestricted,
                ),
                Text(
                  "Teamwork",
                  style: TextStyle(fontSize: 17),
                ),
                Divider(
                  color: Colors.black,
                ),
                Text(
                  "Management",
                  style: TextStyle(fontSize: 17),
                ),
                Divider(
                  color: Colors.black,
                ),
              ],
            )
          ],
        ),
      ),*/
        ],
      ),
    );
  }
}
