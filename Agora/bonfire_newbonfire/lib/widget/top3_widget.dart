import 'package:bonfire_newbonfire/model/post.dart';
import 'package:bonfire_newbonfire/model/user.dart';
import 'package:bonfire_newbonfire/providers/auth.dart';
import 'package:bonfire_newbonfire/service/db_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

final postRef = Firestore.instance.collection("Posts");
final userRef = Firestore.instance.collection("Users");
AuthProvider _auth;

class   WHWidget extends StatefulWidget {
  @override
  _WHWidgetState createState() => _WHWidgetState();
}

class _WHWidgetState extends State<WHWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<AuthProvider>.value(
          value: AuthProvider.instance,
          child: _buildMainScreen(),
      ),
    );
  }
  Widget _listTileTrailingWidgets(Timestamp _lastMessageTimestamp) {
    return Text(
      timeago.format(_lastMessageTimestamp.toDate()),
      style: TextStyle(fontSize: 13),
    );
  }

  Widget _buildMainScreen() {
    return Builder(
      builder: (BuildContext _context) {
        _auth = Provider.of<AuthProvider>(_context);
        return Container(
          child: StreamBuilder<List<Post>>(
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
              if(_data.length == 0) {
                return Text("Still no data");
              }
              return ListView.builder(
                itemCount: 2,
                itemBuilder: (_context, _index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Card(
                      color: Colors.white,
                      child: Container(
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
                                  left: 15, bottom: 8.0, right: 8.0, top: 5),
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
                              width: MediaQuery.of(_context).size.width,
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
              );
            },
          ),
        );
      },
    );
  }
}



