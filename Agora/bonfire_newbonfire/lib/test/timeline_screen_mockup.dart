import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bonfire_newbonfire/const/color_pallete.dart';
import 'package:bonfire_newbonfire/providers/auth.dart';
import 'package:bonfire_newbonfire/model/post.dart';
import 'package:bonfire_newbonfire/service/location.dart';
import '../my_flutter_app_icons.dart';
import '../screens/floating_create/create_post.dart';
/*
class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> with TickerProviderStateMixin {
  TabController _tabController;
  LocationModel weather = LocationModel();
  String cityName, cityCountry, cityState;

  _TimelineState() {
    _tabController = TabController(length: 3, initialIndex: 1, vsync: this);
  }

  void getLocationData() async {
    LocationModel locationModel = LocationModel();
    var locationData = await locationModel.getLocationData();
    print(locationData);
    if (locationData == null) {
      locationData = "Error";
      cityName = "";
      return;
    }
    cityName = locationData[0]['name'];
    cityCountry = locationData[0]["country"];
    cityState = locationData[0]["state"];
  }

  /*void updateUI() {
    if (locationData == null) {
      locationData = "Error";
      cityName = "";
      return;
    }
    cityName = locationData[0]['name'];
    cityCountry = locationData[0]["country"];
    cityState = locationData[0]["state"];
  }*/

  @override
  void initState() {
    super.initState();
    getLocationData();
    //  updateUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white, //kBelongMarineBlue,
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CreatePostPage())),
        child: Icon(
          MyFlutterApp.pencil,
          color: kBelongMarineBlue, //kBottomNavigationBar,
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 30.0,
            title: GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => LocationScreen(),
                ),
              ),
              child: Text(
                "Sunnyvale", //"Tidy Up",
                style: TextStyle(
                    color: kBelongMarineBlue,
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
                  size: 28.0,
                  color: kBelongMarineBlue,
                ),
              ),
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
            delegate: SliverChildListDelegate([
              /*Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                  ],
                ),
              ),*/
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
                          "POSTS (11)",
                          style: TextStyle(
                              fontSize: 16.5,
                              color: kBelongMarineBlue,//Color.fromRGBO(108, 181, 217, 1),
                              fontWeight: FontWeight.w700),
                        ),
                        IconButton(
                          icon: Icon(Icons.dehaze),
                          iconSize: 20.0,
                          color: kBelongMarineBlue, //Color.fromRGBO(108, 181, 217, 1),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: kBelongMarineBlue, //Color.fromRGBO(108, 181, 217, 1),
                ),
                //PostPage(),
                /*Posts(
                    "https://picsum.photos/250?image=10",
                    "Paul",
                    "0/0/2020",
                    "GENERAL",
                    "How I manage my time of productivity in this period of pandemic",
                    "https://picsum.photos/250?image=5",
                    "I know that there is a lot of people out there working for long hours at home without...",
                    "50 %",
                    kBelongMarineBlue,
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
                    kBelongMarineBlue,
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
                    kBelongMarineBlue,
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
                    kBelongMarineBlue,
                    0.5,
                    false),*/
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
*/