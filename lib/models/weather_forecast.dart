import 'dart:convert';

import './user_location.dart';
import 'package:http/http.dart' as http;

class WeatherForecast {
  final String name;
  final bool isDaytime;
  final DateTime startTime;
  final DateTime endTime;
  final int temperature;
  final String windSpeed;
  final String windDirection;
  final String shortForecast;
  final String detailedForecast;
  final String iconUrl;
  final double dewPoint;
  final int probabilityOfPrecipitation;

  const WeatherForecast({
    required this.name,
    required this.isDaytime,
    required this.startTime,
    required this.endTime,
    required this.temperature,
    required this.windSpeed,
    required this.windDirection,
    required this.shortForecast,
    required this.detailedForecast,
    required this.iconUrl,
    required this.dewPoint,
    required this.probabilityOfPrecipitation,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    int? probabilityOfPrecipitation = (json['probabilityOfPrecipitation'] as Map<String, dynamic>)['value'] as int?;

    probabilityOfPrecipitation ??= 0;

    return WeatherForecast(
        name: json['name'] as String,
        isDaytime: json['isDaytime'] as bool,
        startTime: DateTime.parse(json['startTime'] as String).toLocal(),
        endTime: DateTime.parse(json['endTime'] as String).toLocal(),
        temperature: json['temperature'] as int,
        windSpeed: json['windSpeed'] as String,
        windDirection: json['windDirection'] as String,
        shortForecast: json['shortForecast'] as String,
        detailedForecast: json['detailedForecast'] as String,
        iconUrl: json['icon'] as String,
        dewPoint: convertCelsiusToFahrenheit((json['dewpoint'] as Map<String, dynamic>)['value'].toDouble()),
        probabilityOfPrecipitation: probabilityOfPrecipitation,
        );
  }
}

double convertCelsiusToFahrenheit(double celsius) {
  return celsius * 9 / 5 + 32;
}

Future<List<WeatherForecast>> getHourlyForecasts(UserLocation location) async {
  return getWeatherForecasts(location, true);
}

Future<List<WeatherForecast>> getTwiceDailyForecasts(
    UserLocation location) async {
  return getWeatherForecasts(location, false);
}

Future<List<WeatherForecast>> getWeatherForecasts(
    UserLocation location, bool hourly) async {
  // casts latitude and longitude to strings with 2 fixed digits
  // for example: 123.456789 -> '123.45'
  String lat = location.latitude.toStringAsFixed(2);
  String long = location.longitude.toStringAsFixed(2);

  // send a request to the weather api to get forecast details
  String forecastUrl = "https://api.weather.gov/points/$lat,$long";
  http.Response forecastResponse = await http.get(Uri.parse(forecastUrl));
  final Map<String, dynamic> forecastJson = jsonDecode(forecastResponse.body);

  // grabs the forecasts url from the json response
  final String currentForecastsUrl = hourly
      ? forecastJson["properties"]["forecastHourly"]
      : forecastJson["properties"]["forecast"];

  // send another request to the API which will return the specifics of the twice-daily forecasts
  http.Response currentForecastsResponse =
      await http.get(Uri.parse(currentForecastsUrl));
  final Map<String, dynamic> currentForecastsJson =
      jsonDecode(currentForecastsResponse.body);

  // gets the list of forecasts from the forecast request
  List<dynamic> forecastJsons = currentForecastsJson["properties"]["periods"];

  // uses json data to create list of WeatherForecast objects
  List<WeatherForecast> forecasts = [];
  for (final forecastJson in forecastJsons) {
    forecasts.add(WeatherForecast.fromJson(forecastJson));
  }

  return forecasts;
}
