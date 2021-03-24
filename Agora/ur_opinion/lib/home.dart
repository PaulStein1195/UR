import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ur_opinion/pages/Home/timeline_example.dart';
import 'package:ur_opinion/pages/Me/profile.dart';
import 'package:ur_opinion/pages/Me/profile_menus/my_summary.dart';
import 'package:ur_opinion/pages/data_center.dart';
import 'widgets/my_flutter_app_icons.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 20,
  );
  List<Widget> _widgetOptions = <Widget>[
    Timeline_Example(),
    Text(
      'Index 2: Agora / LIVE / Dashboard',
      style: optionStyle,
    ),
    DataCenter(),
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
        backgroundColor: Theme.of(context).backgroundColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.apartment),
            title: Text('City'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.chart_bars),
            title: Text('Dashboard'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.user_1),
            title: Text('Me'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
