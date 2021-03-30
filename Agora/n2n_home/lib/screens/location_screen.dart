import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:n2n_home/const/color_pallete.dart';
import 'package:n2n_home/screens/stats_screen.dart';
import 'package:n2n_home/widget/local_info_widget.dart';

import '../service/address_api.dart';

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
                            color: kBelongMarineBlue,
                          ),
                        ),
                      ),
                      RaisedButton(
                        elevation: 5.0,
                        color: Colors.blueAccent,
                        onPressed: () {
                          getCurrentPosition();
                        },
                        child: Text(
                          "Get location",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              /*Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LocationScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Genera",
                            color: kBelongMarineBlue,
                          ),
                        ),
                      ),
                      /*IconButton(
                        icon: Icon(Icons.dehaze),
                        iconSize: 20.0,
                        color: Color.fromRGBO(15, 37, 50, 80),
                        onPressed: () {},
                      )*/
                    ],
                  ),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: Container(
                  height: 140,
                  width: 100,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.fromLTRB(12, 10, 10, 5),
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        StatScreen()));
                          },
                          child: Column(
                            children: [
                              LocalInfoWidget(
                                asset_icon: "assets/images/building.png",
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "STATS",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kBelongMarineBlue,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            LocalInfoWidget(
                              asset_icon: 'assets/images/open-book.png',
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "SCHOOLS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kBelongMarineBlue,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            LocalInfoWidget(
                              asset_icon: 'assets/images/park.png',
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "PARKS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(15, 37, 50, 80),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            LocalInfoWidget(
                              asset_icon: 'assets/images/shopping-cart.png',
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "RETAIL",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(15, 37, 50, 80),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            LocalInfoWidget(
                              asset_icon: 'assets/images/information-point.png',
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "PUBLIC SERVICE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(15, 37, 50, 80),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ]),
          ),
          /*Main Teams*/
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.black54,
                      ),
                      hintText: "Enter your city here",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      //cityName = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        print("Tap on plaza");
                      },
                      child: Text(
                        "History",
                        style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.w600,
                          color: kHeadlineCategory,
                          fontFamily: "Genera",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    color: kHeadlineCategory,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
