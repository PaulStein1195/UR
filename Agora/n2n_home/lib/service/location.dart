import 'package:geolocator/geolocator.dart';

class MyLocation {
  double lat;
  double long;

  Future<void> getLocation () async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
      lat = position.latitude;
      long = position.longitude;
    } catch(error) {
      print(error);
    }
  }
}