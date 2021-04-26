import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bonfire_newbonfire/const/color_pallete.dart';
import 'package:bonfire_newbonfire/widget/teams_widget(test).dart';
import 'package:bonfire_newbonfire/widget/trends_widget.dart';

class BonfireScreenTest extends StatefulWidget {
  @override
  _BonfireScreenTestState createState() => _BonfireScreenTestState();
}

class _BonfireScreenTestState extends State<BonfireScreenTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 55.0,
            title: Text(
              "Camping",
              style: TextStyle(color: kBelongMarineBlue),
            ),
            automaticallyImplyLeading: false,
            actions: [
              SizedBox(
                width: 120.0,
              ),
              SizedBox(
                width: 10.0,
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      "BONFIRES",
                      style: TextStyle(fontSize: 15.5),
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
                      ], /*_feature().map<Widget> ( (photo) {
              return _FeatureGridItem(featurePhoto: photo);//Feature(photo);
            }).toList()*/
                    ),
                  ),
                ),
                Trends("https://picsum.photos/250?image=2", "COVID-19",
                    "10 months in a row"),
                Trends("https://picsum.photos/250?image=11", "Climate change",
                    "3 moths in a row"),
                Trends("https://picsum.photos/250?image=11", "Humans rights",
                    "2 months in a row"),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
