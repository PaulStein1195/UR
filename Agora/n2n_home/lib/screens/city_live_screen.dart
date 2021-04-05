import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:n2n_home/const/color_pallete.dart';
import 'package:n2n_home/test/teams_widget(test).dart';
import 'package:n2n_home/widget/trends_widget.dart';

class CityLiveScreen extends StatefulWidget {
  @override
  _CityLiveScreenState createState() => _CityLiveScreenState();
}

class _CityLiveScreenState extends State<CityLiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 30.0,
            centerTitle: true,
            title: Text(
              "City LIVE", //"Tidy Up",
              style: TextStyle(color: kBelongMarineBlue, fontSize: 20.0),
            ),
            actions: [
              SizedBox(
                width: 120.0,
              ),
              SizedBox(
                width: 10.0,
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      "TOPICS",
                      style: TextStyle(fontSize: 15.5, color: Color.fromRGBO(15, 37, 50, 30)),
                    ),
                  ),
                ),
                Divider(
                  color: Color.fromRGBO(15, 37, 50, 30), //Colors.black87,
                ),
                Teams(),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 5.0),
                  child: Text(
                    "TRENDS",
                    style: TextStyle(fontSize: 15.5, color: Color.fromRGBO(15, 37, 50, 30)),
                  ),
                ),
                Divider(
                  color: Color.fromRGBO(15, 37, 50, 30), //Colors.black87,
                ),
                Trends("https://picsum.photos/250?image=2", "COVID-19",
                    "10 days in a row"),
                Trends("https://picsum.photos/250?image=11", "Elections USA",
                    "3 days in a row"),
                Trends("https://picsum.photos/250?image=11", "Elections",
                    "Elections"),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
