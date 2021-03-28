import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:n2n_home/const/color_pallete.dart';
import 'package:n2n_home/widget/blue_tile_widget.dart';
import 'package:n2n_home/widget/local_info_widget.dart';
import 'package:n2n_home/widget/posts_widget.dart';
import 'location_screen.dart';

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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 30.0,
            /* title: Text(
              "", //"Tidy Up",
              style: TextStyle(
                  color: Color.fromRGBO(15, 37, 50, 80), fontSize: 18.0),
            ),*/
            actions: [
              SizedBox(
                width: 120.0,
              ),
              IconButton(
                splashColor: kBottomNavigationBar,
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.bell_solid,
                  size: 30.0,
                  color: kBelongMarineBlue,
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
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LocationScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Sunnyvale",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Genera",
                            color: kBelongMarineBlue,
                          ),
                        ),
                      ),
                      /*IconButton(
                        icon: Icon(Icons.dehaze),
                        iconSize: 20.0,
                        color: Color.fromRGBO(15, 37, 50, 80),
                        onPressed: () {},
                      )*/
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: Container(
                  height: 140,
                  width: 100,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.fromLTRB(12, 10, 10, 5),
                      children: [
                        Column(
                          children: [
                            LocalInfoWidget(
                              asset_icon: "assets/images/building.png",
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "STATS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kBelongMarineBlue,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            LocalInfoWidget(
                              asset_icon: 'assets/images/open-book.png',
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "SCHOOLS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kBelongMarineBlue,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            LocalInfoWidget(
                              asset_icon: 'assets/images/park.png',
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "PARKS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(15, 37, 50, 80),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            LocalInfoWidget(
                              asset_icon: 'assets/images/shopping-cart.png',
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "RETAIL",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(15, 37, 50, 80),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            LocalInfoWidget(
                              asset_icon: 'assets/images/information-point.png',
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "PUBLIC SERVICE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(15, 37, 50, 80),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ]),
          ),

          /*NEW OFFERS!!*/
          SliverList(
            delegate: SliverChildListDelegate([
              BlueTileWidget(
                assetIcon: "assets/images/toolkit.png",
                title: "TOOLKIT",
                description:
                    "Make your own routine, personalize it on the go and share your results!",
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "POSTS (15)",
                          style: TextStyle(
                              fontSize: 16.5,
                              color: kHeadlineCategory,
                              fontWeight: FontWeight.w700),
                        ),
                        IconButton(
                          icon: Icon(Icons.dehaze),
                          iconSize: 20.0,
                          color: kHeadlineCategory,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: kHeadlineCategory,
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
