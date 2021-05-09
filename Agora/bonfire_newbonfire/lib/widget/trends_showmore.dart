import 'package:bonfire_newbonfire/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

class Trends_Detailed extends StatelessWidget {
  String trendImage, title, score;

  Trends_Detailed(this.trendImage, this.title, this.score);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0XFF717171),
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Icon(
                                MyFlutterApp.calendar,
                                size: 23.0,
                                color: Colors.white,
                              ),
                              Text(
                                "5:00 PM",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              // Text("5:00 PM", style: TextStyle(fontSize: 20.0, color: Colors.white),)
                            ],
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.0),
                              ),
                              Text(
                                score,
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.share,
                            color: Colors.white70,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.lightBlueAccent,
                            backgroundImage:
                                AssetImage("assets/images/user1.jpg"),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.lightBlueAccent,
                            backgroundImage:
                                AssetImage("assets/images/user2.jpg"),
                            radius: 25.0,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "+ 18 others",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Container(
                        height: 35.0,
                        width: 80.0,
                        child: Material(
                          color: Color(0XFFffb21a),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          child: MaterialButton(
                            elevation: 5.0,
                            onPressed: () {},
                            child: Text(
                              "JOIN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
/*
ListTile(
leading: Column(
children: [
Icon(
MyFlutterApp.calendar,
size: 40.0,
color: Colors.white,
),
Text(
"5:00 PM",
style: TextStyle(
fontSize: 20.0,
fontWeight: FontWeight.w700,
color: Colors.white),
),
// Text("5:00 PM", style: TextStyle(fontSize: 20.0, color: Colors.white),)
],
),
title: Text(
title,
style: TextStyle(
color: Colors.white70,
fontWeight: FontWeight.w700,
fontSize: 20.0),
),
subtitle: Text(
score,
style: TextStyle(
color: Theme.of(context).accentColor,
fontSize: 17,
fontWeight: FontWeight.w400),
),
trailing: Icon(
Icons.share,
color: Colors.white70,
),
),
*/
