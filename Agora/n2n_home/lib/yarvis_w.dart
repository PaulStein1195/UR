import 'package:flutter/material.dart';

class YarvisWidget extends StatefulWidget {
  final Color color1, color2, color3;
  String title, score;

  YarvisWidget({this.color1,
    this.color2,
    this.color3,
    this.title,
    this.score});

  @override
  _YarvisWidgetState createState() => _YarvisWidgetState();
}

class _YarvisWidgetState extends State<YarvisWidget> {

  bool iconsPressed = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  // TODO: Create function to add category
                  setState(() {
                    if (iconsPressed == false) {
                      iconsPressed = true;
                    } else {
                      iconsPressed = false;
                    }
                  });
                },
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomCenter,
                      colors: [
                        widget.color1,
                        widget.color2,
                        widget.color3,
                      ],
                    ),
                  ),
                  child: Icon(
                    iconsPressed ?
                    Icons.check : Icons.add,
                    size: 35.0,
                    color: Colors.white.withOpacity(0.89),

                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.title,
                    style:
                    TextStyle(fontSize: 20.0, color: Colors.grey.shade700),
                  ),
                  Text(widget.score,
                      style: TextStyle(color: Colors.grey.shade500))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
