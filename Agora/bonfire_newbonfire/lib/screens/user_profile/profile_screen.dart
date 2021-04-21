import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bonfire_newbonfire/model/post.dart';
import 'package:bonfire_newbonfire/model/user.dart';
import 'package:bonfire_newbonfire/providers/auth.dart';
import 'package:bonfire_newbonfire/service/db_service.dart';
import 'package:provider/provider.dart';
import '../../my_flutter_app_icons.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notificationOff = false;
  AuthProvider _auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 55.0,
            title: Text(
              "Me",
              style: TextStyle(color: Colors.grey),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ChangeNotifierProvider<AuthProvider>.value(
                  value: AuthProvider.instance,
                  child: _buildProfileView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileView() {
    return Builder(
      builder: (BuildContext _context) {
        _auth = Provider.of<AuthProvider>(_context);
        return StreamBuilder<User>(
          stream: DBService.instance.getUserData(_auth.user.uid),
          builder: (_context, _snapshot) {
            var _userData = _snapshot.data;
            if (!_snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: SpinKitCircle(
                    color: Colors.lightBlueAccent,
                    size: 50.0,
                  ),
                ),
              );
            } else {
              return Column(
                children: [
                  _userProfileData(
                      _userData.name, _userData.email, _userData.image),
                  _userCollectedData(),
                  Divider(color: Colors.black87),
                  /*GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(MyFlutterApp.history,
                              size: 20.0,
                              color: Colors.black54 //kBottomNavigationBar,
                              ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "My Summary",
                              style: TextStyle(fontSize: 16.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.black),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (notificationOff == false) {
                          notificationOff = true;
                        } else {
                          notificationOff = false;
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                              notificationOff
                                  ? MyFlutterApp.lock
                                  : MyFlutterApp.lock,
                              size: 20.0,
                              color: Colors.black54 //kBottomNavigationBar,
                              ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Notifications",
                              style: TextStyle(fontSize: 16.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100.0),
                            child: Text(
                              notificationOff ? "OFF" : "ON",
                              style: TextStyle(
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.grey.shade700),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),*/
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(MyFlutterApp.lightbulb,
                              size: 20.0,
                              color: Colors.black54 //kBottomNavigationBar,
                              ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Tips",
                              style: TextStyle(fontSize: 16.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(MyFlutterApp.cog,
                              size: 20.0,
                              color: Colors.black54 //kBottomNavigationBar,
                              ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Settings",
                              style: TextStyle(fontSize: 16.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black87,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Container(
                      height: 30,
                      width: 100,
                      child: MaterialButton(
                        onPressed: () {
                          _auth.logoutUser(() {});
                        },
                        color: Colors.blueAccent,
                        child: Text(
                          "LOGOUT",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: "PT-Sans",
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }

  Widget _userProfileData(String _name, String _email, String _image) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => EditProfile(),
        ),
      ),
      child: Card(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(_image),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _name,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(_email),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _userCollectedData() {
    return StreamBuilder<List<Post>>(
        stream: DBService.instance.getPostsInDB(_auth.user.uid),
        builder: (_context, _snapshot) {
          var _userInfoData = _snapshot.data;
          if (!_snapshot.hasData) {
            return SpinKitCircle(
              color: Colors.lightBlueAccent,
              size: 50.0,
            );
          }
          //DEBUGGING: print(_snapshot.data.length);
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //buildCountColumn("clubs", 0),
                buildCountColumn("teams", 0),
                buildCountColumn("posts", _userInfoData.length),
                buildCountColumn("reactions", 0),
                //buildCountColumn("followers", 0),
              ],
            ),
          );
        });
  }

  Column buildCountColumn(String label, int count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count.toString(),
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700),
        ),
        Container(
          margin: EdgeInsets.only(top: 4.0),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
