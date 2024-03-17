import 'package:cs492_weather_app/models/day.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TemperatureLineChart extends StatelessWidget {
  const TemperatureLineChart({
    super.key,
    required this.day,
  });

  final Day day;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .75,
      height: 280,
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Theme.of(context).colorScheme.inversePrimary, width: 2)
          ),
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((LineBarSpot touchedSpot) {
                  return LineTooltipItem(
                    "${touchedSpot.y.toInt().toString()}°",
                    const TextStyle()
                  );
                }).toList();
              },
            )
          ),
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(
              axisNameWidget: Text("Temperature and Dewpoint",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),),
              axisNameSize: 50,
              sideTitles: SideTitles(showTitles: false)),
            ),
          lineBarsData: [
            LineChartBarData(
              color: Colors.amber,
              spots: day.hourlyTempForecast,
              isCurved: true,
              barWidth: 8,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false),
              dotData: const FlDotData(show: false),
            ),
            LineChartBarData(
              spots: day.hourlyDewpointForecast,
              isCurved: true,
              barWidth: 6,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false),
              dotData: const FlDotData(show: false),
            ),
          ]
        ),
      ),
    );
  }
}