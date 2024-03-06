import 'package:weather/domain/datasources/weather_datasource.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherDataSource weatherDataSource;

  WeatherRepositoryImpl(this.weatherDataSource);

  @override
  Future<Weather> getWeather({String cityName = 'Barcelona'}) async {
    return await weatherDataSource.getWeather(cityName: cityName);
    //test
  }
}
