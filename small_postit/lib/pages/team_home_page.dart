import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:small_postit/pages/main_home_page.dart';
import 'package:small_postit/pages/recent_conversations_page.dart';
import 'package:small_postit/services/navigation_service.dart';
import 'profile_page.dart';
import 'search_page.dart';
import 'dashboard_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double _height;
  double _width;

  TabController _tabController;

  _HomePageState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Main_Home()));
          },
          icon: Icon(
            CupertinoIcons.home,
            size: 24.0,
            color: Theme.of(context).accentColor,
          ),
        ),
        // backgroundColor: Colors.amber.shade200,
        textTheme: TextTheme(
          title: TextStyle(fontSize: 28),
        ),
        title: Text(
          "Teams",
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontFamily: "Pacifico",
              fontWeight: FontWeight.w100),
        ),
        bottom: TabBar(
          labelStyle: TextStyle(fontSize: 13.0, fontFamily: "PT-Sans"),
          unselectedLabelColor: Theme.of(context).accentColor,
          indicatorColor: Theme.of(context).accentColor,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              color: Colors.amber.shade50),
          labelColor: Theme.of(context).accentColor,
          controller: _tabController,
          tabs: [
            Tab(
              child: Row(
                children: [
                  Icon(
                    Icons.people_outline,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "People",
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                children: [
                  Icon(
                    Icons.chat_bubble_outline,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Chats",
                  ),
                ],
              ),
            ),
            Tab(
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
        SearchPage(_height, _width),
        RecentConversationsPage(_height, _width),
        DashboardPage(_height, _width),
      ],
    );
  }
}
