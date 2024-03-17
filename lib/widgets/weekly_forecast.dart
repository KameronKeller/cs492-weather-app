import 'package:cs492_weather_app/models/daily_forecasts.dart';
import 'package:cs492_weather_app/models/day.dart';
import 'package:cs492_weather_app/models/user_location.dart';
import 'package:cs492_weather_app/widgets/daily_weather_forecast_card.dart';
import 'package:flutter/material.dart';

class WeeklyForecast extends StatelessWidget {
  const WeeklyForecast({super.key, required this.dailyForecasts, required this.location});

  final DailyForecasts dailyForecasts;
  final UserLocation? location;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: dailyForecasts.forecastDays.length,
        itemBuilder: (context, index) {
          Day currentDay = dailyForecasts.forecastDays[index];
          return DailyWeatherForecastCard(currentDay: currentDay, location: location);
        },
      ),
    );
  }
}
