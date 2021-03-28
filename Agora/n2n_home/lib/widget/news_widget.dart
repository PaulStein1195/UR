import 'package:flutter/material.dart';

class RadioWidget extends StatelessWidget {
  String trendImage, title, score;

  RadioWidget(this.trendImage, this.title, this.score);
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
              imageTrend(trendImage),
              SizedBox(width: 30.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(title, style: TextStyle(fontSize: 25.0),),
                  Text(score)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget imageTrend(String postImage) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(trendImage),   //"https://picsum.photos/250?image=11"
        ),
      ),
    );
  }
}
