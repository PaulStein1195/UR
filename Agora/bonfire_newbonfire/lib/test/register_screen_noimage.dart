import 'package:bonfire_newbonfire/const/color_pallete.dart';
import 'package:bonfire_newbonfire/screens/user_access/widgets/amber_btn_widget.dart';
import 'package:bonfire_newbonfire/screens/user_access/widgets/text_form_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bonfire_newbonfire/constants.dart';
import 'package:bonfire_newbonfire/providers/auth.dart';
import 'package:bonfire_newbonfire/service/db_service.dart';
import 'package:bonfire_newbonfire/service/media_service.dart';
import 'package:bonfire_newbonfire/service/snackbar_service.dart';
import "dart:io";
import '../service/cloud_storage_service.dart';
import 'package:provider/provider.dart';
/*
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey;
  AuthProvider _auth;
  String _name;
  String _email;
  String _password;
  File _image;

  _RegisterScreenState() {
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: kAppbar(context),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: ChangeNotifierProvider<AuthProvider>.value(
            value: AuthProvider.instance,
            child: registerUI(),
          )),
    );
  }

  Widget registerUI() {
    return Builder(
      builder: (BuildContext _context) {
        SnackBarService.instance.buildContext = _context;
        _auth = Provider.of<AuthProvider>(_context);
        return Form(
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
                    height: 8.0,
                  ),
                  Text_Form_Widget("Username"),
                  TextFormField(
                    style:
                        TextStyle(color: Colors.grey.shade200, fontSize: 20.0),
                    textAlign: TextAlign.center,
                    onSaved: (_input) {
                      setState(() {
                        _name = _input;
                      });
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: "Enter Name",
                    ),
                    validator: (_input) {
                      return _input.length != 0 && _input.length >= 6
                          ? null
                          : "Username need more than 6 characters";
                    },
                  ),
                  SizedBox(
                    height: 8.0,
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
                    obscureText: true,
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
                  SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: registerButton(),
                  ),
                  Text(
                    "This will validate  your authenticity to keep a healthy platform.",
                    style: TextStyle(color: Colors.grey, fontSize: 17.0),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget registerButton() {
    return _auth.status == AuthStatus.Authenticating
        ? Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        : Amber_Btn_Widget(
            context: context,
            text: "REGISTER",
            onPressed: () {
              //Implement registration functionality.

              if (_formKey.currentState.validate() != null) {
                _auth.registerUserWithEmailAndPassword(_email, _password,
                    (String _uid) async {

                  await DBService.instance
                      .createUserInDB(_uid, _name, _email, "", "");
                });
              }
            },
          );
  }
}
*/