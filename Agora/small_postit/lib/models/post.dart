import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String postId;
  String title;
  String description;
  String solution;
  String username;
  String image;

  Post({
    this.postId,
    this.title,
    this.description,
    this.solution,
    this.username,
    this.image,
  });

  factory Post.fromFirestore(DocumentSnapshot _snapshot) {
    var _data = _snapshot.data;
    return Post(
      postId: _data["postId"],
      title: _data["title"],
      description: _data["description"],
      solution: _data["solution"],
      username: _data["username"],
      image: _data["image"],

    );
  }
}
