import 'package:bf_timeline/home_screen.dart';
import 'package:bf_timeline/providers/auth_provider.dart';
import 'package:bf_timeline/widgets/constants.dart';
import 'package:bf_timeline/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey;
  String _name;
  String _email;
  String _password;
  bool _obscureText = true;

  _RegisterScreenState() {
    _formKey = GlobalKey<FormState>();
  }

  void _registerUser(String _name, String _email, String _password,
      BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString =
          await _currentUser.registerUser(_name, _email, _password);
      if (_returnString == "success") {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
              content: Text("Not able to register user, try again"),
              duration: Duration(seconds: 2)),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          onChanged: () {
            _formKey.currentState.save();
          },
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text_Form_Widget("Username"),
                  TextFormField(
                    style:
                        TextStyle(color: Colors.grey.shade200, fontSize: 20.0),
                    textAlign: TextAlign.center,
                    validator: (_input) {
                      return _input.length != 0 && _input.length > 6
                          ? null
                          : "Password need more than 6 characters";
                    },
                    onSaved: (_input) {
                      //Do something with the user input.
                      setState(() {
                        _name = _input;
                      });
                    },
                    decoration: kTextFieldDecoration.copyWith(),
                  ),
                  SizedBox(
                    height: 22.0,
                  ),
                  Text_Form_Widget("Email"),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style:
                        TextStyle(color: Colors.grey.shade200, fontSize: 20.0),
                    textAlign: TextAlign.center,
                    validator: (_input) {
                      return _input.length != 0 && _input.contains("@")
                          ? null
                          : "Please enter a valid email";
                    },
                    onSaved: (_input) {
                      setState(() {
                        _email = _input;
                      });
                      //Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(),
                  ),
                  SizedBox(
                    height: 22.0,
                  ),
                  Text_Form_Widget("Password"),
                  TextFormField(
                    obscureText: _obscureText,
                    style:
                        TextStyle(color: Colors.grey.shade200, fontSize: 20.0),
                    textAlign: TextAlign.center,
                    validator: (_input) {
                      return _input.length != 0 && _input.length > 6
                          ? null
                          : "Password need more than 6 characters";
                    },
                    onSaved: (_input) {
                      //Do something with the user input.
                      setState(() {
                        _password = _input;
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
                    padding:
                        EdgeInsets.symmetric(vertical: 23.0, horizontal: 50.0),
                    child: Material(
                      color: Colors.orange.shade600,
                      //Theme.of(context).accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 3.0,
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _registerUser(_name, _email, _password, context);
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Not able to register user, try again"),
                                duration: Duration(seconds: 2)));
                          }
                        },
                        minWidth: 300.0,
                        height: 42.0,
                        child: Text(
                          "REGISTER",
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
        ),
      ),
    );
  }
}
