import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

  factory Post.fromDocument(DocumentSnapshot doc) {
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

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
