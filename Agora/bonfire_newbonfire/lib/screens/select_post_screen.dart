import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../my_flutter_app_icons.dart';

class SelectPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(41, 39, 40, 200.0),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: (){},
                  child: CircleAvatar(
                    backgroundColor: Color(0XFF333333),//Theme.of(context).accentColor,
                    radius: 50.0,
                    child: Icon(
                      MyFlutterApp.calendar,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "Divulgation",
                  style: TextStyle(color: Colors.white70, fontSize: 25.0),
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Color(0XFF333333),//Theme.of(context).accentColor,
                    radius: 50.0,
                    child: Icon(
                      Icons.help_outline,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "Question",
                  style: TextStyle(color: Colors.white70, fontSize: 25.0),
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "create_post"),
                  child: CircleAvatar(
                    backgroundColor: Color(0XFF333333),//Theme.of(context).accentColor,
                    radius: 50.0,
                    child: Icon(
                      MyFlutterApp.pencil,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "Post",
                  style: TextStyle(color: Colors.white70, fontSize: 25.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
