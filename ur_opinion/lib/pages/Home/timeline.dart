import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ur_opinion/models/data.dart';
import 'package:ur_opinion/models/trends.dart';
import 'package:ur_opinion/pages/Home/create_post.dart';
import 'package:ur_opinion/widgets/post_card_widget.dart';
import 'package:ur_opinion/models/posts.dart';
import '../../widgets/scrollable_teams_widget.dart';
import '../../widgets/my_flutter_app_icons.dart';

class TimelinePage extends StatefulWidget {
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  var _deviceHeight;
  var _deviceWidth;
  List<Posts> _postsData = [];

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "UrOpinion",
          style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.grey.shade900),
        ),
        actions: [
          IconButton(
            onPressed: (){
            },
            icon: Icon(Icons.search, size: 26.0, color: Colors.grey.shade700,),
          ),
          IconButton(
            onPressed: (){
            },
            icon: Icon(Icons.mic, size: 26.0, color: Colors.grey.shade700,),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "TEAMS",
              style: TextStyle(fontSize: 15.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Divider(
              color: Colors.black87,
            ),
          ),
          Teams(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "POSTS (15)",
              style: TextStyle(fontSize: 15.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
            child: Divider(
              color: Colors.black87,
            ),
          ),
          Posts("https://picsum.photos/250?image=10", "Paul", "0/0/2020", "Hello", "Titleee", "https://picsum.photos/250?image=10","OPINION","50 %", Colors.white, 0.5),
          Posts("https://picsum.photos/250?image=11", "Pablo", "8/0/2020","Hello", "Titleee","https://picsum.photos/250?image=10","OPINION","50 %", Colors.white, 0.5),
          Posts("https://picsum.photos/250?image=7", "Rafa", "5/0/2020", "Hello", "Titleee 1", "https://picsum.photos/250?image=10","OPINION","50 %", Colors.white, 0.5),
          Posts("https://picsum.photos/250?image=5", "Rafael", "0/5/2020", "Hello", "Titleee", "https://picsum.photos/250?image=10","OPINION","50 %", Colors.white, 0.5),
          SizedBox(height: 18.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "TOP 5",
              style: TextStyle(fontSize: 15.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
            child: Divider(
              color: Colors.black87,
            ),
          ),
          Trends()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Create_Post())),
        child: Icon(
          MyFlutterApp.edit_alt,
          color: Colors.grey.shade700,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _socialInfoContainer(BuildContext _context) {
    return Container(
      height: MediaQuery.of(_context).size.height * 0.085,
      width: MediaQuery.of(_context).size.width * 0.906,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          color: Colors.grey.shade100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Icon(
                Icons.hearing,
                color: Colors.grey.shade700,
                size: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "123",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.comment,
                color: Colors.grey.shade700,
                size: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "123",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.share,
                color: Colors.grey.shade700,
                size: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "123",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
