import 'package:bonfire_newbonfire/screens/user_access/widgets/amber_btn_widget.dart';
import 'package:flutter/material.dart';

import '../select_bonfires_screen.dart';

class Notifications_Panel_Widget extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Notifications_Panel_Widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Headline1("Join your first Bonfire!"),
            Headline2(context, "What is that you want to be involved?"),
            SizedBox(
              height: 20.0,
            ),
            Amber_Btn_Widget(
              context: context,
              text: "START",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => FirstSuggestionScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}

Widget Headline2(BuildContext context, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
    child: Text(
      text,
      style: TextStyle(
          color: Theme.of(context).accentColor,
          fontSize: 18.0,
          //letterSpacing: 0.6,
          fontWeight: FontWeight.w600),
      textAlign: TextAlign.center,
    ),
  );
}

Widget Headline1(String text) {
  return Text(
    text,
    style: TextStyle(
        color: Colors.grey.shade200,
        fontSize: 28.0,
        letterSpacing: 0.6,
        fontWeight: FontWeight.w700),
    textAlign: TextAlign.center,
  );
}

/*Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 2.0),
                        child: Text(
                          "Does this fires you up?",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      BonfireOptions(),*/
