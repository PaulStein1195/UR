import 'package:bonfire_newbonfire/const/color_pallete.dart';
import 'package:bonfire_newbonfire/model/user.dart';
import 'package:bonfire_newbonfire/providers/auth.dart';
import 'package:bonfire_newbonfire/service/db_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

AuthProvider _auth;

class Comments extends StatefulWidget {
  final String postId;
  final String postOwnerId;
  final String postMediaUrl;
  final String questionId;

  Comments({this.postId, this.postOwnerId, this.postMediaUrl, this.questionId});

  @override
  CommentsState createState() => CommentsState(
        postId: this.postId,
        postOwnerId: this.postOwnerId,
        postMediaUrl: this.postMediaUrl,
      );
}

class CommentsState extends State<Comments> {
  TextEditingController commentController = TextEditingController();
  final String postId;
  final String postOwnerId;
  final String postMediaUrl;

  CommentsState({this.postId, this.postOwnerId, this.postMediaUrl});

  buildComments() {
    return StreamBuilder(
      stream: Firestore.instance
          .collection("Message")
          .document(postId)
          .collection("postMsg")
          .orderBy("timestamp", descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SpinKitCircle();
        }
        List<Comment> comments = [];
        snapshot.data.documents.forEach((doc) {
          comments.add(Comment.fromFirestore(doc));
        });
        return ListView(
          children: comments,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppbar(context),
      body: Column(
        children: [
          Expanded(
            child: buildComments(),
          ),
          Divider(),
          ChangeNotifierProvider<AuthProvider>.value(
            value: AuthProvider.instance,
            child: Builder(
              builder: (BuildContext context) {
                _auth = Provider.of<AuthProvider>(context);
                return StreamBuilder<User>(
                  stream: DBService.instance.getUserData(_auth.user.uid),
                  builder: (context, _snapshot) {
                    var _data = _snapshot.data;
                    if (!_snapshot.hasData) {
                      return SpinKitCircle(
                        color: Colors.lightBlueAccent,
                        size: 50.0,
                      );
                    }
                    return ListTile(
                      title: TextFormField(
                        style: TextStyle(color: Colors.white70),
                        controller: commentController,
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(8.0),
                              ),
                              borderSide: new BorderSide(
                                color: Theme.of(context).accentColor,
                                width: 1.0,
                              ),
                            ),
                            labelText: "Write your comment...",
                            labelStyle: TextStyle(
                                color: Theme.of(context).accentColor)),
                      ),
                      trailing: RaisedButton(
                          onPressed: () {
                            Firestore.instance
                                .collection("Message")
                                .document(postId)
                                .collection("postMsg")
                                .add({
                              "username": _data.name,
                              "comment": commentController.text,
                              "timestamp": Timestamp.now(),
                              "avatarUrl": _data.image,
                              "userId": _data.id,
                            });
                            commentController.clear();
                          },
                          color: Theme.of(context).accentColor,
                          child: FaIcon(
                            FontAwesomeIcons.paperPlane,
                            size: 25.0,
                            color: Colors.grey.shade50,
                          )),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class Comment extends StatelessWidget {
  final String username;
  final String userId;
  final String avatarUrl;
  final String comment;
  final Timestamp timestamp;

  Comment(
      {this.username,
      this.userId,
      this.avatarUrl,
      this.comment,
      this.timestamp});

  factory Comment.fromFirestore(DocumentSnapshot doc) {
    return Comment(
      username: doc["username"],
      userId: doc["userId"],
      avatarUrl: doc["avatarUrl"],
      comment: doc["comment"],
      timestamp: doc["timestamp"],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Material(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
        color: Color(0XFF333333),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
          ),
          title: Text(
            comment,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 17.0),
          ),
          subtitle: Text(
            timeago.format(timestamp.toDate()),
            style: TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }
}


/*
class Comments extends StatefulWidget {
  final String postId;
  final String ownerId;
  final String name;
  final String mediaUrl;
  final String comment;
  final Timestamp timestamp;

  Comments(
      {this.postId,
      this.ownerId,
      this.name,
      this.mediaUrl,
      this.comment,
      this.timestamp});

  factory Comments.fromFirestore(DocumentSnapshot _snapshot) {
    var _data = _snapshot.data;

    return Comments(
      postId: _data['postId'],
      ownerId: _data['ownerId'],
      name: _data['name'],
      mediaUrl: _data['mediaUrl'],
      comment: _data['comment'],
      timestamp: _data["timestamp"],
    );
  }

  @override
  _CommentsState createState() => _CommentsState(
      postId: this.postId,
      ownerId: this.ownerId,
      name: this.name,
      mediaUrl: this.mediaUrl,
      comment: this.comment,
      timestamp: this.timestamp);
}

class _CommentsState extends State<Comments> {
  final String postId;
  final String ownerId;
  final String name;
  final String mediaUrl;
  final String comment;
  final Timestamp timestamp;

  _CommentsState(
      {this.postId,
      this.ownerId,
      this.name,
      this.mediaUrl,
      this.comment,
      this.timestamp});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(mediaUrl),
          ),
        ),
      ),
      title: Text(
        "comment",
        style: TextStyle(color: Colors.white70, fontSize: 18.0, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(timeago.format(
    timestamp.toDate())),
    );
  }
}
*/
