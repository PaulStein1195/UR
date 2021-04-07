class User {
  String uid;
  String name;
  String username;
  String email;
  String profilePhoto;
  String location;
  String status;
  int state;

  User({
    this.uid,
    this.name,
    this.username,
    this.email,
    this.profilePhoto,
    this.location,
    this.status,
    this.state,
  });

  Map toMap(User user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['name'] = user.name;
    data['username'] = user.username;
    data['email'] = user.email;
    data['photo'] = user.profilePhoto;
    data['location'] = user.location;
    data['status'] = user.status;
    data['state'] = user.state;
    return data;
  }

  User.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.name = mapData['name'];
    this.username = mapData['username'];
    this.email = mapData['email'];
    this.profilePhoto = mapData['profilePhoto'];
    this.location = mapData['location'];
    this.status = mapData['status'];
    this.state = mapData['state'];
  }
}
