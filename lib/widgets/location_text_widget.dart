import 'package:cs492_weather_app/models/user_location.dart';
import 'package:flutter/material.dart';

class LocationTextWidget extends StatelessWidget {
  const LocationTextWidget({
    super.key,
    required this.location,
  });

  final UserLocation location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 500,
        child: Text("${location.city}, ${location.state}, ${location.zip}",
            style: Theme.of(context).textTheme.headlineSmall),
      ),
    );
  }
}
