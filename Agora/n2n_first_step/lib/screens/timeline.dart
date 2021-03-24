import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Timeline extends StatefulWidget {
  static const id = "timeline";

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> with TickerProviderStateMixin {
  TabController _tabController;

  _TimelineState() {
    _tabController = TabController(length: 3, initialIndex: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 30.0,
            //centerTitle: true,
            actions: [
              SizedBox(
                width: 120.0,
              ),
              IconButton(
                splashColor: Colors.orange,
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.settings,
                  size: 30.0,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(
                width: 10.0,
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "",
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "THINGS TO KNOW",
                        style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w700),
                      ),
                      IconButton(
                        icon: Icon(Icons.dehaze),
                        iconSize: 20.0,
                        color: Colors.grey.shade600,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: Container(
                  height: 120,
                  width: 100,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.fromLTRB(10, 2, 10, 5),
                      children: [
                        Column(
                          children: [
                            Card(
                              color: Colors.white70,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.green.shade700,
                                          Colors.green.shade500,
                                          Colors.green.shade300
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          /*Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                      Wealth()));*/
                                        },
                                        child: Text(
                                          "WEALTH",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.89),
                                              fontSize: 16.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0)),
                              elevation: 3,
                            ),
                            /*SizedBox(height: 5.0,),
                            Text(
                              "Wealth",
                              textAlign: TextAlign.center,
                            ),*/
                          ],
                        ),
                        Column(
                          children: [
                            Card(
                              color: Colors.white70,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Stack(
                                children: <Widget>[
                                  GestureDetector(
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.indigo.shade700,
                                            Colors.indigo.shade400,
                                            Colors.indigo.shade300
                                          ],
                                        ),
                                      ),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            /*Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                    context) =>
                                                        Todos()));*/
                                          },
                                          child: Text(
                                            "TO DO'S",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.89),
                                                fontSize: 16.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0)),
                              elevation: 3,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Card(
                              color: Colors.white70,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.blue.shade700,
                                          Colors.blue.shade400,
                                          Colors.blue.shade200,
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "LEARN",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.89),
                                            fontSize: 16.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0)),
                              elevation: 3,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Card(
                              color: Colors.white70,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.orangeAccent.shade700,
                                          Colors.orangeAccent.shade400,
                                          Colors.orangeAccent.shade200,
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          /*Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  News(),
                                            ),
                                          );*/
                                        },
                                        child: Text(
                                          "NEWS",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.89),
                                              fontSize: 16.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0)),
                              elevation: 3,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Card(
                              color: Colors.white70,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.green.shade700,
                                          Colors.green.shade500,
                                          Colors.green.shade300
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          /*Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                      Wealth()));*/
                                        },
                                        child: Text(
                                          "WEALTH",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.89),
                                              fontSize: 16.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0)),
                              elevation: 3,
                            ),
                            /*SizedBox(height: 5.0,),
                            Text(
                              "Wealth",
                              textAlign: TextAlign.center,
                            ),*/
                          ],
                        ),
                        Column(
                          children: [
                            Card(
                              color: Colors.white70,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.green.shade700,
                                          Colors.green.shade500,
                                          Colors.green.shade300
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          /*Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                      Wealth()));*/
                                        },
                                        child: Text(
                                          "WEALTH",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.89),
                                              fontSize: 16.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0)),
                              elevation: 3,
                            ),
                            /*SizedBox(height: 5.0,),
                            Text(
                              "Wealth",
                              textAlign: TextAlign.center,
                            ),*/
                          ],
                        ),
                      ]),
                ),
              ),
            ]),
          ),

          /*Main Teams*/
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        print("Tap on plaza");
                      },
                      child: Text(
                        "PLAZA",
                        style: TextStyle(
                            fontSize: 18.5,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black87,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabBarPages() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        Timeline(),
        Timeline(),
        Timeline(),
      ],
    );
  }
}
