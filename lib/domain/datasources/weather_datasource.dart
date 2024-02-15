import 'package:weather/domain/entities/weather.dart';

abstract class WeatherDataSource {
  Future<Weather> getWeather({String cityName = 'Barcelona'});
}
