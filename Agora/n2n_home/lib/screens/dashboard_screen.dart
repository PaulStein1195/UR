import 'package:flutter/material.dart';
import 'package:n2n_home/const/color_pallete.dart';

import '../my_flutter_app_icons.dart';
import 'edit_profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool notificationOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 55.0,
            centerTitle: true,
            title: Text("Me", style: TextStyle(color: kBelongMarineBlue),),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => EditProfileScreen())),
                    child: Card(
                      color: Colors.grey.shade50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  image: DecorationImage(
                                      fit: BoxFit.fill, image: NetworkImage(""))),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Paul Barrio",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text("pablerillas.11.pb@gmail.com"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
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
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*Icon(
                            MyFlutterApp.history,
                            size: 20.0,
                            color: kBottomNavigationBar,
                          ),*/
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "My Summary",
                              style: TextStyle(fontSize: 16.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  /*Divider(color: Colors.black),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            MyFlutterApp.user_1,
                            size: 20.0,
                            color: kBottomNavigationBar,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "My Profile",
                              style: TextStyle(fontSize: 16.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),*/
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            notificationOff
                                ? MyFlutterApp.lock
                                : MyFlutterApp.lock,
                            size: 20.0,
                            color: kBottomNavigationBar,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Notifications",
                              style: TextStyle(fontSize: 16.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100.0),
                            child: Text(
                              notificationOff ? "OFF" : "ON",
                              style: TextStyle(
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.grey.shade700),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.black),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*Icon(
                            MyFlutterApp.lightbulb,
                            size: 20.0,
                            color: kBottomNavigationBar,
                          ),*/
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
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
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /*Icon(
                            MyFlutterApp.cog,
                            size: 20.0,
                            color: kBottomNavigationBar,
                          ),*/
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
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
            ]),
          )
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
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700),
        ),
        Container(
          margin: EdgeInsets.only(top: 4.0),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
