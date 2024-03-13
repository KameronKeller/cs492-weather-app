import 'dart:collection';

import 'package:cs492_weather_app/models/day.dart';
import 'package:cs492_weather_app/models/weather_forecast.dart';
import 'package:fl_chart/fl_chart.dart';


class DailyForecasts {

  Map daysOfWeek = {
    1: "Sunday",
    2: "Monday",
    3: "Tuesday",
    4: "Wednesday",
    5: "Thursday",
    6: "Friday",
    7: "Saturday"
  };
  
  Map<int, Day> _forecastDays = {};
  // final List<WeatherForecast> forecasts;

  DailyForecasts();

  factory DailyForecasts.fromWeatherForecasts(List<WeatherForecast> forecasts, List<WeatherForecast> hourlyForecasts) {
    final DailyForecasts dailyForecasts = DailyForecasts();
    final Map<int, Day> forecastDays = {};
    for (final forecast in forecasts) {
      int indexOfWeek = forecast.startTime.weekday;

      int year = forecast.startTime.year;
      int month = forecast.startTime.month;
      int day = forecast.startTime.day;

      // this key = year + month + day to ensure that
      // the key is always increasing
      // rather than the day of the week which resets each Sunday
      int increasingKey = year + month+ day;

      if (forecastDays.containsKey(increasingKey)) {
        if (forecast.temperature > forecastDays[increasingKey]!.high)
          {forecastDays[increasingKey]!.high = forecast.temperature;}
          
        if (forecast.temperature < forecastDays[increasingKey]!.low)
          {forecastDays[increasingKey]!.low = forecast.temperature;}
      } else {
        List<FlSpot> hourlyTempForecast = generateHourlyTempData(indexOfWeek, hourlyForecasts);
        // List<FlSpot> hourlyHumdityForecast = generateHourlyHumidityData(indexOfWeek, hourlyForecasts);
        // List<FlSpot> hourlyPrecipForecast = generateHourlyPrecipData(indexOfWeek, hourlyForecasts);
        forecastDays[increasingKey] = Day(
          high: forecast.temperature,
          low: forecast.temperature,
          indexOfWeek: indexOfWeek,
          shortForecast: forecast.shortForecast,
          iconUrl: forecast.iconUrl,
          hourlyTempForecast: hourlyTempForecast
        );
      }

    }
    dailyForecasts._forecastDays = forecastDays;
    return dailyForecasts;
  }

  List<int> get sortedKeys {
    return _forecastDays.keys.toList()..sort();
  }

  List<Day> get forecastDays {
    List<Day> days = [];
    var sortedMap = SplayTreeMap.from(_forecastDays);
    sortedMap.forEach((key, value) {
     days.add(value);
    });
    // return sortedMap.entries.toList();
    return days;
  }

  List<FlSpot> generateHourlyTempData(int dayOfWeek, List<WeatherForecast> hourlyForecasts) {
    List<FlSpot> tempData = [];
    for (final forecast in hourlyForecasts) {
      if (forecast.startTime.weekday == dayOfWeek) {
        tempData.add(FlSpot(forecast.startTime.hour as double, forecast.temperature as double));
      }
    }
    return tempData;
  }

}
