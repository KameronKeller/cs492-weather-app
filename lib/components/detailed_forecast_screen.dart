import 'package:cs492_weather_app/models/day.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
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
            SizedBox(
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
                            TextStyle()
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
                      dotData: FlDotData(show: false),
                    ),
                    LineChartBarData(
                      spots: day.hourlyDewpointForecast,
                      isCurved: true,
                      barWidth: 6,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                      dotData: FlDotData(show: false),
                    ),
                  ]
                ),
              ),
            ),
            const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, color: Colors.amber),
                  Text("Temperature"),
                  SizedBox(width: 20),
                  Icon(Icons.circle, color: Colors.blue),
                  Text("Dewpoint"),
                ],
              ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .75,
              height: 280,
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(
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
                          TextStyle()
                        );
                      },
                    )
                  ),
                  maxY: 100,
                  titlesData: FlTitlesData(
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(
                      axisNameWidget: Text("Probability of Precipitation",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                      axisNameSize: 50,
                      sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      axisNameWidget: Text("Hour of Day"),
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() % 5 == 0) {
                            return Text(value.toInt().toString());
                          }
                          return Text('');
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
              ),
              
          ],
        ),
      ),
    );
  }
}