import 'package:cs492_weather_app/models/day.dart';
import 'package:cs492_weather_app/models/user_location.dart';
import 'package:cs492_weather_app/models/weather_icons.dart';
import 'package:cs492_weather_app/screens/detailed_forecast_screen.dart';
import 'package:flutter/material.dart';

class DailyWeatherForecastCard extends StatelessWidget {
  const DailyWeatherForecastCard({
    super.key,
    required this.currentDay,
    required this.location,
  });

  final Day currentDay;
  final UserLocation? location;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).focusColor,
      // surfaceTintColor: Colors.amber,
      child: ListTile(
        onTap: () {
          Navigator.push(context, 
            MaterialPageRoute(builder: 
              (context) => DetailedForecastScreen(day: currentDay, locationText: location != null ? Text("${location!.city}, ${location!.state}") : Text("Detailed Weather"))
            )
          );
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              child: Column(
                children: [
                  Text(currentDay.dayOfWeek,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 100,
              child: Column(
                children: [
                  Image(
                    image: WeatherIcons.getIconAssetImage(currentDay.iconUrl),
                    height: 50,
                    width: 50
                  ),
                ],
              ),
            ),
            Container(
              width: 100,
              child: Column(
                children: [
                  Text('H: ${currentDay.high}°, L: ${currentDay.low}°',
                  style: TextStyle(
                    fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
        // title: Text(dailyForecasts.forecastDays[index].iconUrl),
      ),
    );
  }
}
