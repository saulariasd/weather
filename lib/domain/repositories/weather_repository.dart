import 'package:weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather({String cityName = 'Barcelona'});
}
