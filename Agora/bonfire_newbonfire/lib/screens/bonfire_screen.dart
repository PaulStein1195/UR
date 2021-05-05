import 'package:flutter/material.dart';

class BonfireScreen extends StatefulWidget {
  final String query;

  BonfireScreen({this.query});

  @override
  BonfireScreenState createState() => BonfireScreenState(
    query: this.query
  );
}

class BonfireScreenState extends State<BonfireScreen> {
  final String query;

  BonfireScreenState({this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(query, style: TextStyle(fontSize: 30.0, color: Colors.white),),

          ListView(
            children: [
            ],
          )
        ],
      ),
    );
  }
}

