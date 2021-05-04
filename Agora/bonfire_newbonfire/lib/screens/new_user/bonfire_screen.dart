import 'package:bonfire_newbonfire/const/color_pallete.dart';
import 'package:bonfire_newbonfire/screens/new_user/select_bonfires_screen.dart';
import 'package:bonfire_newbonfire/screens/user_access/widgets/amber_btn_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'done_screen.dart';

String bf_Id;
bool bfSelected = false;

class Bonfire_Categories_Screen extends StatefulWidget {
  final String bonfire;

  Bonfire_Categories_Screen({this.bonfire});

  @override
  BonfireCategoriesState createState() => BonfireCategoriesState(
        bonfire: this.bonfire,
      );
}

class BonfireCategoriesState extends State<Bonfire_Categories_Screen> {
  final String bonfire;
  String bonfireUpperCase;
  bool checkState = false;

  BonfireCategoriesState({this.bonfire});

  @override
  Widget build(BuildContext context) {
    if (bonfire == "Arts") {
      bf_Id = "bf_a";
      bonfireUpperCase = bonfire.toUpperCase();
    } else if (bonfire == "Technology") {
      bf_Id = "bf_t";
      bonfireUpperCase = bonfire.toUpperCase();
    } else if (bonfire == "Nature") {
      bf_Id = "bf_n";
      bonfireUpperCase = bonfire.toUpperCase();
    }
    else if (bonfire == "Social") {
      bf_Id = "bf_s";
      bonfireUpperCase = bonfire.toUpperCase();
    }
    else if (bonfire == "Education") {
      bf_Id = "bf_e";
      bonfireUpperCase = bonfire.toUpperCase();
    }
    else if (bonfire == "Other") {
      bf_Id = "bf_o";
      bonfireUpperCase = bonfire.toUpperCase();
    }
    return Scaffold(
      //appBar: kAppbar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              bonfireUpperCase,
              style: TextStyle(fontSize: 38.0, color: Colors.white),
              textAlign: TextAlign.left,
            ),
            FutureBuilder<DocumentSnapshot>(
              future: Firestore.instance
                  .collection("Bonfires")
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

                return Align(
                  child: Container(
                    height: 380,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.fromLTRB(0, 2, 10, 5),
                      children: [
                        Row(
                          children: [
                            BonfiresOptions(_data["b1"], _data["b2"], _data["b3"], _data["b4"]),
                            BonfiresOptions(_data["b5"], _data["b6"],_data["b7"], _data["b8"]),
                          ],
                        )
                      ], /*_feature().map<Widget> ( (photo) {
              return _FeatureGridItem(featurePhoto: photo);//Feature(photo);
            }).toList()*/
                    ),
                  ),
                );
              },
            ),
            Amber_Btn_Widget(
                context: context,
                text: "DONE",
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          backgroundColor: Color(0XFF333333),
                          title: Text(
                            "Want to continue adding more bonfires?",
                            style: TextStyle(
                                //decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w400,
                                color: Colors.white70),
                            textAlign: TextAlign.center,
                          ),
                          children: [
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => FirstSuggestionScreen()),
                                  ModalRoute.withName("home"),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                child: Material(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  elevation: 5.0,
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
                                  MaterialPageRoute(builder: (context) => DoneScreen()),
                                  ModalRoute.withName("home"),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                child: Material(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                  elevation: 5.0,
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
            Column(
              children: [
                Text(
                  "Missing something?",
                  style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: () {
                    print("Tapping!!!!!");
                  },
                  child: Text(
                    "Make your suggestion for a new Bonfire",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget BonfiresOptions(String _bfname1, String _bfname2, String _bfname3, String _bfname4) {
  return Column(
    children: [
      SelectBonfire(_bfname1),
      SizedBox(
        height: 20.0,
      ),
      SelectBonfire(_bfname2),
      SizedBox(
        height: 20.0,
      ),
      SelectBonfire(_bfname3),
      SizedBox(
        height: 20.0,
      ),
      SelectBonfire(_bfname4),
    ],
  );
}

class SelectBonfire extends StatelessWidget {
  final String _bf_name;

  //final bool isCheckBoxState;
  //final Function checkBoxChangeState;

  SelectBonfire(
      this._bf_name); //this.isCheckBoxState, this.checkBoxChangeState);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {}, //checkBoxChangeState,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  //color: Colors.white70,
                  border: Border.all(
                    color:
                        bfSelected == false ? Color(0XFF717171) : Colors.green,
                  )),
              height: 60.0,
              width: 230.0,
              child: Center(
                child: Flexible(
                  child: Text(
                    _bf_name,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70,
                        letterSpacing: 1.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
