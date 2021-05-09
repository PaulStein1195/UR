import 'package:bonfire_newbonfire/const/color_pallete.dart';
import 'package:bonfire_newbonfire/screens/user_access/widgets/amber_btn_widget.dart';
import 'package:flutter/material.dart';

import '../my_flutter_app_icons.dart';

class BonfireScreen extends StatefulWidget {
  final String query;

  BonfireScreen({this.query});

  @override
  BonfireScreenState createState() => BonfireScreenState(query: this.query);
}

class BonfireScreenState extends State<BonfireScreen> {
  final String query;

  BonfireScreenState({this.query});

  @override
  Widget build(BuildContext context) {
    print(query);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildProfileView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileView() {
    return Column(
      children: [
        Card(
          color: Color.fromRGBO(41, 39, 40, 150.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                kAmberColor,
                                Colors.red,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            query,
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Material(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {},
                        minWidth: 90.0,
                        height: 30.0,
                        child: Text(
                          "JOIN",
                          style: TextStyle(
                            letterSpacing: 0.3,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description of the bonfire ??",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white70, fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              _userCollectedData()
            ],
          ),
        ),
      ],
    );
  }

  Widget _userCollectedData() {
    //DEBUGGING: print(_snapshot.data.length);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildCountColumn("Bonfires", 0),
          buildCountColumn("Memebers", 0),
          buildCountColumn("Posts", 0),
          buildCountColumn("Rated", 0),
          //buildCountColumn("followers", 0),
        ],
      ),
    );
  }

  Column buildCountColumn(String label, int count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count.toString(),
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Container(
          margin: EdgeInsets.only(top: 4.0),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
