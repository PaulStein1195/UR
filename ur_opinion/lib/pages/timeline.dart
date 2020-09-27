import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ur_opinion/models/data.dart';
import 'package:ur_opinion/models/trends.dart';
import 'package:ur_opinion/pages/create_post.dart';
import 'package:ur_opinion/widgets/post_card_widget.dart';
import 'package:ur_opinion/models/posts.dart';
import '../widgets/scrollable_teams_widget.dart';
import '../widgets/my_flutter_app_icons.dart';

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
          )
        ],
      ),
      body: ListView(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "TEAMS",
              style: TextStyle(fontSize: 17.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 15),
            child: Divider(
              color: Colors.black87,
            ),
          ),
          Teams(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "POSTS",
              style: TextStyle(fontSize: 17.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 0, 15),
            child: Divider(
              color: Colors.black87,
            ),
          ),
          Posts(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "TOP 5",
              style: TextStyle(fontSize: 17.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 0, 15),
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
