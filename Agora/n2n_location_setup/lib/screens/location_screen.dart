import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:n2n_location_setup/service/address_api.dart';
import 'package:n2n_location_setup/service/location.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getCurrentLocation() {
    AddressModel addressModel = AddressModel();
    addressModel.getCityLocation();
  }

  void getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              /*Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                  ],
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Sunnyvale",
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Genera",
                            color: Color.fromRGBO(15, 37, 50, 80),
                          ),
                        ),
                      ),
                      RaisedButton(
                        elevation: 5.0,
                        color: Colors.blueAccent,
                        onPressed: () {
                          getCurrentPosition();
                        },
                        child: Text("Get location"),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),

          /*Main Teams*/
          /* SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        print("Tap on plaza");
                      },
                      child: Text(
                        "PLAZA",
                        style: TextStyle(
                            fontSize: 18.5,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black87,
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
