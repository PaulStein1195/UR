import 'package:flutter/material.dart';
import 'package:ur_opinion/widgets/my_flutter_app_icons.dart';

class Select_PostType extends StatelessWidget {
  List<String> categories = [
    "General",
    "Buy / Sale",
    "Question",
    "Suggestions",
    "Jobs",
    "Companies",
    "News",
    "Alerts",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.2,
          centerTitle: true,
          title: Text("Select category"),
        ),
        body: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: categories.map((
            title,
          ) {
            //Loop all item in events list
            return GestureDetector(
              child: Card(
                margin: const EdgeInsets.all(10.0),
                child: getCardByTitle(title),
              ),
              onTap: () {
                //Show Toast
              },
            );
          }).toList(),
        ));
  }

  Widget getCardByTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20.0),
    );
  }
}
