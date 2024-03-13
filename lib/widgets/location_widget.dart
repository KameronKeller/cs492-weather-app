import 'package:cs492_weather_app/components/location/location.dart';
import 'package:cs492_weather_app/components/weatherScreen/weather_screen.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.widget,
  });

  final WeatherScreen widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Requires a location to begin"),
          ),
          Location(
              setLocation: widget.setLocation,
              getLocation: widget.getLocation),
        ],
      ),
    );
  }
}
