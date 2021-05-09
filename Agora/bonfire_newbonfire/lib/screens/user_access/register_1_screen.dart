import 'package:bonfire_newbonfire/screens/user_access/register_2_screen.dart';
import 'package:bonfire_newbonfire/screens/user_access/widgets/amber_btn_widget.dart';
import 'package:bonfire_newbonfire/screens/user_access/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:bonfire_newbonfire/constants.dart';
import 'package:bonfire_newbonfire/providers/auth.dart';
import 'package:bonfire_newbonfire/service/media_service.dart';
import 'package:bonfire_newbonfire/service/snackbar_service.dart';
import "dart:io";
import 'package:provider/provider.dart';

class Register1_Screen extends StatefulWidget {
  @override
  _Register1_ScreenState createState() => _Register1_ScreenState();
}

class _Register1_ScreenState extends State<Register1_Screen> {
  GlobalKey<FormState> _formKey;
  AuthProvider _auth;
  String name;
  File image;

  _Register1_ScreenState() {
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () async {
                    File _imageFile =
                        await MediaService.instance.getImageFromLibrary();
                    setState(() {
                      image = _imageFile;
                    });
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white, Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft),
                      borderRadius: BorderRadius.circular(100),image: DecorationImage(
                      fit: image != null ? BoxFit.cover : BoxFit.fitWidth,
                      image: image != null
                          ? FileImage(image)
                          : AssetImage("assets/images/user.png"),
                    ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text_Form_Widget("Username"),
                  TextFormField(
                    style:
                        TextStyle(color: Colors.grey.shade200, fontSize: 20.0),
                    textAlign: TextAlign.center,
                    onSaved: (_input) {
                      setState(() {
                        name = _input;
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
                  SizedBox(height: 40.0),
                  registerButton()
                ],
              ),
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
        : Amber_Btn_Widget(
            context: context,
            text: "NEXT",
            onPressed: () {
              //Implement registration functionality.
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Register2_Screen(name: name, image: image)),
              );
            },
          );
  }
}
