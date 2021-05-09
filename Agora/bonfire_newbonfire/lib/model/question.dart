import 'package:bonfire_newbonfire/model/user.dart';
import 'package:bonfire_newbonfire/providers/auth.dart';
import 'package:bonfire_newbonfire/service/db_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'comment.dart';
import '../my_flutter_app_icons.dart';

AuthProvider _auth;

class Question extends StatefulWidget {
  final String ownerId, questionId, name, image, question;
  final Timestamp timestamp;
  final dynamic upgrade;

  Question(
      {this.ownerId,
      this.questionId,
      this.name,
      this.image,
      this.question,
      this.upgrade,
      this.timestamp});

  factory Question.fromFirestore(DocumentSnapshot _snapshot) {
    var _data = _snapshot.data;

    return Question(
      ownerId: _data["ownerId"],
      questionId: _data["questionId"],
      name: _data["name"],
      image: _data["image"],
      question: _data["question"],
      upgrade: _data["upgrade"],
      timestamp: _data["timestamp"],
    );
  }

  double getUpgradesCount(upgrades) {
    //if no likes, return 0
    if (upgrades == null) {
      return 0;
    }
    double count = 0;
    //if the key is explicitly set to true, add a like
    upgrades.values.forEach((val) {
      if (val == true) {
        count += 1;
        upgrades == 0;
      }
    });
    return count;
  }

  @override
  _QuestionState createState() => _QuestionState(
      ownerId: this.ownerId,
      questionId: this.questionId,
      name: this.name,
      image: this.image,
      question: this.question,
      upgrade: this.upgrade,
      timestamp: this.timestamp,
      upgradeCount: getUpgradesCount(this.upgrade)
  );

}

class _QuestionState extends State<Question> {
  final String ownerId, questionId, name, image, question;
  final Timestamp timestamp;
  bool isUpgrade;
  double upgradeCount;
  Map upgrade;

  _QuestionState(
      {this.ownerId,
      this.questionId,
      this.name,
      this.image,
      this.question,
      this.upgrade,
      this.upgradeCount,
      this.timestamp});

  handleUpgradePost() {
    bool _isUpgrade = upgrade[ownerId] == true;
    if (_isUpgrade) {
      Firestore.instance
          .collection("Question")
          .document(ownerId)
          .collection('userQuestion')
          .document(questionId)
          .updateData({'upgrade.$ownerId': false});
      //removeLikeFromActivityFeed();
      setState(() {
        isUpgrade = false;
        upgradeCount -= 1;
        upgrade[ownerId] = false;
      });
    } else if (!_isUpgrade) {
      Firestore.instance
          .collection("Question")
          .document(ownerId)
          .collection('userQuestion')
          .document(questionId)
          .updateData({'upgrade.$ownerId': true});
      //addLikeToActivityFeed();
      setState(() {
        isUpgrade = true;
        upgradeCount += 1;
        upgrade[ownerId] = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ChangeNotifierProvider<AuthProvider>.value(
          value: AuthProvider.instance,
          child: _buildQuestionScreen(),
        )
      ],
    );
  }

  Widget _buildQuestionScreen() {
    //TODO: Make question upgrade => double totalLikes = likeCount;
    //int likesToInt = totalLikes.toInt();

    double totalUpgrades = upgradeCount;

    int upgradesToInt = totalUpgrades.toInt();

    return Builder(
      builder: (BuildContext context) {
        _auth = Provider.of<AuthProvider>(context);
        return StreamBuilder<List<Question>>(
          stream: DBService.instance.getQuestions(_auth.user.uid),
          builder: (context, _snapshot) {
            var _data = _snapshot.data;
            print(_snapshot.data);
            if (!_snapshot.hasData) {
              return SpinKitCircle(
                color: Colors.lightBlueAccent,
                size: 50.0,
              );
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
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChangeNotifierProvider<AuthProvider>.value(
                        value: AuthProvider.instance,
                        child: Builder(
                          builder: (BuildContext context) {
                            _auth = Provider.of<AuthProvider>(context);
                            return StreamBuilder<User>(
                                stream: DBService.instance
                                    .getUserData(_auth.user.uid),
                                builder: (context, _snapshot) {
                                  var _data = _snapshot.data;
                                  print(_snapshot.data);
                                  if (!_snapshot.hasData) {
                                    return SpinKitCircle(
                                      color: Colors.lightBlueAccent,
                                      size: 50.0,
                                    );
                                  }
                                  return ListTile(
                                    leading: CircleAvatar(
                                      radius: 30.0,
                                      backgroundColor: Colors.grey,
                                      backgroundImage: NetworkImage(_data.image),
                                    ),
                                    title: Text(
                                      _data.name,
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
                                      splashColor: Colors.white70,
                                      icon: Icon(
                                        CupertinoIcons.ellipsis,
                                        color: Colors.white70,
                                        size: 25.0,
                                      ),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return SimpleDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20.0))),
                                                backgroundColor:
                                                    Color(0XFF333333),
                                                /*title: Text(
                                                  "You can",
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                  color: Theme.of(context).accentColor),
                                                ),*/
                                                children: [
                                                  SimpleDialogOption(
                                                    onPressed: () {
                                                      //TODO: get link and share
                                                    },
                                                    child: Text(
                                                      "Share",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SimpleDialogOption(
                                                    onPressed: () async {
                                                      /*await DBService.instance
                                                          .deletePostInDB(
                                                          _auth.user.uid,
                                                          postId);
                                                      Navigator.pop(context);*/
                                                    },
                                                    child: Text(
                                                      "Delete",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SimpleDialogOption(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Icon(
                                                      Icons.arrow_back,
                                                      color: Colors.grey.shade100,
                                                      size: 30.0,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
                                        //Display option menu of sharing or Deleting Post
                                      },
                                    ),
                                  );
                                });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: Center(
                            child: Icon(
                          Icons.help_outline,
                          color: Theme.of(context).accentColor,
                          size: 50.0,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: Text(
                          question,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade100),
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        MyFlutterApp.lnr_bubble,
                                        size: 32.0,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        _goMsgPage(context,
                                            questionId: questionId,
                                            ownerId: ownerId,
                                            image: image);
                                      },
                                    ),
                                    StreamBuilder<List<Comment>>(
                                      stream: DBService.instance
                                          .getComments(questionId),
                                      builder: (context, _snapshot) {
                                        var _data = _snapshot.data;
                                        if (!_snapshot.hasData) {
                                          return SpinKitCircle(
                                            color: Colors.lightBlueAccent,
                                            size: 50.0,
                                          );
                                        }
                                        return Text(
                                          _data.length.toString(),
                                          style: TextStyle(
                                              color: Colors.grey.shade200,
                                              fontSize: 20.0),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        MyFlutterApp.campfire,
                                        size: 32.0,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        handleUpgradePost();
                                      },
                                    ),
                                    Text("$upgradesToInt",
                                        style: TextStyle(
                                            color: Colors.grey.shade200,
                                            fontSize: 20.0)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

_goMsgPage(BuildContext context,
    {String questionId, String ownerId, String image}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return Comments(
      questionId: questionId,
      postOwnerId: ownerId,
      postMediaUrl: image,
    );
  }));
}
