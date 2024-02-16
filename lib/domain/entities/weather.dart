class Weather {
  final String name;
  final String country;
  final double lat;
  final double lng;
  final double tempC;
  final double tempF;
  final bool isDay;
  final String conditionText;
  final String conditionIcon;
  final double windMph;
  final double windKph;
  final double feelslikeC;
  final double feelslikeF;

  Weather({
    required this.name,
    required this.country,
    required this.lat,
    required this.lng,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.conditionText,
    required this.conditionIcon,
    required this.windMph,
    required this.windKph,
    required this.feelslikeC,
    required this.feelslikeF,
  });
}
