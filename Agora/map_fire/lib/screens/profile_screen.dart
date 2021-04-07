import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:map_fire/models/user.dart';
import 'package:map_fire/providers/firebase_methods.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseMethods _firebaseMethods = FirebaseMethods();
  User _user;

  void retrieveUserDetails() async {
    FirebaseUser currentUser = await _firebaseMethods.getCurrentUser();
    User user = await _firebaseMethods.retrieveUserDetails(currentUser);
    setState(() {
      return _user = user;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    retrieveUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    print(_user.profilePhoto);
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Card(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.blue,
                      image: DecorationImage(
                          image: _user.profilePhoto.isEmpty
                              ? AssetImage('assets/no_image.png')
                              : NetworkImage(_user.profilePhoto),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _user.name,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(_user.email),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //buildCountColumn("clubs", 0),
              buildCountColumn("teams", 0),
              buildCountColumn("posts", 0),
              buildCountColumn("reactions", 0),
              //buildCountColumn("followers", 0),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Container(
            height: 30,
            width: 100,
            child: MaterialButton(
              onPressed: () {
                //_auth.logoutUser(() {});
              },
              color: Colors.black54,
              child: Text(
                "LOGOUT",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: "PT-Sans",
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column buildCountColumn(String label, int count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count.toString(),
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700),
        ),
        Container(
          margin: EdgeInsets.only(top: 4.0),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
