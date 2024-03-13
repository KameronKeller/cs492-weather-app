import 'package:cs492_weather_app/components/detailed_forecast_screen.dart';
import 'package:cs492_weather_app/models/daily_forecasts.dart';
import 'package:cs492_weather_app/models/day.dart';
import 'package:cs492_weather_app/models/weather_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeeklyForecast extends StatelessWidget {
  const WeeklyForecast({super.key, required this.dailyForecasts});

  final DailyForecasts dailyForecasts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: dailyForecasts.forecastDays.length,
        itemBuilder: (context, index) {
          Day currentDay = dailyForecasts.forecastDays[index];
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(context, 
                  MaterialPageRoute(builder: 
                    (context) => DetailedForecastScreen()
                  )
                );
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(currentDay.dayOfWeek),
                  Image(
                    image: WeatherIcons.getIconAssetImage(currentDay.iconUrl),
                    height: 50,
                    width: 50
                  ),
                  Text('H: ${currentDay.high}, L: ${currentDay.low}'),
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
