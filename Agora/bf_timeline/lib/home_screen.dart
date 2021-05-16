import 'package:bf_timeline/models/bonfire.dart';
import 'package:bf_timeline/models/bonfire_model.dart';
import 'package:bf_timeline/my_flutter_app_icons.dart';
import 'package:bf_timeline/providers/auth_provider.dart';
import 'package:bf_timeline/screens/all_users_screen.dart';
import 'package:bf_timeline/screens/profile_screen.dart';
import 'package:bf_timeline/screens/settings.dart';
import 'package:bf_timeline/select_bonfires_screen.dart';
import 'package:bf_timeline/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'display_post_page.dart';
import 'models/user.dart';

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
    HomePage(),
    AllUsers(),
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
        elevation: 5.0,
        backgroundColor: Color.fromRGBO(41, 39, 40, 210.0),
        //Color.fromRGBO(108, 181, 217, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.fire),
            title: Text('Bonfires'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.user),
            title: Text('Me'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
      ),
    );
  }
}
