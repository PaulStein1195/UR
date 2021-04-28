import 'package:bonfire_newbonfire/model/comment.dart';
import 'package:bonfire_newbonfire/providers/auth.dart';
import 'package:bonfire_newbonfire/service/db_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
/*
AuthProvider _auth;

class Display_Comments extends StatefulWidget {

  final String postId, mediaUrl;

  Display_Comments({this.postId, this.mediaUrl});

  @override
  _Display_CommentsState createState() =>
      _Display_CommentsState(
        postId: this.postId,
        mediaUrl: this.mediaUrl,
      );
}

class _Display_CommentsState extends State<Display_Comments> {
  final String postId, mediaUrl;

  _Display_CommentsState({this.postId, this.mediaUrl});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          ChangeNotifierProvider<AuthProvider>.value(
            value: AuthProvider.instance,
            child: Builder(
              builder: (BuildContext context) {
                _auth = Provider.of<AuthProvider>(context);
                return StreamBuilder<List<Comments>>(
                  stream: DBService.instance.getComments(postId),
                  builder: (context, _snapshot) {
                    var _data = _snapshot.data;
                    print(_data.length);
                    if (!_snapshot.hasData) {
                      return SpinKitCircle(
                        color: Colors.lightBlueAccent,
                        size: 50.0,
                      );
                    }
                    if (_data.length == 0) {
                      return Center(
                        child: Text(
                          "NO DATA YET!",
                          style: TextStyle(
                              fontSize: 25.0, color: Colors.white70),
                        ),
                      );
                    }
                    return Expanded(
                      child: ListView(
                          children: _data.toList(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Divider(),
          ListTile(
            title: TextFormField(
              controller: commentController,
              decoration: InputDecoration(labelText: "Write your comment..."),
            ),
            trailing: RaisedButton(
                onPressed: () {
                  //Add new comment
                },
                color: Colors.white70,
                child: FaIcon(FontAwesomeIcons.paperPlane, size: 25.0,
                  color: Colors.grey.shade50,)
            ),
          ),
        ],
      ),
    );
  }
}

*/