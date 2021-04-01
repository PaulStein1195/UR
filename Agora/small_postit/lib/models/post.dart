import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:small_postit/providers/auth_provider.dart';

class Post extends StatefulWidget {
  final String postId;
  final String ownerId;
  final String title;
  final String description;
  final String solution;
  final Timestamp timestamp;
  final dynamic likes;

  Post(
      {this.postId,
      this.ownerId,
      this.title,
      this.description,
      this.solution,
      this.timestamp,
      this.likes});

  factory Post.fromFirestore(DocumentSnapshot doc) {
    return Post(
      postId: doc['postId'],
      ownerId: doc['ownerId'],
      title: doc['title'],
      description: doc['description'],
      solution: doc['solution'],
      timestamp: doc['timestamp'],
      likes: doc['likes'],
    );
  }

  //TODO: METHOD TO GET LIKE ACCOUNTS

  @override
  _PostState createState() => _PostState(
        postId: this.postId,
        ownerId: this.ownerId,
        title: this.title,
        description: this.description,
        solution: this.solution,
        timestamp: this.timestamp,
        likes: this.likes,
      );
}

class _PostState extends State<Post> {
  final String postId;
  final String ownerId;
  final String title;
  final String description;
  final String solution;
  final Timestamp timestamp;
  Map likes;

  _PostState(
      {this.postId,
      this.ownerId,
      this.title,
      this.description,
      this.solution,
      this.timestamp,
      this.likes});

  postHeader() {
    AuthProvider _auth;
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(
                _auth.user.photoUrl), //"https://picsum.photos/250?image=11"
          ),
          title: Text(_auth.user.displayName),
          //subtitle: Text(timestamp),
          trailing: Container(
            //color: labelColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(13, 7, 13, 7),
              /*child: Text(
                label,
                style: TextStyle(color: Colors.white),
              ),*/
            ),
          ),
        ),
        /*Padding(
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
        ),*/
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(6.0),
        child: Card(
          color: Colors.white,
          child: Container(
            child: Column(
              children: [
                postHeader(),
                //  postInteraction(opinion, percentage, percent),
              ],
            ),
          ),
        ));
  }
}
