import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/domain/entities/weather.dart';
import 'package:weather/presentation/providers/weather_repository_provider.dart';
import 'package:weather/presentation/screens/widgets/weather_info_card.dart';
import 'package:weather/presentation/utils.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WeatherRepositoryProvider>().getWeather(
        city: context.read<WeatherRepositoryProvider>().weather.name);

    return Consumer<WeatherRepositoryProvider>(
        builder: (context, weatherProvider, _) {
      if (weatherProvider.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (weatherProvider.error.isNotEmpty) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ooops!'),
            Text('Ciudad inválida'),
          ],
        );
      } else {
        Weather weather = weatherProvider.weather;
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(weather.name),
            Text('${weather.tempC.toString()} ºC'),
            Column(
              children: [
                Image.network(
                  'https:${weather.conditionIcon}',
                  width: sizeHeight(context, 15),
                  height: sizeHeight(context, 15),
                  fit: BoxFit.cover,
                ),
                Text(
                  weather.conditionText,
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'Wind', value: '${weather.windKph} km/h'),
                InfoCard(
                    title: 'Feels like', value: '${weather.feelslikeC} ºC'),
              ],
            ),
          ],
        );
      }
    });
  }
}
