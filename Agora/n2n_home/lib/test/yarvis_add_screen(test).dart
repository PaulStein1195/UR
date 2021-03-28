import 'package:flutter/material.dart';
import 'package:n2n_home/test/yarvis_widget.dart';

class Yarvis_add extends StatefulWidget {
  @override
  _Yarvis_addState createState() => _Yarvis_addState();
}

class _Yarvis_addState extends State<Yarvis_add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("Add to Yarvis"),
        elevation: 0.1,
      ),
      body: ListView(
        children: [
          YarvisWidget(
              color1: Colors.green.shade700,
              color2: Colors.green.shade500,
              color3: Colors.green.shade300,
              title: "Label",
              score: "Description and guidance"),
          YarvisWidget(
              color1: Colors.indigo.shade700,
              color2: Colors.indigo.shade400,
              color3: Colors.indigo.shade300,
              title: "Label",
              score: "Description and guidance"),
          YarvisWidget(
              color1: Colors.red.shade700,
              color2: Colors.red.shade400,
              color3: Colors.red.shade200,
              title: "Label",
              score: "Description and guidance"),
          YarvisWidget(
              color1: Colors.blue.shade700,
              color2: Colors.blue.shade400,
              color3: Colors.blue.shade200,
              title: "Label",
              score: "Description and guidance"),
          YarvisWidget(
              color1: Colors.orangeAccent.shade700,
              color2: Colors.orangeAccent.shade400,
              color3: Colors.orangeAccent.shade200,
              title: "Label",
              score: "Description and guidance"),
          YarvisWidget(
              color1: Colors.purpleAccent.shade700,
              color2: Colors.purpleAccent.shade400,
              color3: Colors.purpleAccent.shade200,
              title: "Label",
              score: "Description and guidance"),
          YarvisWidget(
              color1: Colors.blueGrey.shade700,
              color2: Colors.blueGrey.shade400,
              color3: Colors.blueGrey.shade200,
              title: "Label",
              score: "Description and guidance"),
          YarvisWidget(
              color1: Colors.yellow.shade700,
              color2: Colors.yellow.shade400,
              color3: Colors.yellow.shade200,
              title: "Label",
              score: "Description and guidance"),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}
