import 'package:bf_timeline/providers/auth_provider.dart';
import 'package:bf_timeline/screens/access/login_screen.dart';
import 'package:bf_timeline/screens/access/onboarding_screens.dart';
import 'package:bf_timeline/screens/access/register_1_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../../home_screen.dart';

enum LoginType {
  email,
  google,
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isAuth = false;

  void _loginUser(
      {@required LoginType type,
      String email,
      String password,
      BuildContext context}) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _resultString;
      switch (type) {
        case LoginType.email:
          _resultString = await _currentUser.loginUser(email, password);
          break;
        case LoginType.google:
          _resultString = await _currentUser.loginGoogleUser();

          break;
        default:
      }
      if (_resultString == "success") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false);
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Not able to register user, try again"),
            duration: Duration(seconds: 2)));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    height: 170.0,
                    width: 175,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo_shadow.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Join your Bonfire',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Material(
                elevation: 1.0,
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  //color: Colors.grey,
                  onPressed: () {
                    //Go to login screen.
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen()));
                  },
                  minWidth: 200.0,
                  height: 50.0,
                  child: Text(
                    'Log in',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: OutlineButton(
                splashColor: Theme.of(context).accentColor,
                onPressed: () {
                  _loginUser(type: LoginType.google, context: context);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                highlightElevation: 0,
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                          image: AssetImage("assets/images/google_logo.png"),
                          height: 30.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Continue with Google',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: FlatButton(
                onPressed: () {
                  //Go to registration screen.
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Register1_Screen()));
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
