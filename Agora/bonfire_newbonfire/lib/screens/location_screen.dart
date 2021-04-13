import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bonfire_newbonfire/const/color_pallete.dart';
import '../service/navigation_service.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationAddress});

  final locationAddress;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _address;

  /*void getAddress() async {
    String address = await AssistantAddress.searchCoordinateAddress();
    _address = address;
    print(_address);
  }*/

  @override
  void initState() {
    super.initState();
    updateUILocation(widget.locationAddress);
  }

  updateUILocation(dynamic placeAddress) {
    //getAddress();
    if (placeAddress == null) {
      return "Failed!";
    }
    var route =
        placeAddress["results"][0]["address_components"][3]["long_name"];
    _address = route;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.grey,
          centerTitle: true,
          title: GestureDetector(
            onTap: () {},
            child: Text(
              "$_address", //"Tidy Up",
              style: TextStyle(
                  color: Color.fromRGBO(15, 37, 50, 80),
                  fontSize: 20.5,
                  fontWeight: FontWeight.w600),
            ),
          ),
          actions: [
            FlatButton(
              color: Colors.grey.shade50,
              onPressed: () {
                //getAddress();
                setState(() {
                  _address;
                });
              },
              child: Text(
                "Get location",
                style: TextStyle(color: kBelongMarineBlue),
              ),
            ),
          ]),
      body: CustomScrollView(
        slivers: <Widget>[
          /*Main Teams*/
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(bottom: 28.0),
                  child: Container(
                    height: 140,
                    width: 100,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.fromLTRB(12, 10, 10, 5),
                        children: [
                          Column(
                            children: [
                              Card(
                                color: Colors.white,
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                        width: 90,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          color: Colors.white70,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white70,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/building.png'),
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0)),
                                elevation: 3,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Center(
                                      child: Text(
                                        "STATS",
                                        textDirection: TextDirection.ltr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(15, 37, 50, 80),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.white,
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Stack(
                                  children: <Widget>[
                                    GestureDetector(
                                      child: Container(
                                          width: 90,
                                          height: 90,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/open-book.png'),
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0)),
                                elevation: 3,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "SCHOOLS",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(15, 37, 50, 80),
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.white,
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                        width: 90,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/park.png'),
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0)),
                                elevation: 3,
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
                              Card(
                                color: Colors.white,
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                        width: 90,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/shopping-cart.png'),
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0)),
                                elevation: 3,
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
                              Card(
                                color: Colors.white,
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                        width: 90,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/information-point.png'),
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0)),
                                elevation: 3,
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
                          color: Colors.grey.shade700,
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
                    color: Colors.grey.shade400,
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
