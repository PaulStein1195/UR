import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:small_postit/models/post.dart';
import 'package:small_postit/models/user.dart';
import 'package:small_postit/providers/auth_provider.dart';
import 'package:small_postit/services/db_service.dart';
import 'package:timeago/timeago.dart' as timeago;

final postRef = Firestore.instance.collection("Posts");
final userRef = Firestore.instance.collection("Users");

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<AuthProvider>.value(
        value: AuthProvider.instance,
        child: Builder(
          builder: (BuildContext _context) {
            var _auth = Provider.of<AuthProvider>(_context);
            return Container(
              child: StreamBuilder<List<Post>>(
                stream: DBService.instance.getPostsInDB(_auth.user.uid),
                builder: (_context, _snapshot) {
                  var _data = _snapshot.data;
                  print(_snapshot.data);
                  if (!_snapshot.hasData) {
                    return new SpinKitFoldingCube(
                      color: Colors.amber,
                      size: 50.0,
                    );
                  }
                  return Container(
                    child: ListView.builder(
                      itemCount: _data.length,
                      itemBuilder: (_context, _index) {
                        return Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Card(
                            color: Colors.white,
                            child: Container(
                              child: Column(
                                children: [
                                  FutureBuilder(
                                    future:
                                        userRef.document(_auth.user.uid).get(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return SpinKitCircle(
                                          size: 30.0,
                                          color: Colors.amber,
                                        );
                                      }
                                      User user =
                                          User.fromDocument(snapshot.data);
                                      return ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          backgroundImage: NetworkImage(user
                                              .image), //"https://picsum.photos/250?image=11"
                                        ),
                                        title: Text(user.name),
                                        subtitle: _listTileTrailingWidgets(
                                            _data[_index].timestamp),
                                        /*trailing: _listTileTrailingWidgets(
                                            _data[_index].timestamp),*/
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15,
                                        bottom: 8.0,
                                        right: 8.0,
                                        top: 5),
                                    child: Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Flexible(
                                            child: new Text(
                                              _data[_index].title,
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
                                  ),
                                  _data[_index].mediaUrl == null
                                      ? Text("")
                                      : Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 300,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  _data[_index].mediaUrl),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                  ListTile(
                                    title: Text(
                                      _data[_index].description,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    subtitle: Text(_data[_index].solution),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

/*
  Widget buildPostHeader() {
    var _auth = AuthProvider.instance;
    return FutureBuilder(
      future: userRef.document(_auth.user.uid).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SpinKitCircle(
            size: 30.0,
            color: Colors.amber,
          );
        }
        User user = User.fromDocument(snapshot.data);
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage:
                NetworkImage(user.image), //"https://picsum.photos/250?image=11"
          ),
          title: Text(user.name),
          //subtitle: Text(timestamp),
        );
      },
    );
  }
*/
  Widget _listTileTrailingWidgets(Timestamp _lastMessageTimestamp) {
    return Text(
      timeago.format(_lastMessageTimestamp.toDate()),
      style: TextStyle(fontSize: 13),
    );
  }
}
