import 'package:bonfire_newbonfire/screens/user_access/widgets/amber_btn_widget.dart';
import 'package:flutter/material.dart';
import 'const/color_pallete.dart';
import 'my_flutter_app_icons.dart';

class EmailScreen extends StatefulWidget {
  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: kAppbar(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: Container(
                height: 250.0,
                width: 300.0,
                decoration: BoxDecoration(
                    color: kAppbarColor,
                    border: Border.all(color: Colors.white38),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        MyFlutterApp.mail,
                        color: Colors.white70,
                        size: 70.0,
                      ),
                      Column(
                        children: [
                          Text(
                            "Inbox",
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Empty!",
                            style:
                                TextStyle(fontSize: 28.0, color: kAmberColor),
                          ),
                        ],
                      )

                      /*Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/Logo.png")
                          )
                      ),
                    ),*/
                    ],
                  ),
                ),
              ),
            ),
            Amber_Btn_Widget(
                context: context,
                text: "GO BACK",
                onPressed: () => Navigator.pop(context))
          ],
        ));
  }
}
