import 'package:bonfire_newbonfire/service/geolocator.dart';

import 'network.dart';

const api_key = "ae9716a57c66bceb271548ab986e15fd";
const openWeatherMap = "http://api.openweathermap.org/geo/1.0/reverse";


class LocationModel {
  Future<dynamic> getLocationData() async {
    //Location class created
    //Calling object and storing data
    Geolocation location = Geolocation();
    await location.getCurrentLocation();
    //Networking class created
    //Calling object
    NetworkHelper networkHelper = NetworkHelper('$openWeatherMap?lat=${location.latitude}&lon=${location.longitude}&limit=5&appid=$api_key&units=metric');
    //Awaiting for incoming data
    var locationData = await networkHelper.getData();

    return locationData;
  }
}
