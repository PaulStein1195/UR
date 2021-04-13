import 'package:bonfire_newbonfire/providers/auth.dart';
import 'package:bonfire_newbonfire/loading_screen.dart';
import 'package:bonfire_newbonfire/service/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';

final _firestore = Firestore.instance;
AuthStatus _auth;
FirebaseUser _userLoggedIn;

class LocationScreen extends StatefulWidget {
  static const id = "location";

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double latitude;
  double longitud;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getLocationData();
  }

  /*void getLocationData() async {
    LocationModel locationModel = LocationModel();
    var locationData = await locationModel.getLocationData();
    final location = locationData[0]['name'];
    //Add data in DB
    print(location);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen(locationData: locationData);
        },
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.amber,
          size: 100.0,
        ),
      ),
    );
  }
}
