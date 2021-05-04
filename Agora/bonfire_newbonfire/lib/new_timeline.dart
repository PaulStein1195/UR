
import 'package:bonfire_newbonfire/screens/new_user/widgets/start_categories.dart';
import 'package:bonfire_newbonfire/widget/top3_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'my_flutter_app_icons.dart';

class New_Timeline extends StatefulWidget {
  @override
  _New_TimelineState createState() => _New_TimelineState();
}

class _New_TimelineState extends State<New_Timeline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: RawMaterialButton(
        elevation: 5.0,
        constraints: BoxConstraints.tightFor(
          height: 56,
          width: 56,
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        fillColor: Colors.black38,
        child: Icon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pushNamed(context, "create_post"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color(0XFF292728),
            expandedHeight: 40.0,
            elevation: 3.0,
            leading: Icon(
              MyFlutterApp.magnifier,
              size: 25.0,
            ),
            actions: [
              SizedBox(
                width: 10.0,
              ),
              IconButton(
                splashColor: Colors.white70,
                onPressed: () {},
                icon: Icon(
                  MyFlutterApp.inbox,
                  size: 27.0,
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              IconButton(
                splashColor: Colors.white70,
                onPressed: () {},
                icon: Icon(
                  MyFlutterApp.alarm,
                  size: 27.0,
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
                    child: Text(
                      "What's Happening",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 5.0),
                  child: Text(
                    "MAJOR TRENDS 2021",
                    style: TextStyle(fontSize: 15.5),
                  ),
                ),
                Divider(
                  color: Colors.black87,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white,
                    height: 200,
                    width: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.fromLTRB(5, 2, 10, 5),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    color: Colors.blue,
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          width: 130,
                                          height: 130,
                                          child: Center(
                                            child: Image.network(
                                                'https://picsum.photos/250?image=20'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                    elevation: 3,
                                    margin: EdgeInsets.all(10),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text("Climate change"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text("3 months in a row"),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: [
                                  Card(
                                    color: Colors.blue,
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          width: 130,
                                          height: 130,
                                          child: Center(
                                            child: Image.network(
                                                'https://picsum.photos/250?image=20'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                    elevation: 3,
                                    margin: EdgeInsets.all(10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: [
                                  Card(
                                    color: Colors.blue,
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          width: 130,
                                          height: 130,
                                          child: Center(
                                            child: Image.network(
                                                'https://picsum.photos/250?image=20'),
                                          ),
                                        ),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                    elevation: 3,
                                    margin: EdgeInsets.all(10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Scrollable_Bonfire_Widget(context),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 5.0),
                  child: Text(
                    "My Posts",
                    style: TextStyle(fontSize: 19.5, color: Colors.white70),
                  ),
                ),
                Divider(
                  color: Colors.white54,
                ),
                WHWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
