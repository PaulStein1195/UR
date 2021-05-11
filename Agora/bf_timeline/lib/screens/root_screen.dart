import 'package:bf_timeline/home_screen.dart';
import 'package:bf_timeline/providers/auth_provider.dart';
import 'package:bf_timeline/screens/login_screen.dart';
import 'package:bf_timeline/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  loggedIn,
  notLoggedIn,
}

class OurRoot extends StatefulWidget {
  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    //Get state, check CurrentUser, set AUthstatus based on state
    CurrentUser _currentUser = Provider.of<CurrentUser>(context);
    String _retString = await _currentUser.onStartUp();
    if(_retString == "success") {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;
    switch (_authStatus) {
      case AuthStatus.notLoggedIn:
        retVal = LoginScreen();
        break;
      case AuthStatus.loggedIn:
        retVal = HomeScreen();
        break;

      default:
    }
    return retVal;
  }
}
