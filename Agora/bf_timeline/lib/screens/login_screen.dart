import 'package:bf_timeline/providers/auth_provider.dart';
import 'package:bf_timeline/widgets/constants.dart';
import 'package:bf_timeline/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_screen.dart';

enum LoginType {
  email,
  google,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey;
  String email;
  String password;
  bool _obscureText = true;

  _LoginScreenState() {
    _formKey = GlobalKey<FormState>();
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
      backgroundColor: Colors.black87,
      body: Form(
        key: _formKey,
        onChanged: () {
          _formKey.currentState.save();
        },
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text_Form_Widget("Email"),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.grey.shade200, fontSize: 20.0),
                textAlign: TextAlign.center,
                validator: (_input) {
                  return _input.length != 0 && _input.contains("@")
                      ? null
                      : "Please enter a valid email";
                },
                onSaved: (_input) {
                  setState(() {
                    email = _input;
                  });
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(),
              ),
              SizedBox(
                height: 35.0,
              ),
              Text_Form_Widget("Password"),
              TextFormField(
                obscureText: _obscureText,
                style: TextStyle(color: Colors.grey.shade200, fontSize: 20.0),
                textAlign: TextAlign.center,
                validator: (_input) {
                  return _input.length != 0 && _input.length > 6
                      ? null
                      : "Password need more than 6 characters";
                },
                onSaved: (_input) {
                  //Do something with the user input.
                  setState(() {
                    password = _input;
                  });
                },
                decoration: kTextFieldDecoration.copyWith(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      splashRadius: 0.1,
                      onPressed: _toggle,
                      icon: _obscureText
                          ? Icon(
                              Icons.check_box_outline_blank,
                              color: Colors.white70,
                            )
                          : Icon(
                              Icons.check_box,
                              color: Colors.white70,
                            ),
                    ),
                    Text(
                      "Show password",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: OutlineButton(
                  splashColor: Theme.of(context).accentColor,
                  onPressed: () {
                    _loginUser(type: LoginType.google, context: context);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
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
                padding: EdgeInsets.symmetric(vertical: 23.0),
                child: Material(
                  color: Colors.orange.shade600,
                  //Theme.of(context).accentColor,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 3.0,
                  child: MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _loginUser(
                            type: LoginType.email,
                            email: email,
                            password: password,
                            context: context);
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content:
                                Text("Not able to register user, try again"),
                            duration: Duration(seconds: 2)));
                      }
                    },
                    minWidth: 300.0,
                    height: 42.0,
                    child: Text(
                      "LOG IN",
                      style: TextStyle(
                          letterSpacing: 0.3,
                          fontSize: 17.5,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
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
