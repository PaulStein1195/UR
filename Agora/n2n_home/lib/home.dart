import 'package:flutter/material.dart';
import 'package:n2n_home/timeline_example.dart';

import 'my_flutter_app_icons.dart';

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
        backgroundColor: Color.fromRGBO(108, 181, 217, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.home),
            title: Text('Home/Setting up screen'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.apartment),
            title: Text('City/Game'),
          ),
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
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
