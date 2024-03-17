import 'package:cs492_weather_app/components/detailed_forecast_screen.dart';
import 'package:cs492_weather_app/models/daily_forecasts.dart';
import 'package:cs492_weather_app/models/day.dart';
import 'package:cs492_weather_app/models/user_location.dart';
import 'package:cs492_weather_app/models/weather_icons.dart';
import 'package:flutter/foundation.dart';
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
        },
      ),
    );
  }
}
