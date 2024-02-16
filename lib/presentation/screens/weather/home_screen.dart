import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/presentation/providers/weather_repository_provider.dart';
import 'package:weather/presentation/screens/widgets/weather_form.dart';
import 'package:weather/presentation/screens/widgets/weather_home.dart';
import 'package:weather/presentation/utils.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: sizeWidth(context, 100),
        height: sizeHeight(context, 100),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: context.watch<WeatherRepositoryProvider>().weather.isDay
                  ? getDayColors()
                  : getNightColors()),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: sizeHeight(context, 80),
              width: sizeWidth(context, 100),
              child: const WeatherHome(),
            ),
            Positioned(
              bottom: sizeHeight(context, 10),
              left: sizeWidth(context, 20),
              child: SizedBox(
                width: sizeWidth(context, 60),
                height: sizeHeight(context, 10),
                child: const WeatherForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
