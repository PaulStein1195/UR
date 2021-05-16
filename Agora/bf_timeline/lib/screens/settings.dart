import 'package:bf_timeline/providers/auth_provider.dart';
import 'package:bf_timeline/screens/access/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../my_flutter_app_icons.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0xFF333333),
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () async {
              String _returnString = await _currentUser.logOut();
              if (_returnString == "success") {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OurRoot(),
                    ),
                        (route) => false);
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.exit_to_app,
                      size: 25.0,
                      color: Colors.white70 //kBottomNavigationBar,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "LOG OUT",
                      style: TextStyle(
                          fontSize: 16.5, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 100.0,),
        ],
      )
    );
  }
}
