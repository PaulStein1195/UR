import 'package:flutter/material.dart';

class Trends extends StatelessWidget {
  String trendImage, title, score;

  Trends(this.trendImage, this.title, this.score);
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
              SizedBox(width: 10.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(title),
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
      width: 120,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(postImage), //"https://picsum.photos/250?image=11"
        ),
      ),
    );
  }
}
