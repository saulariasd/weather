import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String apiKey = dotenv.env['WEATHERAPI_KEY'] ?? 'key not found';
}
