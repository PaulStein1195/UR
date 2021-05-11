import 'package:bf_timeline/providers/auth_provider.dart';
import 'package:bf_timeline/widgets/bf_subcateg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_screen.dart';
import '../my_flutter_app_icons.dart';

class Nature extends StatefulWidget {
  final String bonfire;

  Nature({this.bonfire});

  @override
  _NatureState createState() => _NatureState(
    bonfire: this.bonfire,
  );
}

class _NatureState extends State<Nature> {
  final String bonfire;
  bool isAnimals = false;
  bool isPlants = false;
  bool isSea = false;
  bool isTravel = false;
  bool isClimate = false;
  bool isGeneral = false;

  //Upload Data
  bool isUploading = false;

  String animals = "Animals";
  String plants = "Plants";
  String sea = "Sea";
  String travel = "Travel";
  String climate = "Climate Change";
  String general = "General";

  List<String> bonfires = [];

  _NatureState({this.bonfire});

  @override
  Widget build(BuildContext context) {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    print(_currentUser.getCurrentUser.uid);
    return Scaffold(
      backgroundColor: Color(0XFF333333),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          bonfire,
          style: TextStyle(color: Colors.white70, fontSize: 25.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAnimals = !isAnimals;
                    if (isAnimals == true) {
                      bonfires.add(animals);
                    }
                  });
                },
                child: BF_SubCateg_Widget(
                    icon: MyFlutterApp.vector,
                    data: "Animals",
                    color1:
                    isAnimals == false ? Colors.lightBlueAccent : Colors.grey,
                    color2: isAnimals == false ? Colors.blue : Colors.blueGrey),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPlants = !isPlants;
                    if (isPlants == true) {
                      bonfires.add(plants);
                    }
                  });
                },
                child: BF_SubCateg_Widget(
                    icon: Icons.computer,
                    data: "Plants",
                    color1: isPlants == false ? Colors.amber : Colors.grey,
                    color2: isPlants == false
                        ? Colors.amber.shade700
                        : Colors.blueGrey),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSea = !isSea;
                    if (isSea == true) {
                      bonfires.add(sea);
                    }
                  });
                },
                child: BF_SubCateg_Widget(
                    icon: MyFlutterApp.rocket,
                    data: "Sea",
                    color1:
                    isSea == false ? Colors.redAccent : Colors.grey,
                    color2: isSea == false
                        ? Colors.deepOrangeAccent
                        : Colors.blueGrey),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isTravel = !isTravel;
                    if (isTravel == true) {
                      bonfires.add(travel);
                    }
                  });
                },
                child: BF_SubCateg_Widget(
                    icon: MyFlutterApp.cog_1,
                    data: "Travel",
                    color1: isTravel == false
                        ? Colors.grey.shade300
                        : Colors.grey,
                    color2: isTravel == false
                        ? Colors.grey.shade700
                        : Colors.blueGrey),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isClimate = !isClimate;
                    if (isClimate == true) {
                      bonfires.add(climate);
                    }
                  });
                },
                child: BF_SubCateg_Widget(
                    icon: MyFlutterApp.database,
                    data: "Climate Change",
                    color1: isClimate == false ? Colors.greenAccent : Colors.grey,
                    color2: isClimate == false
                        ? Colors.greenAccent.shade700
                        : Colors.blueGrey),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isGeneral = !isGeneral;
                    if (isGeneral == true) {
                      bonfires.add(general);
                    }
                  });
                },
                child: BF_SubCateg_Widget(
                    icon: MyFlutterApp.globe,
                    data: "General",
                    color1: isGeneral == false ? Colors.greenAccent : Colors.grey,
                    color2: isGeneral == false ? Colors.blue : Colors.blueGrey),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white24),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 60.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/Yellow-Flame.png")),
                                borderRadius: BorderRadius.circular(100.0),
                                /*image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/images/flame_icon1.png")),*/
                                //Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "+ Add New Bonfire",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              isUploading
                  ? CircularProgressIndicator()
                  : Material(
                color: Colors
                    .orange.shade600, //Theme.of(context).accentColor,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 3.0,
                child: MaterialButton(
                  onPressed: isUploading
                      ? null
                      : () async {
                    setState(() {
                      isUploading = true;
                    });
                    await Firestore.instance
                        .collection("Users")
                        .document(_currentUser.getCurrentUser.uid)
                        .updateData(
                      {
                        bonfire: bonfires
                        /* NESTED ARRAY
                        "bonfires": {
                          bonfire: bonfires
                        }*/
                      },
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            HomeScreen(),
                      ),
                    );
                  },
                  minWidth: 300.0,
                  height: 42.0,
                  child: Text(
                    "DONE",
                    style: TextStyle(
                        letterSpacing: 0.3,
                        fontSize: 17.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

