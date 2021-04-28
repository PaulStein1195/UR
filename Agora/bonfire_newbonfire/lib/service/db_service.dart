import 'package:bonfire_newbonfire/model/comment.dart';
import 'package:bonfire_newbonfire/model/question.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bonfire_newbonfire/model/user.dart';
import 'package:bonfire_newbonfire/model/post.dart';
import 'package:uuid/uuid.dart';

class DBService {
  static DBService instance = DBService();
  Firestore _db;

  DBService() {
    _db = Firestore.instance;
  }

  String _userCollection = "Users";
  String _postsCollection = "Posts";
  String _commentsCollection = "Message";
  String _questionCollection = "Question";
  String _surveyCollection = "Survey";

  Future<void> createPostInDB(
    String _uid,
    String _postId,
    String _image,
    String _title,
    String _description,
    String _solution,
    String _mediaUrl,
  ) async {
    try {
      return await _db
          .collection(_postsCollection)
          .document(_uid)
          .collection("userPosts")
          .document(_postId)
          .setData({
        "postId": _postId,
        "ownerId": _uid,
        "image": _image,
        "title": _title,
        "description": _description,
        "solution": _solution,
        "mediaUrl": _mediaUrl,
        "timestamp": Timestamp.now(),
        "likes": {},
        "dislikes": {},
        "upgrades": {},
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deletePostInDB(String _uid, _postId) async {
    try {
      return await _db
          .collection(_postsCollection)
          .document(_uid)
          .collection("userPosts")
          .document(_postId)
          .get()
          .then(
        (doc) {
          if (doc.exists) {
            doc.reference.delete();
          }
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> createUserInDB(String _uid, String _name, String _email,
      String _image, String _bio) async {
    try {
      return await _db.collection(_userCollection).document(_uid).setData({
        "name": _name,
        "email": _email,
        "image": _image,
        "bio": _bio,
        "lastSeen": DateTime.now().toUtc(),
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> addComment(String _uid, String _comntId, String _postId,
      String _name, String _comment, String postMediaUrl) async {
    try {
      return await _db
          .collection(_commentsCollection)
          .document(_postId)
          .collection("postMsg")
          .document(_comntId)
          .setData({
        "postId": _postId,
        "ownerId": _uid,
        "name": _name,
        "mediaUrl": postMediaUrl,
        "comment": _comment,
        "timestamp": Timestamp.now(),
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> createQuestion(String _uid, String _name, String _image,
      String _question, String _questionId) async {
    try {
      return await _db
          .collection(_questionCollection)
          .document(_uid)
          .collection("userQuestion")
          .document(_questionId)
          .setData({
        "ownerId": _uid,
        "questionId": _questionId,
        "name": _name,
        "image": _image,
        "question": _question,
        "timestamp": Timestamp.now(),
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<Question>> getQuestions(String _userID) {
    var _ref = _db
        .collection(_questionCollection)
        .document(_userID)
        .collection("userQuestion")
        .orderBy("timestamp", descending: true /*Future: CATEGORY?*/);
    return _ref.snapshots().map((_snapshot) {
      return _snapshot.documents.map((_doc) {
        return Question.fromFirestore(_doc);
      }).toList();
    });
  }

  Stream<User> getUserData(String _userID) {
    var _ref = _db.collection(_userCollection).document(_userID);
    return _ref.get().asStream().map((_snapshot) {
      return User.fromDocument(_snapshot);
    });
  }

  Stream<List<Post>> getPostsInDB(String _userID) {
    var _ref = _db
        .collection(_postsCollection)
        .document(_userID)
        .collection("userPosts")
        .orderBy("timestamp", descending: true);
    return _ref.snapshots().map((_snapshot) {
      return _snapshot.documents.map((_doc) {
        return Post.fromFirestore(_doc);
      }).toList();
    });
  }

  Stream<List<Comment>> getComments(String _postID) {
    var _ref = _db
        .collection(_commentsCollection)
        .document(_postID)
        .collection("postMsg")
        .orderBy("timestamp", descending: false);
    return _ref.snapshots().map((_snapshot) {
      return _snapshot.documents.map((_doc) {
        return Comment.fromFirestore(_doc);
      }).toList();
    });
  }
}
