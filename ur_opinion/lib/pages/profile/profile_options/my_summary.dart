import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MySummary extends StatefulWidget {
  @override
  _MySummaryState createState() => _MySummaryState();
}

class _MySummaryState extends State<MySummary> with SingleTickerProviderStateMixin {
  TabController _tabController;

  _MySummaryState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        title: Text(
          "My Summary",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w100),
        ),
        bottom: TabBar(
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.grey.shade700,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.grey.shade700,
          controller: _tabController,
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "My Activity", style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Achievements", style: TextStyle(fontSize: 16),
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
        MyPosts(),
        MyAchievements()
      ],
    );
  }
}

class MyPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
    );
  }
}

class MyAchievements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
    );
  }
}

