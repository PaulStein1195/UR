import 'package:bonfire_newbonfire/const/color_pallete.dart';
import 'package:bonfire_newbonfire/my_flutter_app_icons.dart';
import 'package:bonfire_newbonfire/providers/auth.dart';
import 'package:bonfire_newbonfire/screens/user_access/widgets/amber_btn_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'model/notifications.dart';

int notifications_count = 0;
AuthProvider _auth;

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool isLoading = false;

  getActivityFeed() async {
    QuerySnapshot snapshot = await Firestore.instance
        .document(_auth.user.uid)
        .collection("feedItems")
        .orderBy("timestamp", descending: true)
        .limit(50)
        .getDocuments();
    List<NotificationItem> notifItems = [];
    snapshot.documents.forEach((doc) {
      notifItems.add(NotificationItem.fromDocument(doc));
      notifications_count++;
    });

    return notifItems;
  }

  @override
  void initState() {
    super.initState();
    getActivityFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppbar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /*Container(
            color: Colors.grey.shade50,
            child: FutureBuilder(
                future: getActivityFeed(),
                builder: (context, snapshot) {
                  var _data = snapshot.data;
                  if (!snapshot.hasData) {
                    return SpinKitFadingFour(
                      size: 50.0,
                      color: kAmberColor,
                    );
                  } else if(_data) {

                  }
                  return ListView(
                    children: _data,
                  );
                }),
          ),*/
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white38),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      MyFlutterApp.alarm,
                      color: Colors.white70,
                      size: 70.0,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "There is no Notifications YET.",
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Stay active and be fire!",
                      style: TextStyle(fontSize: 28.0, color: kAmberColor),
                    ),

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
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
