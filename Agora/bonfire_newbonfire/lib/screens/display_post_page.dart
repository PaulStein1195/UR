import 'package:bonfire_newbonfire/widget/start_categories.dart';
import 'package:bonfire_newbonfire/widget/teams_widget(test).dart';
import 'package:bonfire_newbonfire/widget/trends.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bonfire_newbonfire/model/user.dart';
import 'package:bonfire_newbonfire/providers/auth.dart';
import 'package:bonfire_newbonfire/screens/create_post_screen.dart';
import 'package:bonfire_newbonfire/service/db_service.dart';
import 'package:bonfire_newbonfire/service/navigation_service.dart';
import 'package:provider/provider.dart';
import 'package:bonfire_newbonfire/model/post.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../my_flutter_app_icons.dart';

final postRef = Firestore.instance.collection("Posts");
final userRef = Firestore.instance.collection("Users");
AuthProvider _auth;
List<Post> posts;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool noData = false;
  List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 5.0,
        backgroundColor: Colors.black38,
        child: Icon(
          Icons.add,
          color: Colors.white70,
        ),
        onPressed: () =>
            Navigator.pushNamed(context, "create_post"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color.fromRGBO(41, 39, 40, 200.0),
            expandedHeight: 40.0,
            elevation: 0.0,
            leading: Icon(
              MyFlutterApp.magnifier,
              size: 25.0,
            ),
            actions: [
              SizedBox(
                width: 10.0,
              ),
              IconButton(
                splashColor: Colors.white70,
                onPressed: () {},
                icon: Icon(
                  MyFlutterApp.inbox,
                  size: 27.0,
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
              IconButton(
                splashColor: Colors.white70,
                onPressed: () {},
                icon: Icon(
                  MyFlutterApp.alarm,
                  size: 27.0,
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "What's Happening",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Trends("https://picsum.photos/250?image=11", "Technology",
                    "Create a Start up in SV"),
                Trends("https://picsum.photos/250?image=11", "Technology",
                    "Create a Start up in SV"),
                Trends("https://picsum.photos/250?image=11", "Technology",
                    "Create a Start up in SV"),
                ChangeNotifierProvider<AuthProvider>.value(
                  value: AuthProvider.instance,
                  child: Builder(
                    builder: (BuildContext context) {
                      _auth = Provider.of<AuthProvider>(context);
                      return StreamBuilder<List<Post>>(
                          stream:
                              DBService.instance.getPostsInDB(_auth.user.uid),
                          builder: (_context, _snapshot) {
                            var _data = _snapshot.data;
                            posts = _data.toList();
                            print(_snapshot.data);
                            if (!_snapshot.hasData) {
                              return SpinKitCircle(
                                color: Colors.lightBlueAccent,
                                size: 50.0,
                              );
                            }
                            if (_data.length == 0) {
                              return Center(child: Text("NO DATA YET!"));
                            }
                            return Column(
                              children: posts,
                            );
                          });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 2.0),
                    child: Text(
                      "Suggested for you",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Choose_B_Widget(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}
