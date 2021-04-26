import 'package:flutter/material.dart';

class Trends extends StatelessWidget {
  String trendImage, title, score;

  Trends(this.trendImage, this.title, this.score);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0XFF717171),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        NetworkImage("https://picsum.photos/250?image=11"), //,
                  ),
                  title: Text(
                    title,
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0),
                  ),
                  subtitle: Text(
                    score,
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: Icon(
                    Icons.share,
                    color: Colors.white70,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [],
                        ),
                        Material(
                          color: Color(0XFFffb21a),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          child: MaterialButton(
                            elevation: 5.0,
                            onPressed: () {},
                            child: Text(
                              "JOIN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
