import 'package:weather/domain/entities/weather.dart';
import 'package:weather/infrastructure/models/weatherapi/weatherapi_response.dart';

class WeatherMapper {
  static Weather fromWeatherApiResponseToEntity(
          WeatherApiResponse weatherApi) =>
      Weather(
        name: weatherApi.location.name,
        country: weatherApi.location.country,
        lat: weatherApi.location.lat,
        lng: weatherApi.location.lon,
        tempC: weatherApi.current.tempC,
        tempF: weatherApi.current.tempF,
        isDay: weatherApi.current.isDay == 1,
        conditionText: weatherApi.current.condition.text,
        conditionIcon: weatherApi.current.condition.icon,
        windMph: weatherApi.current.windMph,
        windKph: weatherApi.current.windKph,
        feelslikeC: weatherApi.current.feelslikeC,
        feelslikeF: weatherApi.current.feelslikeF,
      );
}
