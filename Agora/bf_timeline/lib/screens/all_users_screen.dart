import 'package:bf_timeline/models/user.dart';
import 'package:bf_timeline/services/database.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class AllUsers extends StatefulWidget {
  @override
  _AllUsersState createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF333333),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Users",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: StreamBuilder<List<User>>(
                stream: Database().getUsersInDB(),
                builder: (_context, _snapshot) {
                  var _usersData = _snapshot.data;
                  /*if (_usersData != null) {
                    _usersData.removeWhere((_contact) => _contact.uid == _currentUser.getCurrentUser.uid);
                  }*/
                  return _snapshot.hasData
                      ? SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 500,
                            child: ListView.builder(
                              itemCount: _usersData.length,
                              itemBuilder:
                                  (BuildContext _context, int _index) {
                                print(_usersData[_index].name);
                                print(_usersData[_index].uid);
                                var _userData = _usersData[_index];
                                return ListTile(
                                  onTap: () {
                                    //Go to profile
                                  },
                                  title: Text(
                                    _userData.name,
                                    style: TextStyle(
                                        fontFamily: "PT-Sans",
                                        color: Colors.white),
                                  ),
                                  leading: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white70, width: 2.0),
                                        borderRadius:
                                        BorderRadius.circular(100),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: _userData.profileImage == null
                                              ? AssetImage(
                                              "")
                                              : NetworkImage(
                                              _userData.profileImage),
                                        ),
                                      ),
                                      child: _userData.profileImage == null ? Center(child: Text(
                                        _userData.name[0], style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700),),): Text(""),

                                  ),
                                  trailing: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        timeago.format(
                                          _userData.accountCreated.toDate(),
                                        ),
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.white70),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ))
                      : CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
