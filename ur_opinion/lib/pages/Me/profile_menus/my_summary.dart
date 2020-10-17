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
      body: MyPosts(),
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

