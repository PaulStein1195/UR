import 'package:flutter/material.dart';

class LocalInfoWidget extends StatefulWidget {

  final String asset_icon;

  LocalInfoWidget({this.asset_icon});

  @override
  _LocalInfoWidgetState createState() => _LocalInfoWidgetState();
}

class _LocalInfoWidgetState extends State<LocalInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: <Widget>[
          Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white70,
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    image: DecorationImage(
                      image: AssetImage(
                          widget.asset_icon ),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              )),
        ],
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0)),
      elevation: 3,
    );
  }
}

