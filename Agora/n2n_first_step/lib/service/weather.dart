import 'package:n2n_first_step/service/networking.dart';
import 'location.dart';
const api_key = "ae9716a57c66bceb271548ab986e15fd";
const openWeatherMap = "https://api.openweathermap.org/data/2.5/weather";


class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async  {
    var url = '$openWeatherMap?q=$cityName&appid=$api_key&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    //Await for incoming data
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  Future<dynamic> getLocationWeather() async {
    //Location class created
    //Calling object and storing data
    Location location = Location();
    await location.getCurrentLocation();
    //Networking class created
    //Calling object
    NetworkHelper networkHelper = NetworkHelper('$openWeatherMap?lat=${location.latitude}&lon=${location.longitude}&appid=$api_key&units=metric');
    //Awaiting for incoming data
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
