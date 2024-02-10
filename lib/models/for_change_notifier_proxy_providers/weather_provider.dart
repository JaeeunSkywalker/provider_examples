import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider_sample/consts/config_keywords.dart';
import 'package:dio/dio.dart';
import 'package:provider_sample/services/convertKelvinToCelsius.dart';

class WeatherProvider with ChangeNotifier {
  final String _apiKey = open_weather_map_api_key;
  dynamic _weatherData;
  double _degrees = 0.0;

  dynamic get weatherData => _weatherData;

  double get degrees => _degrees;

  Future<dynamic> fetchWeather(Position position) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$_apiKey');
    var dio = Dio();

    try {
      final response = await dio.get(url.toString());
      if (response.statusCode == 200) {
        _weatherData = response.data;
        _degrees = convertKelvinToCelsius(_weatherData['main']['temp']);
        notifyListeners();
      } else {
        throw 'Failed to load weather data';
      }
    } catch (e) {
      print(e);
      throw 'Failed to load weather data';
    }
  }
}
