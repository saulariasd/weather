import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:weather/config/router/app_router.dart';
import 'package:weather/config/theme/app_theme.dart';
import 'package:weather/presentation/providers/weather_repository_provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => WeatherRepositoryProvider())
        ],
        child: MaterialApp.router(
          routerConfig: appRouter,
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          title: 'Weather',
        ));
  }
}
