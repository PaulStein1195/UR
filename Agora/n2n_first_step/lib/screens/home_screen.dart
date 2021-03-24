import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:n2n_first_step/screens/timeline.dart';

class HomeScreen extends StatefulWidget {
  static const id = "home_screen";
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
    Timeline(),
    Text(
      'Index 2: Agora / LIVE / Dashboard',
      style: optionStyle,
    ),
    Text(
      'Index 2: Data center',
      style: optionStyle,
    ),
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
        backgroundColor: Theme.of(context).backgroundColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home/Setting up screen'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text('City/Game'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.score),
            title: Text('Dashboard/Resume'),
          ),
          /*BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.user_1),
            title: Text('Me'),
          ),*/
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
