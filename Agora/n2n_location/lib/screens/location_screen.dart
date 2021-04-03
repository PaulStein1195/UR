import 'package:flutter/material.dart';
import 'package:n2n_location/services/location.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationData});

  final locationData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  LocationModel weather = LocationModel();
  String cityName, cityCountry, cityState;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationData);
  }

  void updateUI(dynamic locationData) {
    if (locationData == null) {
      locationData = "Error";
      cityName = "";
      return;
    }
    cityName = locationData[0]['name'];
    cityCountry = locationData[0]["country"];
    cityState = locationData[0]["state"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "You are located in $cityName",
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "You are located in $cityState, $cityCountry",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
