import "package:flutter/material.dart";

class Wealth extends StatefulWidget {
  @override
  _WealthState createState() => _WealthState();
}

class _WealthState extends State<Wealth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("Wealth",),
        elevation: 0.5,
      ),
      body: Container(),
    );
  }
}
