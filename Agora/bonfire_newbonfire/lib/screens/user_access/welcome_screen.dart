import 'package:bonfire_newbonfire/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((account) {
      if (account != null) {
        print("User signed in!: $account");
        setState(() {
          isAuth = true;
        });
      } else {
        isAuth = false;
      }
    });
  }

  loginGoogle() {
    googleSignIn.signIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ChangeNotifierProvider<AuthProvider>.value(
          value: AuthProvider.instance,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Hero(
                    tag: "logo",
                    child: Container(
                      height: 150.0,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/bonfire.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  /*Text(
                    'Campfire',
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w800,
                      color: kBelongMarineBlue
                    ),
                  ),*/
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Material(
                  elevation: 1.0,
                  color: Colors.lightBlueAccent, //Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    //color: Colors.grey,
                    onPressed: () {
                      //Go to login screen.
                      Navigator.pushNamed(context, "login");
                    },
                    minWidth: 200.0,
                    height: 50.0,
                    child: Text(
                      'Log In',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: OutlineButton(
                  splashColor: Theme.of(context).accentColor,
                  onPressed: () {
                    loginGoogle();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  highlightElevation: 0,
                  borderSide: BorderSide(color: Colors.grey),
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
                            'Sign in with Google',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
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
                    Navigator.pushNamed(context, "register");
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
