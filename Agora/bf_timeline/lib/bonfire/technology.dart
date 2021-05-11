import 'package:bf_timeline/models/user.dart';
import 'package:bf_timeline/providers/auth_provider.dart';
import 'package:bf_timeline/widgets/bf_subcateg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_screen.dart';
import '../my_flutter_app_icons.dart';

class Technology extends StatefulWidget {
  final String bonfire;

  Technology({this.bonfire});

  @override
  _TechnologyState createState() => _TechnologyState(
        bonfire: this.bonfire,
      );
}

class _TechnologyState extends State<Technology> {
  final String bonfire;
  bool isDrone = false;
  bool isSoftware = false;
  bool isHardware = false;
  bool isMechanical = false;
  bool isWS = false;
  bool isWD = false;

  //Upload Data
  bool isUploading = false;

  String drones = "Drones";
  String software = "Software";
  String hardware = "Hardware";
  String mechanical = "Mechanical";
  String ws = "Web Server";
  String wd = "Web Development";

  List<String> bonfires = [];

  _TechnologyState({this.bonfire});

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
                    isDrone = !isDrone;
                    if (isDrone == true) {
                      bonfires.add(drones);
                    }
                  });
                },
                child: BF_SubCateg_Widget(
                    icon: MyFlutterApp.vector,
                    data: "Drones",
                    color1:
                        isDrone == false ? Colors.lightBlueAccent : Colors.grey,
                    color2: isDrone == false ? Colors.blue : Colors.blueGrey),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSoftware = !isSoftware;
                    if (isSoftware == true) {
                      bonfires.add(software);
                    }
                  });
                },
                child: BF_SubCateg_Widget(
                    icon: Icons.computer,
                    data: "Software",
                    color1: isSoftware == false ? Colors.amber : Colors.grey,
                    color2: isSoftware == false
                        ? Colors.amber.shade700
                        : Colors.blueGrey),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isHardware = !isHardware;
                    if (isHardware == true) {
                      bonfires.add(hardware);
                    }
                  });
                },
                child: BF_SubCateg_Widget(
                    icon: MyFlutterApp.rocket,
                    data: "Hardware",
                    color1:
                        isHardware == false ? Colors.redAccent : Colors.grey,
                    color2: isHardware == false
                        ? Colors.deepOrangeAccent
                        : Colors.blueGrey),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMechanical = !isMechanical;
                    if (isMechanical == true) {
                      bonfires.add(mechanical);
                    }
                  });
                },
                child: BF_SubCateg_Widget(
                    icon: MyFlutterApp.cog_1,
                    data: "Mechanical",
                    color1: isMechanical == false
                        ? Colors.grey.shade300
                        : Colors.grey,
                    color2: isMechanical == false
                        ? Colors.grey.shade700
                        : Colors.blueGrey),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isWS = !isWS;
                    if (isWS == true) {
                      bonfires.add(ws);
                    }
                  });
                },
                child: BF_SubCateg_Widget(
                    icon: MyFlutterApp.database,
                    data: "Web Server",
                    color1: isWS == false ? Colors.greenAccent : Colors.grey,
                    color2: isWS == false
                        ? Colors.greenAccent.shade700
                        : Colors.blueGrey),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isWD = !isWD;
                    if (isWD == true) {
                      bonfires.add(wd);
                    }
                  });
                },
                child: BF_SubCateg_Widget(
                    icon: MyFlutterApp.globe,
                    data: "Web Development",
                    color1: isWD == false ? Colors.greenAccent : Colors.grey,
                    color2: isWD == false ? Colors.blue : Colors.blueGrey),
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
                                    .collection("usersBonfire")
                                    .document(_currentUser.getCurrentUser.uid).
                                    updateData(
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
