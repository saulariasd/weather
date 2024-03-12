import 'package:weather/domain/entities/weather.dart';

abstract class WeatherDataSource {
  Future<Weather> getWeather({String cityName = 'Barcelona'});
  Future<Weather> getWeather2({String cityName = 'Barcelona'});
}
