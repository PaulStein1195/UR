import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:map_fire/providers/firebase_methods.dart';
import 'package:map_fire/screens/profile_screen.dart';
import 'package:map_fire/services/geolocator.dart';
import 'package:map_fire/services/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.locationData});

  final locationData;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LocationModel weather = LocationModel();
  String cityName, cityCountry, cityState;
  double cityLat, cityLong;
  //FirebaseMethods _firebaseMethods = FirebaseMethods();
  //FirebaseUser user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationData);
    //saveLatLongInDB(user);
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
    cityLat = locationData[0]["lat"];
    cityLong = locationData[0]["lon"];
  }

  @override
  Widget build(BuildContext context) {
    print(cityLong);
    return Scaffold(
      appBar: AppBar(
        title: Text("$cityName, $cityState"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 8.0,
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Column(
                  children: [
                    Text(
                      "Live Map",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          letterSpacing: 1.0),
                    ),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    Container(
                      height: 350,
                      width: 500,
                      child: FlutterMap(
                        options: new MapOptions(
                            center: new LatLng(cityLat, cityLong),
                            minZoom: 10.0),
                        layers: [
                          new TileLayerOptions(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c'],
                          ),
                          new MarkerLayerOptions(
                            markers: [
                              new Marker(
                                width: 45.0,
                                height: 45.0,
                                point: new LatLng(cityLat, cityLong),
                                builder: (context) => new Container(
                                  child: Icon(
                                    Icons.location_on,
                                    size: 50.0,
                                    color: Colors.blue.shade800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),

      /*FLOATING CATION BUTTON*/
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white, //kBelongMarineBlue,
        onPressed: () {},
        /* => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CreatePostPage())),*/
        child: Icon(
          Icons.add,
          color: Colors.lightBlueAccent,
        ),
      ),
    );
  }

  /*void saveLatLongInDB(FirebaseUser currentUser) {
    _firebaseMethods.getCurrentUser().then((user) {
      setState(() {
        currentUser = user;
        _firebaseMethods.updateUser(currentUser, cityLat, cityLong);
      });
      print("Coordinates updated");
    });
  }*/
}
