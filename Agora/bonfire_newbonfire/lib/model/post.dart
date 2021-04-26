import 'package:bonfire_newbonfire/model/user.dart';
import 'package:bonfire_newbonfire/service/db_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bonfire_newbonfire/providers/auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

AuthProvider _auth;

class Post extends StatefulWidget {
  final String postId;
  final String ownerId;
  final String image;
  final String title;
  final String description;
  final String solution;
  final String mediaUrl;
  final Timestamp timestamp;
  final dynamic likes;

  Post(
      {this.postId,
      this.ownerId,
      this.image,
      this.title,
      this.description,
      this.solution,
      this.mediaUrl,
      this.timestamp,
      this.likes});

  factory Post.fromFirestore(DocumentSnapshot doc) {
    return Post(
      postId: doc['postId'],
      ownerId: doc['ownerId'],
      image: doc['image'],
      title: doc['title'],
      description: doc['description'],
      solution: doc['solution'],
      mediaUrl: doc["mediaUrl"],
      timestamp: doc['timestamp'],
      likes: doc['likes'],
    );
  }

  //TODO: METHOD TO GET LIKE ACCOUNTS

  @override
  _PostState createState() => _PostState(
        postId: this.postId,
        ownerId: this.ownerId,
        image: this.image,
        title: this.title,
        description: this.description,
        solution: this.solution,
        mediaUrl: this.mediaUrl,
        timestamp: this.timestamp,
        likes: this.likes,
      );
}

class _PostState extends State<Post> {
  final String postId;
  final String ownerId;
  final String image;
  final String title;
  final String description;
  final String solution;
  final String mediaUrl;
  final Timestamp timestamp;
  Map likes;

  _PostState(
      {this.postId,
      this.ownerId,
      this.image,
      this.title,
      this.description,
      this.solution,
      this.mediaUrl,
      this.timestamp,
      this.likes});

  postHeader() {
    return ChangeNotifierProvider<AuthProvider>.value(
      value: AuthProvider.instance,
      child: _buildMainScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        postHeader(),
        //buildPostFooter(),
        //  postInteraction(opinion, percentage, percent),
      ],
    );
  }

  Widget _buildMainScreen() {
    final userRef = Firestore.instance.collection("Users");
    return Builder(
      builder: (BuildContext _context) {
        _auth = Provider.of<AuthProvider>(_context);
        return StreamBuilder<List<Post>>(
          stream: DBService.instance.getPostsInDB(_auth.user.uid),
          builder: (_context, _snapshot) {
            var _data = _snapshot.data;
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
            return Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    //top: BorderSide(width: 1.5, color: Colors.grey.shade600),
                    //bottom: BorderSide(width: 1.5, color: Colors.grey.shade600),
                  ),
                  color: Color(0XFF292728),
                ),
                child: Column(
                  children: [
                    FutureBuilder(
                      future: userRef.document(_auth.user.uid).get(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return SpinKitCircle(
                            color: Colors.lightBlueAccent,
                            size: 50.0,
                          );
                        }
                        User user = User.fromDocument(snapshot.data);
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(user
                                .image), //"https://picsum.photos/250?image=11"
                          ),
                          title: Text(
                            user.name,
                            style: TextStyle(
                                color: Colors.grey.shade100,
                                fontWeight: FontWeight.w600,
                                fontSize: 17.0),
                          ),
                          subtitle: RichText(
                            text: new TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: new TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                //new TextSpan(text: user.email, style: TextStyle(decoration: TextDecoration.underline, color: Theme.of(context).accentColor)),
                                new TextSpan(
                                    text: /*" - " + */ timeago.format(
                                      timestamp.toDate(),
                                    ),
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white70)),
                              ],
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              CupertinoIcons.ellipsis,
                              color: Colors.white70,
                            ),
                            onPressed: () {},
                          ),
                        );
                      },
                    ),
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.6), BlendMode.dstATop),
                          fit: BoxFit.cover,
                          image: NetworkImage(mediaUrl),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 50,
                            blurRadius: 20,
                            offset: Offset(0, 6),
                          )
                        ],
                      ),
                    ),
                    buildPostFooter(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  buildPostFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(7, 0, 9, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      "DESCRIPTION",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade100),
                    ),
                  ),
                ],
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        description,
                        style: TextStyle(
                            fontSize: 15.5,
                            color: Colors.grey.shade100,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "SOLUTION",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade100),
                    ),
                  ),
                ],
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        solution,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey.shade100),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _listTileTrailingWidgets(Timestamp _lastMessageTimestamp) {
  return Text(
    timeago.format(_lastMessageTimestamp.toDate()),
    style: TextStyle(fontSize: 13, color: Colors.white70),
  );
}
