import 'package:flutter/material.dart';

import 'package:weather/domain/entities/weather.dart';
import 'package:weather/infrastructure/datasources/weatherapi_datasource_impl.dart';
import 'package:weather/infrastructure/repositories/weather_repository_impl.dart';

class WeatherRepositoryProvider with ChangeNotifier {
  Weather _weather = Weather(
    name: 'Barcelona',
    country: 'ES',
    lat: 41.38,
    lng: 2.18,
    tempC: 0,
    tempF: 0,
    isDay: true,
    conditionText: 'Sunny',
    conditionIcon: '//cdn.weatherapi.com/weather/64x64/day/116.png',
    windMph: 0,
    windKph: 0,
    feelslikeC: 0,
    feelslikeF: 0,
  );

  String _city = 'Barcelona';

  String get city => _city;

  set city(String value) {
    _city = value;
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String _error = '';

  String get error => _error;

  set error(String value) {
    _error = value;
    notifyListeners();
  }

  Weather get weather => _weather;

  set weather(Weather value) {
    _weather = value;
    notifyListeners();
  }

  Future<void> getWeather({String city = 'Barcelona'}) async {
    try {
      final weatherResult = await WeatherRepositoryImpl(WeatherAPIDataSource())
          .getWeather(cityName: city);
      weather = weatherResult;
      notifyListeners();
    } catch (e) {
      error = 'No se encontró la ciudad';
    }
  }
}
