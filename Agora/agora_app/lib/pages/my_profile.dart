import 'package:agora_app/pages/security.dart';
import 'package:flutter/material.dart';


import 'home_page.dart';
import 'my_summary.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool notificationOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 55.0,
            title: Text("Me"),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              buildProfileHeader(context)
            ]),
          )
        ],
      ),
    );
  }

  Widget buildProfileHeader(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 7.0,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.grey,
                    backgroundImage:
                    NetworkImage("https://picsum.photos/250?image=3"),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 10, 10),
                        child: Column(
                          children: <Widget>[
                            Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Paul Barrionuevo",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17.0),
                                )),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    "Im a guy that likes nature, feels passion about the future of technology and is happy with some coffee and a conversation",
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //Divider(color: Colors.grey.shade800),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //buildCountColumn("clubs", 0),
                  buildCountColumn("teams", 0),
                  buildCountColumn("posts", 0),
                  buildCountColumn("reactions", 0),
                  //buildCountColumn("followers", 0),
                ],
              ),
            ),
            Divider(color: Colors.black),
            GestureDetector(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MySummary())),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.add, size: 20.0),
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
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyHomePage())),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.person_outline, size: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "My Profile",
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
                padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                        notificationOff
                            ? Icons.lock
                            : Icons.lock,
                        size: 20.0),
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
                            fontSize: 17.5, fontWeight: FontWeight.w800, color: Colors.grey.shade800),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(color: Colors.black),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      size: 20.0,
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
            Divider(color: Colors.black),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Security_Privacy())),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_city,
                      size: 20.0,
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
          ],
        ),
      ),
    );
  }

  Column buildCountColumn(String label, int count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count.toString(),
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.grey.shade800),
        ),
        Container(
          margin: EdgeInsets.only(top: 4.0),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}