import 'package:cs492_weather_app/models/day.dart';
import 'package:cs492_weather_app/widgets/line_chart_key.dart';
import 'package:cs492_weather_app/widgets/precipitation_bar_graph.dart';
import 'package:cs492_weather_app/widgets/temperature_line_chart.dart';
import 'package:flutter/material.dart';

class DetailedForecastScreen extends StatelessWidget {
  const DetailedForecastScreen({super.key, required this.day, required this.locationText});

  final Day day;
  final Text locationText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: locationText,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            TemperatureLineChart(day: day),
            const LineChartKey(),
            const SizedBox(
              height: 20,
            ),
            PrecipitationBarGraph(day: day),
              
          ],
        ),
      ),
    );
  }
}
