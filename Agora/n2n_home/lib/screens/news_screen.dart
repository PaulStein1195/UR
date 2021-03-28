import 'package:flutter/material.dart';
import 'package:n2n_home/widget/news_widget.dart';


class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: ListView(
        children: [
          RadioWidget("assets/images/npr.png", "NPR NEWS",
              "National Public Radio USA"),
          RadioWidget("assets/images/engine.jpg", "Everyday astronaut",
              "Latest update on Spaceflight"),
          RadioWidget(
              "https://picsum.photos/250?image=11", "Elections", "Elections"),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
