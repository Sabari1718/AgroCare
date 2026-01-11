import 'package:agrocare/weather_model.dart';
import 'package:agrocare/weather_service.dart';
import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? weather;
  bool isLoading = false;
  String? errorMessage;


  String searchedLocation = "";

  Future<void> fetchWeather(String location) async {
    searchedLocation = location;

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await WeatherService().getWeather(location);

    if (result != null) {
      weather = result;
      errorMessage = null;
    } else {
      weather = null;
      errorMessage = "Place not found ❌";
    }

    isLoading = false;
    notifyListeners();
  }
}
