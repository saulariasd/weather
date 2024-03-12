import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:weather/config/constants/environment.dart';
import 'package:weather/domain/datasources/weather_datasource.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/infrastructure/mappers/WeatherMapper.dart';
import 'package:weather/infrastructure/models/weatherapi/weatherapi_response.dart';

class WeatherAPIDataSource extends WeatherDataSource {
  @override
  Future<Weather> getWeather({String cityName = 'Barcelona'}) async {
    var url = Uri.https('api.weatherapi.com', '/v1/current.json', {
      'key': Environment.apiKey,
      'aqi': 'no',
      'q': cityName,
    });
    try {
      final response = await http.get(url);
      final WeatherApiResponse weatherApiResponse =
          WeatherApiResponse.fromJson(json.decode(response.body));
      final Weather weather =
          WeatherMapper.fromWeatherApiResponseToEntity(weatherApiResponse);
      return weather;
    } catch (e) {
      throw Exception({});
    }
  }

  @override
  Future<Weather> getWeather2({String cityName = 'Barcelona'}) {
    throw UnimplementedError();
  }
}
