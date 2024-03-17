import 'package:cs492_weather_app/models/weather_forecast.dart';
import 'package:cs492_weather_app/models/weather_icons.dart';
import 'package:flutter/material.dart';

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({
    super.key,
    required this.forecasts,
  });

  final List<WeatherForecast> forecasts;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${forecasts.elementAt(0).temperature}º',
            style: Theme.of(context).textTheme.displayLarge),
          ],
        ),
        Column(
          children: [
            Image(
              image: WeatherIcons.getIconAssetImage(forecasts.elementAt(0).iconUrl),
              height: 50,
              width: 50
            ),
            SizedBox(height: 10,),
            Text(forecasts.elementAt(0).shortForecast,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ))
          ],
        )
      ],
    );
  //   return SizedBox(
  //     width: 500,
  //     height: 60,
  //     child: Center(
  //       child: Text('${forecasts.elementAt(0).temperature}º',
  //           style: Theme.of(context).textTheme.displayLarge),
  //     ),
  //   );
  // }
}
}
