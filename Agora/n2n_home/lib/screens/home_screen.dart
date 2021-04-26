import 'package:flutter/material.dart';
import 'package:n2n_home/const/color_pallete.dart';
import 'package:n2n_home/screens/timeline_screen.dart';
import '../my_flutter_app_icons.dart';
import 'city_live_screen.dart';
import 'dashboard_screen.dart';

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
    CityLiveScreen(),
    DashboardScreen(),

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
        backgroundColor: Colors.white,  //kBottomNavigationBar,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.home, color: Colors.black87,),
            title: Text('Home', style: TextStyle(color: Colors.black87),),
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.apartment, color: Colors.black87),
            title: Text('City/Game', style: TextStyle(color: Colors.black87)),
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.user, color: Colors.black87),
            title: Text('Profile', style: TextStyle(color: Colors.black87)),
          ),
          /*BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.user_1),
            title: Text('Me'),
          ),*/
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(15, 37, 50, 10), //Colors.white70,
        unselectedItemColor: Color.fromRGBO(15, 37, 50, 80), //Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
