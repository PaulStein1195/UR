import 'package:bf_timeline/providers/auth_provider.dart';
import 'package:bf_timeline/services/database.dart';
import 'package:bf_timeline/widgets/bf_subcateg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../home_screen.dart';
import '../my_flutter_app_icons.dart';

class Health extends StatefulWidget {
  final String bonfire;

  Health({this.bonfire});

  @override
  _HealthState createState() => _HealthState(
    bonfire: this.bonfire,
  );
}

class _HealthState extends State<Health> {
  final String bonfire;
  bool isFood = false;
  bool isExercise = false;
  bool isMind = false;
  bool isBody = false;


  //Upload Data
  bool isUploading = false;

  String food = "Food";
  String exercise = "Exercise";
  String mind = "Mind";
  String body = "Body";

  String usersBonfire = "usersHealth";
  String bf_id = "bf_Id";
  List<String> bonfires = [];

  _HealthState({this.bonfire});

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
                    isFood = !isFood;
                    if (isFood == true) {
                      bonfires.add(food);
                    }
                  });
                },
                child: BF_SubCateg_Widget(
                    icon: MyFlutterApp.food,
                    data: "Food",
                    color1:
                    isFood == false ? Colors.amber.shade700 : Colors.grey,
                    color2: isFood == false ? Colors.yellowAccent : Colors.blueGrey),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExercise = !isExercise;
                    if (isExercise == true) {
                      bonfires.add(exercise);
                    }
                  });
                },
                child: BF_SubCateg_Widget(
                    icon: MyFlutterApp.directions_bike,
                    data: "Exercise",
                    color1: isExercise == false ? Colors.lightGreen : Colors.grey,
                    color2: isExercise == false
                        ? Colors.lightBlueAccent
                        : Colors.blueGrey),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMind = !isMind;
                    if (isMind == true) {
                      bonfires.add(mind);
                    }
                  });
                },
                child: BF_SubCateg_Widget(
                    icon: FontAwesomeIcons.brain,
                    data: "Mind",
                    color1:
                    isMind == false ? Colors.pink : Colors.grey,
                    color2: isMind == false
                        ? Colors.orangeAccent
                        : Colors.blueGrey),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isBody = !isBody;
                    if (isBody == true) {
                      bonfires.add(body);
                    }
                  });
                },
                child: BF_SubCateg_Widget(
                    icon: MyFlutterApp.heart_pulse,
                    data: "Body",
                    color1: isBody == false
                        ? Colors.blueAccent
                        : Colors.grey,
                    color2: isBody == false
                        ? Colors.blueAccent.shade100
                        : Colors.blueGrey),
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
                color: Colors.blueAccent,//Colors.orange.shade600, //Theme.of(context).accentColor,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 3.0,
                child: MaterialButton(
                  onPressed: isUploading
                      ? null
                      : () async {
                    setState(() {
                      isUploading = true;
                    });
                    await Database().createBonfire(
                        bonfire,
                        _currentUser.getCurrentUser.uid,
                        usersBonfire,
                        bf_id,
                        bonfires);
                    /*await Firestore.instance
                                    .collection(bonfire)
                                    .document(_currentUser.getCurrentUser.uid).collection(usersBonfire).document(bf_id).
                                    updateData(
                                  {
                                    "bonfire": bonfires
                                    /* NESTED ARRAY
                                    "bonfires": {
                                      bonfire: bonfires
                                    }*/
                                  },
                                );*/
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
