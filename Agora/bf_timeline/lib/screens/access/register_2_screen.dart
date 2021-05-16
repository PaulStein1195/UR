import 'package:bf_timeline/home_screen.dart';
import 'package:bf_timeline/providers/auth_provider.dart';
import 'package:bf_timeline/screens/access/onboarding_screens.dart';
import 'package:bf_timeline/services/database.dart';
import 'package:bf_timeline/widgets/amber_btn_widget.dart';
import 'package:bf_timeline/widgets/constants.dart';
import 'package:bf_timeline/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class Register2_Screen extends StatefulWidget {
  final String name;

  //final File image;

  Register2_Screen({this.name});

  @override
  _Register2_ScreenState createState() => _Register2_ScreenState(
        name: this.name,
      );
}

class _Register2_ScreenState extends State<Register2_Screen> {
  GlobalKey<FormState> _formKey;
  String name;
  String _email;
  String _password;
  bool _obscureText = true;
  bool isAuthenticating = false;


  _Register2_ScreenState({this.name}) {
    _formKey = GlobalKey<FormState>();
  }

  void _signUpUser() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        await CurrentUser().registerUserWithEmailAndPassword(
            email: _email, password: _password, fullName: name);
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => Onboard1()));
      } catch (e) {
        print(e);
      }
    }
    else if (!_formKey.currentState.validate()) {
      setState(() {
        isAuthenticating = false;
      });
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
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          onChanged: () {
            _formKey.currentState.save();
          },
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Text_Form_Widget("Email"),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style:
                        TextStyle(color: Colors.grey.shade200, fontSize: 20.0),
                    textAlign: TextAlign.center,
                    onSaved: (_input) {
                      setState(() {
                        _email = _input;
                      });
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: "Enter your email",
                    ),
                    validator: (_input) {
                      return _input.length != 0 && _input.contains("@")
                          ? null
                          : "Please enter a valid email";
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text_Form_Widget("Password"),
                  TextFormField(
                    obscureText: _obscureText,
                    style:
                        TextStyle(color: Colors.grey.shade200, fontSize: 20.0),
                    textAlign: TextAlign.center,
                    onSaved: (_input) {
                      setState(() {
                        _password = _input;
                      });
                    },
                    decoration: kTextFieldDecoration.copyWith(),
                    validator: (_input) {
                      return _input.length != 0 && _input.length > 6
                          ? null
                          : "Password need more than 6 characters";
                    },
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
                  SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: Colors.orange.shade600,
                      //Theme.of(context).accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 3.0,
                      child: MaterialButton(
                        onPressed: isAuthenticating ? null : () {
                          setState(() {
                            isAuthenticating = true;
                          });
                          _signUpUser();
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
                  isAuthenticating
                      ? SpinKitCircle(
                    color: Colors.lightBlueAccent,
                    size: 50.0,
                  )
                      : Text(""),
                  SizedBox(height: 10.0,),
                  Text(
                    "This will validate  your autheticity to keep a healthy platform.",
                    style: TextStyle(color: Colors.grey, fontSize: 17.0),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
