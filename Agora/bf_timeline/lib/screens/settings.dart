import 'package:bf_timeline/providers/auth_provider.dart';
import 'package:bf_timeline/screens/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: RaisedButton(
          onPressed: () async {
            CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
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
          child: Text("LOG OUT"),
        ),
      ),
    );
  }
}
