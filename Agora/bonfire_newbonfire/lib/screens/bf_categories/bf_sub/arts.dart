import 'package:bonfire_newbonfire/const/color_pallete.dart';
import 'package:bonfire_newbonfire/screens/new_user/done_screen.dart';
import 'package:bonfire_newbonfire/screens/user_access/widgets/amber_btn_widget.dart';
import 'package:bonfire_newbonfire/widget/bf_subcateg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../my_flutter_app_icons.dart';
import '../select_bonfires_screen.dart';

String bf_Id;
bool bfSelected = false;

class BF_Arts extends StatefulWidget {
  final String bonfire;

  BF_Arts({this.bonfire});

  @override
  BonfireCategoriesState createState() => BonfireCategoriesState(
    bonfire: this.bonfire,
  );
}

class BonfireCategoriesState extends State<BF_Arts> {
  final String bonfire;
  String bonfireUpperCase;
  bool checkState = false;

  BonfireCategoriesState({this.bonfire});

  @override
  Widget build(BuildContext context) {
    if (bonfire == "Arts") {
      bf_Id = "bf_a";
      bonfireUpperCase = bonfire.toUpperCase();
    }
    return Scaffold(
      //appBar: kAppbar(context),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      bonfireUpperCase,
                      style: TextStyle(fontSize: 38.0, color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  FutureBuilder<DocumentSnapshot>(
                    future: Firestore.instance
                        .collection("Bonfire")
                        .document("bfId")
                        .collection(bonfire)
                        .document(bf_Id)
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: SpinKitFadingFour(
                            size: 50.0,
                            color: kAmberColor,
                          ),
                        );
                      }
                      var _data = snapshot.data;

                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BF_SubCateg_Widget(
                                  icon: MyFlutterApp.star,
                                  data: _data["1"],
                                  color1: Colors.pink.shade300,
                                  color2: Colors.pinkAccent),
                              /*SizedBox(
                                height: 10.0,
                              ),
                              BF_SubCateg_Widget(
                                  icon: MyFlutterApp.guidedog,
                                  data: _data["3"],
                                  color1: Colors.brown,
                                  color2: Colors.brown.shade200),*/
                              SizedBox(
                                height: 10.0,
                              ),
                              BF_SubCateg_Widget(
                                  icon: MyFlutterApp.nuclear,
                                  data: _data["2"],
                                  color1: Colors.purple,
                                  color2: Colors.deepPurple.shade300),
                              SizedBox(
                                height: 10.0,
                              ),
                              BF_SubCateg_Widget(
                                  icon: MyFlutterApp.film_play,
                                  data: _data["4"],
                                  color1: Colors.lightBlueAccent.shade200,
                                  color2: Colors.blue),
                              SizedBox(
                                height: 10.0,
                              ),
                              BF_SubCateg_Widget(
                                  icon: MyFlutterApp.palette,
                                  data: _data["5"],
                                  color1: Colors.white,
                                  color2: Colors.white24),
                              SizedBox(
                                height: 10.0,
                              ),
                              BF_SubCateg_Widget(
                                  icon: MyFlutterApp.brush_1,
                                  data: _data["6"],
                                  color1: Colors.redAccent,
                                  color2: Colors.redAccent.shade700),
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
                                            borderRadius:
                                            BorderRadius.circular(100.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Hero(
                                              tag: "bf",
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage("assets/images/Yellow-Flame.png")
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      100.0),
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
                                    ),
                                    Text(
                                      "+ Add New Bonfire",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25.0),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 50.0),
                  Amber_Btn_Widget(
                      context: context,
                      text: "DONE",
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                backgroundColor: Color(0XFF333333),
                                title: Text(
                                  "Want to continue adding more bonfires?",
                                  style: TextStyle(
                                    //decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                children: [
                                  SimpleDialogOption(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FirstSuggestionScreen()),
                                        ModalRoute.withName("home"),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 10.0),
                                      child: Material(
                                        color: Theme.of(context).accentColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "YES",
                                            style: TextStyle(
                                                letterSpacing: 0.3,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DoneScreen()),
                                        ModalRoute.withName("home"),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 5.0),
                                      child: Material(
                                        color: Theme.of(context).accentColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "I'M DONE",
                                            style: TextStyle(
                                                letterSpacing: 0.3,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.grey.shade100,
                                      size: 30.0,
                                    ),
                                  ),
                                ],
                              );
                            });
                      }),
                  SizedBox(height: 50.0),
                ],
              ),
            ],
          )),
    );
  }
}
