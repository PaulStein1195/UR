import 'package:flutter/material.dart';

PreferredSize header(context,
    {bool isAppTitle = false, String titleText, bool isLeading = false}) {
  return PreferredSize(
    preferredSize: isAppTitle ? Size.fromHeight(55.0) : Size.fromHeight(45.0),
    child: AppBar(
      automaticallyImplyLeading: isLeading ? false : true,
      centerTitle: true,
      title: Text(isAppTitle ? "Plaza" : titleText,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontWeight: isAppTitle ? FontWeight.w400 : FontWeight.w600,
            fontFamily: isAppTitle ? "Pacifico" : "",
            fontSize: isAppTitle ? 36.0 : 20.0,
          ),
          overflow: TextOverflow.ellipsis),
      backgroundColor: Theme.of(context).primaryColor,
    ),
  );
}
