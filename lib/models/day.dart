import 'package:fl_chart/fl_chart.dart';

class Day {

  Map daysOfWeek = {
    1: "Monday",
    2: "Tuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday",
    7: "Sunday",
  };

  int high;
  int low;
  final int indexOfWeek;
  final String shortForecast;
  final String iconUrl;
  final List<FlSpot> hourlyTempForecast;
  final List<FlSpot> hourlyDewpointForecast;
  final List<FlSpot> hourlyPrecipForecast;
  // final bool isToday;
  // wx icon
  // final ? weatherIcon;

  Day({
    // set defaults at
    required this.high,
    required this.low,
    required this.indexOfWeek,
    required this.shortForecast,
    required this.iconUrl,
    required this.hourlyTempForecast,
    required this.hourlyDewpointForecast,
    required this.hourlyPrecipForecast,
    // required this.isToday,
    // required this.weatherIcon,
  });

  String get dayOfWeek {
    return daysOfWeek[indexOfWeek];
  }

}