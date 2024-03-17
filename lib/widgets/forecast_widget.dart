import 'package:cs492_weather_app/components/weatherScreen/weather_screen.dart';
import 'package:cs492_weather_app/models/user_location.dart';
import 'package:cs492_weather_app/models/weather_forecast.dart';
import 'package:cs492_weather_app/widgets/description_widget.dart';
import 'package:cs492_weather_app/widgets/location_text_widget.dart';
import 'package:cs492_weather_app/widgets/temperature_widget.dart';
import 'package:flutter/material.dart';

class ForecastWidget extends StatelessWidget {
  final UserLocation location;
  final List<WeatherForecast> forecasts;
  final BuildContext context;

  const ForecastWidget(
      {super.key,
      required this.context,
      required this.location,
      required this.forecasts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LocationTextWidget(location: location),
        TemperatureWidget(forecasts: forecasts),
        // DescriptionWidget(forecasts: forecasts)
      ],
    );
  }
}
