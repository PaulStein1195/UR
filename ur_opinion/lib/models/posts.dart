import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: Colors.grey.shade300,
          child: Column(
            children: [
              postHeader(),
              postImage(),
              postInteraction(),
            ],
          ),
        ));
  }

  Widget postHeader() {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage("https://picsum.photos/250?image=11"),
          ),
          title: Text("Username"),
          subtitle: Text("Timestamp"),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 15, bottom: 10.0, right: 8.0, top: 2),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: new Text(
                    "Posts title",
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
      ],
    );
  }

  Widget postImage() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage("https://picsum.photos/250?image=11"),
        ),
      ),
    );
  }

  Widget postInteraction() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 3, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Text(
                "Opinion: ",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  color: Colors.grey.shade800,
                ),
              ),
              Text(
                "User giving an opinion about their post",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
