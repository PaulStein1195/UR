import "package:flutter/material.dart";

class Todos extends StatefulWidget {
  @override
  _TodosState createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("TO DO'S",),
        elevation: 0.5,
      ),
      body: Container(),
    );
  }
}
