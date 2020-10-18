import 'package:flutter/material.dart';
import 'package:ur_opinion/widgets/my_flutter_app_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Select_PostType extends StatefulWidget {
  @override
  _Select_PostTypeState createState() => _Select_PostTypeState();
}

class _Select_PostTypeState extends State<Select_PostType> {

  Material myItems(IconData icon, String heading, Color color) {
    return Material(
      color: Colors.white,
      elevation: 7.5,
      shadowColor: Colors.white,
      borderRadius: BorderRadius.circular(7.0),
      child: Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    //Text
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(heading, style: TextStyle(color: color, fontSize: 19.0),),
                    ),
                  ),
                  //Icon
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Icon(
                        icon,
                        color: color,
                        size: 35.0,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),

      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        centerTitle: true,
        title: Text("Select category"),
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        children: [
          myItems(MyFlutterApp.globe_1, "General", Colors.blue),
          myItems(MyFlutterApp.help, "Ask", Colors.red),
          myItems(MyFlutterApp.tag, "Give away", Colors.teal),
          myItems(MyFlutterApp.doc, "News", Colors.grey),
          myItems(MyFlutterApp.shop, "Job", Colors.green),
          myItems(MyFlutterApp.attention, "Safety", Colors.amber),
          myItems(MyFlutterApp.attach, "Other", Colors.purple),
        ],
        staggeredTiles: [
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(1, 130.0),
          StaggeredTile.extent(2, 130.0),
        ],
      ),);
  }
}

