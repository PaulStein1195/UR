import 'package:flutter/material.dart';
import 'package:map_fire/screens/home_screen.dart';
import 'package:map_fire/services/location.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  void getLocationData() async {
    LocationModel locationModel = LocationModel();
    var locationData = await locationModel.getLocationData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen(locationData: locationData);
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                child: Image(
                  image: AssetImage("assets/images/home.png"),
                  height: 150.0,
                  width: 100,
                ),
              ),
              Text(
                "Set your Home",
                style: TextStyle(fontSize: 40.0, color: Colors.black54),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: MaterialButton(
              color: Colors.grey,
              onPressed: () {
                getLocationData();
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.location_searching, color: Colors.white),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Get location",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              //  submitLocation();
            },
            child: Text(
              "Continue",
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 17.0),
            ),
          )
        ],
      ),
    );
  }
}
