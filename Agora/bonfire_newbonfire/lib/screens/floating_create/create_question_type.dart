import 'package:bonfire_newbonfire/my_flutter_app_icons.dart';
import 'package:bonfire_newbonfire/screens/floating_create/create_question.dart';
import 'package:flutter/material.dart';

class QuestionTypeScreen extends StatelessWidget {
  Widget buildBonfireList(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF333333),

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AskScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /*Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                kAmberColor,
                                Colors.red,
                              ],
                            ),
                            image: DecorationImage(
                              fit: BoxFit.scaleDown,
                              image:
                                  AssetImage("assets/images/flame_icon1.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 35.0,
                        ),*/
                        Text(
                          "Software",
                          style:
                          TextStyle(color: Colors.white70, fontSize: 23.0),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(color: Colors.white70,),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AskScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /*Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                kAmberColor,
                                Colors.red,
                              ],
                            ),
                            image: DecorationImage(
                              fit: BoxFit.scaleDown,
                              image: AssetImage("assets/images/flame_icon1.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 35.0,
                        ),*/
                        Text(
                          "Hardware",
                          style: TextStyle(color: Colors.white70, fontSize: 23.0),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(color: Colors.white70,),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AskScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /*Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                kAmberColor,
                                Colors.red,
                              ],
                            ),
                            image: DecorationImage(
                              fit: BoxFit.scaleDown,
                              image: AssetImage("assets/images/flame_icon1.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 35.0,
                        ),*/
                        Text(
                          "Drones",
                          style: TextStyle(color: Colors.white70, fontSize: 23.0),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(color: Colors.white70,),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AskScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /*Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                kAmberColor,
                                Colors.red,
                              ],
                            ),
                            image: DecorationImage(
                              fit: BoxFit.scaleDown,
                              image: AssetImage("assets/images/flame_icon1.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 35.0,
                        ),*/
                        Text(
                          "Mechanics",
                          style: TextStyle(color: Colors.white70, fontSize: 23.0),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(color: Colors.white70,),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AskScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /*Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                kAmberColor,
                                Colors.red,
                              ],
                            ),
                            image: DecorationImage(
                              fit: BoxFit.scaleDown,
                              image: AssetImage("assets/images/flame_icon1.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 35.0,
                        ),*/
                        Text(
                          "Software",
                          style: TextStyle(color: Colors.white70, fontSize: 23.0),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(color: Colors.white70,),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AskScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /*Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                kAmberColor,
                                Colors.red,
                              ],
                            ),
                            image: DecorationImage(
                              fit: BoxFit.scaleDown,
                              image: AssetImage("assets/images/flame_icon1.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 35.0,
                        ),*/
                        Text(
                          "Software",
                          style: TextStyle(color: Colors.white70, fontSize: 23.0),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(color: Colors.white70,),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AskScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /*Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                kAmberColor,
                                Colors.red,
                              ],
                            ),
                            image: DecorationImage(
                              fit: BoxFit.scaleDown,
                              image: AssetImage("assets/images/flame_icon1.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 35.0,
                        ),*/
                        Text(
                          "Software",
                          style: TextStyle(color: Colors.white70, fontSize: 23.0),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(41, 39, 40, 200.0),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.black87,
                          context: context,
                          builder: buildBonfireList);
                    },
                    child: Container(
                      height: 111.0,
                      width: 111.0,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Theme.of(context).accentColor,
                                Colors.orange
                              ]
                          ),
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(100.0)
                      ),
                      child: Icon(Icons.help_outline, size: 70.0, color: Colors.white70,),
                    ),
                  ),
                  Text(
                    "QUESTION",
                    style: TextStyle(color: Colors.white70, fontSize: 25.0),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "survey"),
                    child: Container(
                      height: 111.0,
                      width: 111.0,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Theme.of(context).accentColor,
                                Colors.orange
                              ]
                          ),
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(100.0)
                      ),
                      child: Icon(MyFlutterApp.bullhorn, size: 65.0, color: Colors.white70,),
                    ),
                  ),
                  Text(
                    "SURVEY",
                    style: TextStyle(color: Colors.white70, fontSize: 25.0),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
