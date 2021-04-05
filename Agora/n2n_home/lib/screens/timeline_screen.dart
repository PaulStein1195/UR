import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:n2n_home/const/color_pallete.dart';
import 'package:n2n_home/const/settings_menu.dart';
import 'package:n2n_home/screens/location_screen.dart';
import 'package:n2n_home/screens/stats_screen.dart';
import 'package:n2n_home/widget/blue_tile_widget.dart';
import 'package:n2n_home/widget/local_info_widget.dart';
import 'package:n2n_home/widget/posts_widget.dart';

class Timeline extends StatefulWidget {
  static const id = "timeline";

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> with TickerProviderStateMixin {
  TabController _tabController;

  //SettingsMenu settingsMenu = SettingsMenu();

  _TimelineState() {
    _tabController = TabController(length: 3, initialIndex: 1, vsync: this);
  }

  void choiceAction(String choice) {
    if(choice == SettingsMenu.LogOut) {

    } else if(choice == SettingsMenu.Settings) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 30.0,
            title: GestureDetector(
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LocationScreen())),
              child: Text(
                "Sunnyvale", //"Tidy Up",
                style: TextStyle(
                    color: Color.fromRGBO(15, 37, 50, 80),
                    fontSize: 20.5,
                    fontWeight: FontWeight.w600),
              ),
            ),
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
              /*PopupMenuButton<String>(
                icon: Icon(
                  Icons.settings,
                  size: 30.0,
                  color: kBelongMarineBlue,
                ),
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return SettingsMenu.menuChoices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),*/
            ],
          ),

          /*NEW OFFERS!!*/
          SliverList(
            delegate: SliverChildListDelegate([
              BlueTileWidget(
                assetIcon: "assets/images/backpack.png",
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
                              color: Color.fromRGBO(15, 37, 50, 80), //kHeadlineCategory,
                              fontWeight: FontWeight.w700),
                        ),
                        IconButton(
                          icon: Icon(Icons.dehaze),
                          iconSize: 20.0,
                          color: Color.fromRGBO(15, 37, 50, 80), //kHeadlineCategory,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Color.fromRGBO(15, 37, 50, 80), //kHeadlineCategory,
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
                    Color.fromRGBO(15, 37, 50, 30), //Colors.blue,
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
                    Color.fromRGBO(15, 37, 50, 30), //Colors.amber,
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
                    Color.fromRGBO(15, 37, 50, 30), //Colors.red,
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
                    Color.fromRGBO(15, 37, 50, 30), //Colors.grey,
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
