import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
//import 'package:percent_indicator/percent_indicator.dart';

class Posts extends StatelessWidget {
  String userImage,
      username,
      timestamp,
      label,
      title,
      postsImages,
      opinion,
      percentage;
  Color labelColor;
  double percent;

  Posts(this.userImage, this.username, this.timestamp, this.label, this.title,
      this.postsImages, this.opinion, this.percentage, this.labelColor,
      this.percent);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: Colors.grey.shade200,
          child: Column(
            children: [
              postHeader(
                  userImage, username, timestamp, label, labelColor, title),
              postImage(postsImages),
              postInteraction(opinion, percentage, percent),
            ],
          ),
        ));
  }

  Widget postHeader(String userImage,
      String username,
      String timestamp,
      String label,
      Color labelColor,
      String title,) {
    return Column(
      children: [
        ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                  userImage), //"https://picsum.photos/250?image=11"
            ),
            title: Text(username),
            subtitle: Text(timestamp),
            trailing: Container(
                color: labelColor,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text(
                    label,
                    style: TextStyle(),
                  ),
                ))),
        Padding(
          padding:
          const EdgeInsets.only(left: 15, bottom: 10.0, right: 8.0, top: 2),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: new Text(
                    title,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget postImage(String postImage) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(postImage), //"https://picsum.photos/250?image=11"
        ),
      ),
    );
  }

  Widget postInteraction(String opinion, String percentage, double percent) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(9, 9, 3, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Text(
                "Opinion: ",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  color: Colors.grey.shade800,
                ),
              ),
              Text(
                opinion, //"User giving an opinion about their post",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Colors.grey,
                    ),
                    Text("0"),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.thumb_down,
                      color: Colors.grey,
                    ),
                    Text("0"),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: CircularPercentIndicator(
                          radius: 60.0,
                          lineWidth: 5.0,
                          animation: true,
                          percent: percent,
                          //0.5,
                          center: new Text(
                            percentage, //"50 %",
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.grey,
                          backgroundColor: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.comment,
                      color: Colors.grey,
                    ),
                    Text("0"),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.trending_up,
                      color: Colors.grey,
                    ),
                    Text("0"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
