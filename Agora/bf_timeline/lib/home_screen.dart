import 'package:bf_timeline/my_flutter_app_icons.dart';
import 'package:bf_timeline/screens/settings.dart';
import 'package:bf_timeline/select_bonfires_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(
              MyFlutterApp.fire,
              size: 25.0,
              color: Colors.white70,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SelectBonfire()));
            },
          ),
          SizedBox(width: 5.0,),
          IconButton(
            icon: Icon(
              MyFlutterApp.cog_1,
              size: 25.0,
              color: Colors.white70,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
          ),
        ],
      ),
    );
  }
}


