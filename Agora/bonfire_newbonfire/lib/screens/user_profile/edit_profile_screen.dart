import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bonfire_newbonfire/const/color_pallete.dart';
import 'package:bonfire_newbonfire/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bonfire_newbonfire/providers/auth.dart';
import 'package:bonfire_newbonfire/screens/display_post_page.dart';
import 'package:bonfire_newbonfire/service/db_service.dart';
import 'package:bonfire_newbonfire/service/navigation_service.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController displayNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  bool _usernameIsValid = true;
  bool _bioIsValid = true;

  Column buildDisplayNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              "Your username",
              style: TextStyle(color: kBelongMarineBlue),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: TextField(
            style: TextStyle(color: kBelongMarineBlue),
            controller: displayNameController,
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),
                labelText: "Update username",
                labelStyle: TextStyle(color: Colors.grey),
                hintText: "Update Username",
                errorText: _usernameIsValid ? null : "Display name too short"),
          ),
        )
      ],
    );
  }

  Column buildBioField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              "Bio",
              style: TextStyle(color: kBelongMarineBlue),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: TextField(
            style: TextStyle(color: kBelongMarineBlue),
            controller: bioController,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                // width: 0.0 produces a thin "hairline" border
                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
              ),
              labelText: "Update Bio",
              labelStyle: TextStyle(color: Colors.grey),
              hintText: "Update Bio",
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          title: Text(
            "Edit Profile",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => NavigationService.instance.goBack(),
          ),
        ),
        body: isLoading
            ? SpinKitCircle()
            : ChangeNotifierProvider<AuthProvider>.value(
                value: AuthProvider.instance,
                child: Builder(builder: (BuildContext context) {
                  var _auth = Provider.of<AuthProvider>(context);
                  return StreamBuilder<User>(
                    stream: DBService.instance.getUserData(_auth.user.uid),
                    builder: (context, snapshot) {
                      var _userData = snapshot.data;
                      if (!snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Center(
                            child: SpinKitDoubleBounce(
                              color: Colors.lightBlueAccent,
                              size: 100.0,
                            ),
                          ),
                        );
                      }
                      return ListView(
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 25.0,
                                    bottom: 8.0,
                                  ),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image:
                                                NetworkImage(_userData.image))),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                              padding: EdgeInsets.only(top: 12.0),
                                              child: Text(
                                                "Your username",
                                                style: TextStyle(color: kBelongMarineBlue),
                                              )),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: TextField(
                                              style: TextStyle(color: kBelongMarineBlue),
                                              controller: displayNameController,
                                              decoration: InputDecoration(
                                                  enabledBorder: const OutlineInputBorder(
                                                    // width: 0.0 produces a thin "hairline" border
                                                    borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                                                  ),
                                                  labelStyle: TextStyle(color: Colors.grey),
                                                  hintText: displayNameController.text = _userData.name,
                                                  errorText: _usernameIsValid ? null : "Display name too short"),
                                            ),
                                          )
                                        ],
                                      ),
                                      buildBioField(),
                                    ],
                                  ),
                                ),
                                RaisedButton(
                                  onPressed: () async {
                                    setState(() {
                                      displayNameController.text.trim().length <
                                                  3 ||
                                              displayNameController.text.isEmpty
                                          ? _usernameIsValid = false
                                          : _usernameIsValid = true;
                                      /*bioController.text.trim().length > 100
                                          ? _bioIsValid = false
                                          : _bioIsValid = true;*/
                                    });

                                    if (_usernameIsValid) {
                                      await userRef
                                          .document(_auth.user.uid)
                                          .updateData({
                                        "name": displayNameController.text,
                                      });
                                      SnackBar snackbar = SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text("Profile updated", style: TextStyle(color: Colors.white),),
                                      );
                                      _scaffoldKey.currentState.showSnackBar(snackbar);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Update Profile",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }),
              ));
  }
}
