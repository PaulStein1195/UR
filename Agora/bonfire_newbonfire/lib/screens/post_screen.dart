import 'package:bonfire_newbonfire/model/post.dart';
import 'package:bonfire_newbonfire/service/db_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PostScreen extends StatelessWidget {
  final String userId;
  final String postId;


  PostScreen({this.userId, this.postId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firestore.instance.document(userId).collection("userPosts").document(postId).get(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) {
          return SpinKitCircle(
            color: Theme.of(context).accentColor,
          );
        }
        Post post = Post.fromFirestore(snapshot.data);
        return Center(
          child: Scaffold(
            appBar: AppBar(
              title: Text(post.title),
            ),
            body: ListView(
              children: [
                Container(
                  child: post,
                )
              ],
            ),
          ),
        );
      },

    );
  }
}
