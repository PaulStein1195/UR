import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:bonfire_newbonfire/const/color_pallete.dart';
import 'package:bonfire_newbonfire/my_flutter_app_icons.dart';
import 'package:bonfire_newbonfire/screens/display_post_page.dart';
import 'package:bonfire_newbonfire/test/city_live_screen_mockup.dart';
import 'package:bonfire_newbonfire/screens/user_profile/profile_screen.dart';
import 'package:bonfire_newbonfire/test/timeline_screen_mockup.dart';

class HomeScreen extends StatefulWidget {
  final locationWeather;

  HomeScreen({this.locationWeather});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 20,
  );
  List<Widget> _widgetOptions = <Widget>[
    PostPage(),
    //CityLiveScreen(),
    ProfileScreen(),
    //Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        //Color.fromRGBO(108, 181, 217, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.home),
            title: Text('Home/Setting up screen'),
          ),
          /*BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.apartment),
            title: Text('City/Game'),
          ),*/
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.chart_bars),
            title: Text('Dashboard/Resume'),
          ),
          /*BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.user_1),
            title: Text('Me'),
          ),*/
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      ),
    );
  }
}
