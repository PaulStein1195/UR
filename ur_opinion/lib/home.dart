import 'package:flutter/material.dart';
import 'package:ur_opinion/pages/Home/timeline.dart';
import 'package:ur_opinion/pages/Me/profile.dart';
import 'package:ur_opinion/pages/data_center.dart';
import 'widgets/my_flutter_app_icons.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  double _height;
  double _width;
  TabController _tabController;

  _MyHomePageState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "UrOpinion",
          style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.grey.shade900),
        ),
        bottom: TabBar(
          labelStyle: TextStyle(fontSize: 13.0, fontFamily: "PT-Sans"),
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.grey.shade600,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.grey.shade900,
          controller: _tabController,
          tabs: [
            Tab(
              child: Row(
                children: [
                  Icon(
                    MyFlutterApp.home,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Home",
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                children: [
                  Icon(
                    MyFlutterApp.newspaper,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Data",
                  ),
                ],
              ),
            ),
            Tab(
                child: Row(
              children: [
                Icon(
                  MyFlutterApp.user_outline,
                  size: 25,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Me",
                ),
              ],
            )),
          ],
        ),
      ),
      body: _tabBarPages(),
    );
  }

  Widget _tabBarPages() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        TimelinePage(),
        CommunityCenter(),
        Profile(),
      ],
    );
  }
}

/*class MyHomePage extends StatefulWidget {
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
    Text(
      'Index 2: Agora / LIVE / Dashboard',
      style: optionStyle,
    ),
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
      appBar: (AppBar(bottom: ,),),
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
            icon: Icon(MyFlutterApp.newspaper),
            title: Text('Data'),
          ),
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

 */
