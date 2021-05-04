import 'package:flutter/material.dart';

import '../my_flutter_app_icons.dart';

const kAppbarColor = Color.fromRGBO(41, 39, 40, 200.0);
const kAmberColor = Color(0XFFffb21a);

Widget kAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: kAppbarColor,
    automaticallyImplyLeading: true,
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    ),
  );
}

Widget kFloatingAction(BuildContext context) {
  return FloatingActionButton(
    elevation: 5.0,
    backgroundColor: Theme.of(context).accentColor.withOpacity(0.75),
    child:
        Icon(Icons.add, size: 25.0, color: Colors.white70, //Color(0XFF333333)
            ),
    onPressed: () => Navigator.pushNamed(context, "select_type_post"),
  );
}

Widget kMainAppBar(BuildContext context) {
  return SliverAppBar(
    backgroundColor: kAppbarColor,
    expandedHeight: 40.0,
    elevation: 0.0,
    leading: Icon(
      MyFlutterApp.magnifier,
      size: 25.0,
    ),
    actions: [
      SizedBox(
        width: 10.0,
      ),
      IconButton(
        splashColor: Colors.white70,
        onPressed: () {},
        icon: Icon(
          MyFlutterApp.mail,
          size: 27.0,
        ),
      ),
      SizedBox(
        width: 5.0,
      ),
      IconButton(
        splashColor: Colors.white70,
        onPressed: () {},
        icon: Icon(
          MyFlutterApp.alarm,
          size: 27.0,
        ),
      ),
      SizedBox(
        width: 5.0,
      ),
    ],
  );
}
