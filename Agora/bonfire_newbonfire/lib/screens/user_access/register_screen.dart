import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bonfire_newbonfire/constants.dart';
import 'package:bonfire_newbonfire/providers/auth.dart';
import 'package:bonfire_newbonfire/screens/home_screen.dart';
import 'package:bonfire_newbonfire/service/db_service.dart';
import 'package:bonfire_newbonfire/service/media_service.dart';
import 'package:bonfire_newbonfire/service/snackbar_service.dart';
import "dart:io";
import '../../service/cloud_storage_service.dart';
import 'package:provider/provider.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () async {
                    File _imageFile =
                        await MediaService.instance.getImageFromLibrary();
                    setState(() {
                      _image = _imageFile;
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: _image != null
                            ? FileImage(_image)
                            : NetworkImage(
                                "https://cdn0.iconfinder.com/data/icons/occupation-002/64/programmer-programming-occupation-avatar-512.png"),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Username',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
              TextFormField(
                style: TextStyle(color: Colors.grey.shade200, fontSize: 20.0),
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
              Text(
                'Email',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.grey.shade200, fontSize: 20.0),
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
              Text(
                'Password',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
              TextFormField(
                obscureText: true,
                style: TextStyle(color: Colors.grey.shade200, fontSize: 20.0),
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
                "This will validate  your autheticity to keep a healthy platform.",
                style: TextStyle(color: Colors.grey, fontSize: 17.0),
                textAlign: TextAlign.center,
              )
            ],
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
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120.0),
            child: Material(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              elevation: 5.0,
              child: MaterialButton(
                onPressed: () {
                  //Implement registration functionality.

                  if (_formKey.currentState.validate() != null) {
                    _auth.registerUserWithEmailAndPassword(_email, _password,
                        (String _uid) async {
                      var _result = await CloudStorageService.instance
                          .uploadUserImage(_uid, _image);
                      var _imageURL = await _result.ref.getDownloadURL();
                      await DBService.instance
                          .createUserInDB(_uid, _name, _email, _imageURL, "");
                    });
                  }
                  //Navigator.pushNamed(context, HomeScreen.id);
                },
                minWidth: 150.0,
                height: 42.0,
                child: Text(
                  'REGISTER',
                  style: TextStyle(
                      letterSpacing: 0.3,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          );
  }
}
