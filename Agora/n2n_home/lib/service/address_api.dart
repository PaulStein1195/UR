import 'location.dart';
import 'network.dart';

const api_key = "AIzaSyAiKNLO6-g4fZtbLOq2rrsI2IiZNQczNuI";
const api_url = "https://maps.googleapis.com/maps/api/geocode/json";

class AddressModel {
  Future<dynamic> getCityLocation() async {

    MyLocation myLocation = MyLocation();
    myLocation.getLocation();

    NetworkHelper networkHelper = NetworkHelper('https://api.tomtom.com/search/2/reverseGeocode/37.8328%2C-122.27669.json?returnSpeedLimit=true&returnRoadUse=true&allowFreeformNewLine=true&returnMatchType=true&view=Unified&key=qwjwRjfKPBoZwpcFt7bEVxxHzJRut2fO');

    var addressData = await networkHelper.getData();

    return print(addressData);

  }
}