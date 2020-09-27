import 'package:flutter/material.dart';
import 'package:ur_opinion/pages/timeline.dart';
import 'package:ur_opinion/pages/profile.dart';
import 'pages/my_flutter_app_icons.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 20, );
  List<Widget> _widgetOptions = <Widget>[
    TimelinePage(),
    /*Text(
      'Index 1: Business',
      style: optionStyle,
    ),*/
    Profile()
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.home),
            title: Text('Home'),
          ),
          /*BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.database),
            title: Text('Data'),
          ),*/
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.user_outline),
            title: Text('Me'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
