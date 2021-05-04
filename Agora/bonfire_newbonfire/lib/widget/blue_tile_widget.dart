import 'package:flutter/material.dart';
import 'package:bonfire_newbonfire/const/color_pallete.dart';

class BlueTileWidget extends StatefulWidget {

  final String assetIcon, title, description;

  BlueTileWidget({this.assetIcon, this.title, this.description});

  @override
  _BlueTileWidgetState createState() => _BlueTileWidgetState();
}

class _BlueTileWidgetState extends State<BlueTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5.0,
        color: Colors.grey.shade100,//Colors.blue.shade50,
        child: Container(
          height: 100,
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ListTile(
                  leading: Container(
                    height: 90,
                    width: 70,
                    child: Image.asset(widget.assetIcon),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: "PT-Sans",
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  subtitle: Flexible(
                    child: Text(
                      widget.description,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Genera",
                        color: Colors.grey,//Color.fromRGBO(15, 37, 50, 80),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
