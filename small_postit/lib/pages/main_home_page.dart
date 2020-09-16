import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:small_postit/models/post.dart';
import 'package:small_postit/models/user.dart';
import 'package:small_postit/pages/team_home_page.dart';
import 'package:small_postit/pages/profile_page.dart';
import 'package:small_postit/pages/search_page.dart';
import 'package:small_postit/providers/auth_provider.dart';
import 'package:small_postit/services/db_service.dart';
import 'create_post_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'agora_page.dart';
import 'dashboard_page.dart';
import 'package:firebase_database/firebase_database.dart';
import "../models/post.dart";

class Main_Home extends StatefulWidget {

  @override
  _Main_HomeState createState() => _Main_HomeState();
}

class _Main_HomeState extends State<Main_Home>
    with SingleTickerProviderStateMixin {
  double _height;
  double _width;
  TabController _tabController;
  AuthProvider _auth;

  List<Post> postsList = [];

  _Main_HomeState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.people_outline,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        textTheme: TextTheme(
          title: TextStyle(fontSize: 28),
        ),
        title: Text(
          "UrOpinion",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: "Pacifico",
              fontWeight: FontWeight.w100),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreatePostPage()));
            },
            icon: Icon(
              CupertinoIcons.create_solid,
              size: 29.0,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
        bottom: TabBar(
          labelStyle: TextStyle(fontSize: 13.0, fontFamily: "PT-Sans"),
          unselectedLabelColor: Theme.of(context).primaryColor,
          indicatorColor: Theme.of(context).accentColor,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Theme.of(context).accentColor,
          controller: _tabController,
          tabs: [
            Tab(
              child: Row(
                children: [
                  Icon(
                    Icons.home,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Home",
                  ),
                ],
              ),
            ),
            /*Tab(
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.news,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Data",
                  ),
                ],
              ),
            ),*/
            Tab(
                child: Row(
              children: [
                Icon(
                  CupertinoIcons.profile_circled,
                  size: 25,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Profile",
                ),
              ],
            )),
          ],
        ),
      ),
      body: _tabBarPages(),
    );
  }

  Widget _tabBarPages() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        AgoraPage(),
        //DashboardPage(_height, _width),
        ProfilePage(_height, _width),
      ],
    );
  }
}
