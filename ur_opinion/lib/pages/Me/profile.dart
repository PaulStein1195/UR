import 'package:flutter/material.dart';
import 'package:ur_opinion/home.dart';
import 'package:ur_opinion/pages/Me/profile_menus/my_summary.dart';
import 'package:ur_opinion/pages/Me/profile_menus/security_privacy.dart';
import 'package:ur_opinion/pages/Me/profile_menus/tips.dart';
import 'package:ur_opinion/widgets/my_flutter_app_icons.dart';
import 'package:ur_opinion/pages/Me/profile_menus/my_summary.dart';
import 'package:ur_opinion/pages/Me/profile_menus/security_privacy.dart';
import 'package:ur_opinion/pages/Me/profile_menus/tips.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool notificationOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(43.0),
        child: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Me",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade900,
                fontSize: 18.5),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                buildProfileHeader(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProfileHeader(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 7.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.grey,
                  backgroundImage:
                      NetworkImage("https://picsum.photos/250?image=3"),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 10, 10),
                      child: Column(
                        children: <Widget>[
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Paul Barrionuevo",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17.0),
                              )),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "Bio",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //Divider(color: Colors.grey.shade800),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //buildCountColumn("clubs", 0),
                buildCountColumn("teams", 0),
                buildCountColumn("posts", 0),
                buildCountColumn("reactions", 0),
                //buildCountColumn("followers", 0),
              ],
            ),
          ),
          Divider(color: Colors.black),
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => MySummary())),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(MyFlutterApp.newspaper, size: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Text(
                      "My Summary",
                      style: TextStyle(fontSize: 16.5),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(color: Colors.black),
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage())),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(MyFlutterApp.user, size: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Text(
                      "My Profile",
                      style: TextStyle(fontSize: 16.5),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(color: Colors.black),
          GestureDetector(
            onTap: () {
              setState(() {
                if (notificationOff == false) {
                  notificationOff = true;
                } else {
                  notificationOff = false;
                }
              });
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                      notificationOff
                          ? MyFlutterApp.notifications_paused
                          : MyFlutterApp.notifications_active,
                      size: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Text(
                      "Notifications",
                      style: TextStyle(fontSize: 16.5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 170.0),
                    child: Text(
                      notificationOff ? "OFF" : "ON",
                      style: TextStyle(
                          fontSize: 17.5, fontWeight: FontWeight.w800),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(color: Colors.black),
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Tips())),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    MyFlutterApp.lightbulb_1,
                    size: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Text(
                      "Tips",
                      style: TextStyle(fontSize: 16.5),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(color: Colors.black),
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => Security_Privacy())),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    MyFlutterApp.cog_alt,
                    size: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Text(
                      "Settings",
                      style: TextStyle(fontSize: 16.5),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildCountColumn(String label, int count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count.toString(),
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Container(
          margin: EdgeInsets.only(top: 4.0),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
