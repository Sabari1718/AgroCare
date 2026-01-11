import 'dart:convert';
import 'package:agrocare/constants.dart';
import 'package:agrocare/weather_model.dart';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';
import '../utils/constants.dart'; // contains apiKey

class WeatherService {


  Future<Map<String, double>?> _getLatLon(String location) async {
    final geoUrl = Uri.parse(
      "http://api.openweathermap.org/geo/1.0/direct?q=${Uri.encodeComponent(location)}&limit=1&appid=$apiKey",
    );

    final geoResponse = await http.get(geoUrl);

    if (geoResponse.statusCode == 200) {
      final geoData = jsonDecode(geoResponse.body);
      if (geoData.isEmpty) return null;

      return {
        "lat": geoData[0]['lat'],
        "lon": geoData[0]['lon'],
      };
    }
    return null;
  }


  Future<Weather?> getWeather(String location) async {
    try {
      final latLon = await _getLatLon(location);
      if (latLon == null) return null;

      final weatherUrl = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${latLon['lat']}&lon=${latLon['lon']}&appid=$apiKey&units=metric",
      );

      final response = await http.get(weatherUrl);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Weather.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
