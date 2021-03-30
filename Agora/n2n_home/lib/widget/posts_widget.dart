import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../my_flutter_app_icons.dart';
//import 'package:percent_indicator/percent_indicator.dart';

class Posts extends StatelessWidget {
  bool isImage = true;
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
      this.percent, this.isImage);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 7.0, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: Column(
            children: [
              postHeader(
                  userImage, username, timestamp, label, labelColor, title),
              isImage == true ? Padding(
                padding: const EdgeInsets.all(4.0),
                child: postImage(postsImages),
              ) : Text(""),
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
                  padding: const EdgeInsets.fromLTRB(13, 7, 13, 7),
                  child: Text(
                    label,
                    style: TextStyle(color: Colors.white),
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
              /*Text(
                "Opinion: ",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  color: Colors.grey.shade800,
                ),
              ),*/
              Flexible(
                child: Text(
                  opinion, //"User giving an opinion about their post",
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
          Padding(
            padding: const EdgeInsets.only(top: 18.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      MyFlutterApp.thumbs_up,
                      size: 30,
                      color: Colors.grey,
                    ),
                    Text("0", style: TextStyle(color: Colors.grey.shade600)),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      MyFlutterApp.thumbs_down,
                      size: 30,
                      color: Colors.grey,
                    ),
                    Text("0", style: TextStyle(color: Colors.grey.shade600)),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: CircularPercentIndicator(
                          radius: 80.0,
                          lineWidth: 8.0,
                          animation: true,
                          percent: percent,
                          //0.5,
                          center: new Text(
                            percentage,
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700
                            ),//"50 %",
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Colors.green.shade400,
                          backgroundColor: Colors.grey.shade100),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      MyFlutterApp.lnr_bubble,
                      size: 30.0,
                      color: Colors.grey,
                    ),
                    Text("0", style: TextStyle(color: Colors.grey.shade600),),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.trending_up,
                      color: Colors.grey,
                      size: 30,
                    ),
                    Text("0", style: TextStyle(color: Colors.grey.shade600)),
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
