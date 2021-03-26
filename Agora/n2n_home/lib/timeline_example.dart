import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:n2n_home/posts.dart';
import 'package:n2n_home/news.dart';
import 'package:n2n_home/trends.dart';
import 'package:n2n_home/yarvis/todos.dart';
import 'package:n2n_home/yarvis/wealth.dart';
import 'package:n2n_home/yarvis_add.dart';

import 'data.dart';
import 'my_flutter_app_icons.dart';

class Timeline_Example extends StatefulWidget {
  @override
  _Timeline_ExampleState createState() => _Timeline_ExampleState();
}

class _Timeline_ExampleState extends State<Timeline_Example>
    with TickerProviderStateMixin {
  TabController _tabController;

  _Timeline_ExampleState() {
    _tabController = TabController(length: 3, initialIndex: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 60.0,
            title: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text("AGORA"),
            ),
            //centerTitle: true,
            actions: [
              /*Container(
                height: 42.0,
                width: 42.0,
                child: FittedBox(
                  child: FloatingActionButton(
                    backgroundColor: Colors.grey.shade400,
                    elevation: 0.0,
                    splashColor: Colors.blue,
                    onPressed: () {},
                    child: Icon(
                      MyFlutterApp.mic,
                      size: 30,
                    ),
                  ),
                ),
              ),*/
              /*Center(
                child: IconButton(
                  splashColor: Colors.orange,
                  onPressed: () {},
                  icon: Icon(
                    MyFlutterApp.sound,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),*/
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
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "YARVIS",
                        style: TextStyle(fontSize: 15.5),
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
                        /*Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      color: Colors.white,
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            width: 70,
                                            height: 70,
                                            child: Center(
                                              child: Icon(
                                                Icons.record_voice_over,
                                                size: 25.0,
                                                color: Colors.grey.shade600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3.0)),
                                      elevation: 0.0,
                                    ),
                                  ),
                                ],
                              )),
                            ]),*/
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
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          Wealth()));
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
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Todos()));
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
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  News(),
                                            ),
                                          );
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Yarvis_add(),
                              ),
                            );
                          },
                          child: Column(
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
                                      child: Center(
                                          child: Icon(
                                        Icons.add,
                                        size: 35.0,
                                        color: Colors.grey.shade500,
                                      )),
                                    ),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0)),
                                elevation: 3,
                              ),
                            ],
                          ),
                        ),
                      ] /*_feature().map<Widget> ( (photo) {
                  return _FeatureGridItem(featurePhoto: photo);//Feature(photo);
            }).toList()*/
                      ),
                ),
              ),
            ]),
          ),

          /*Main Teams*/
          SliverList(
            delegate: SliverChildListDelegate(
              [
                /*TabBar(
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.blue,
                  labelColor: Colors.blue,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.people_outline,
                        size: 25,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.chat_bubble_outline,
                        size: 25,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.person_outline,
                        size: 25,
                      ),
                    ),
                  ],
                ),*/
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {  }));
                    },
                    child: Container(
                      height: 50,
                      width: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(
                              Icons.location_on,
                              size: 25.0,
                              color: Colors.lightBlue,
                            ),
                          ),
                          Text(
                            "Sunnyvale, CA",
                            style: TextStyle(
                                fontSize: 17.0, color: Colors.grey.shade50),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
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
                Teams(),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 5.0),
                  child: Text(
                    "TOP 3",
                    style: TextStyle(fontSize: 15.5),
                  ),
                ),
                Divider(
                  color: Colors.black87,
                ),
                Trends("https://picsum.photos/250?image=2", "COVID-19",
                    "10 days in a row"),
                Trends("https://picsum.photos/250?image=11", "Elections USA",
                    "3 days in a row"),
                Trends("https://picsum.photos/250?image=11", "Elections",
                    "Elections"),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "POSTS (1a5)",
                          style: TextStyle(fontSize: 15.5),
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
                Divider(
                  color: Colors.black87,
                ),
                Posts(
                    "https://picsum.photos/250?image=10",
                    "Paul",
                    "0/0/2020",
                    "GENERAL",
                    "How I manage my time of productivity in this period of pandemic",
                    "https://picsum.photos/250?image=5",
                    "I know that there is a lot of people out there working for long hours at home without...",
                    "50 %",
                    Colors.blue,
                    0.5,
                    true),
                Posts(
                    "https://picsum.photos/250?image=11",
                    "Pablo",
                    "8/0/2020",
                    "JOB / COMPANIES",
                    "Looking for talent",
                    "https://picsum.photos/250?image=10",
                    "Looking for creative people with some experience in software and time to get a freelance job in apps. If interested contact me at 669-000-0000",
                    "50 %",
                    Colors.amber,
                    0.5,
                    false),
                Posts(
                    "https://picsum.photos/250?image=7",
                    "Rafa",
                    "5/0/2020",
                    "BUY/SELL",
                    "Selling Mazda 6 2007 with a few scratches",
                    "https://picsum.photos/250?image=203",
                    "OPINION",
                    "50 %",
                    Colors.red,
                    0.5,
                    true),
                Posts(
                    "https://picsum.photos/250?image=5",
                    "Rafael",
                    "0/5/2020",
                    "NEWS / ALERTS",
                    "COVID-19 shots for free!!",
                    "https://picsum.photos/250?image=10",
                    "Tomorrow 10 of October the Health Department in Sunnyvale are going to give for free tests for covid-19...",
                    "50 %",
                    Colors.grey,
                    0.5,
                    false),
                SizedBox(
                  height: 18.0,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          MyFlutterApp.pencil,
          color: Colors.grey.shade700,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _tabBarPages() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        Timeline_Example(),
        Timeline_Example(),
        Timeline_Example(),
      ],
    );
  }
}
