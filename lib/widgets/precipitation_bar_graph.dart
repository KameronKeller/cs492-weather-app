import 'package:cs492_weather_app/models/day.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PrecipitationBarGraph extends StatelessWidget {
  const PrecipitationBarGraph({
    super.key,
    required this.day,
  });

  final Day day;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .75,
      height: 280,
      child: BarChart(
        BarChartData(
          gridData: const FlGridData(
            show: false,
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Theme.of(context).colorScheme.inversePrimary, width: 2)
          ),
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  rod.toY.toInt().toString() + "%",
                  // rod.y.toInt().toString() + "%",
                  const TextStyle()
                );
              },
            )
          ),
          maxY: 100,
          titlesData: FlTitlesData(
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(
              axisNameWidget: Text("Probability of Precipitation",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),),
              axisNameSize: 50,
              sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              axisNameWidget: const Text("Hour of Day"),
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  if (value.toInt() % 5 == 0) {
                    return Text(value.toInt().toString());
                  }
                  return const Text('');
                },
              )
            
            )
            ),
          alignment: BarChartAlignment.spaceAround,
          groupsSpace: 20,
          barGroups: day.hourlyPrecipForecast.map((spot) {
            return BarChartGroupData(
              x: spot.x.toInt(),
              barRods: [
                BarChartRodData(
                  fromY: 0,
                  toY: spot.y,
                ),
              ],
            );
          }).toList(),
        ),
      ),
      );
  }
}
