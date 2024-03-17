import 'package:flutter/material.dart';

class WeatherIcons {

  static final Map<String, String> _weatherIconMap = {
    'skc': 'assets/weather_icons/sun.png',
    'few': 'assets/weather_icons/partly_cloudy.png',
    'sct': 'assets/weather_icons/partly_cloudy.png',
    'bkn': 'assets/weather_icons/cloudy.png',
    'ovc': 'assets/weather_icons/cloudy.png',
    'wind_skc': 'assets/weather_icons/sun.png',
    'wind_few': 'assets/weather_icons/partly_cloudy.png',
    'wind_sct': 'assets/weather_icons/partly_cloudy.png',
    'wind_bkn': 'assets/weather_icons/cloudy.png',
    'wind_ovc': 'assets/weather_icons/cloudy.png',
    'snow': 'assets/weather_icons/snow.png',
    'rain_snow': 'assets/weather_icons/snow.png',
    'rain_sleet': 'assets/weather_icons/rain.png',
    'snow_sleet': 'assets/weather_icons/snow.png',
    'fzra': 'assets/weather_icons/rain.png',
    'rain_fzra': 'assets/weather_icons/',
    'snow_fzra': 'assets/weather_icons/',
    'sleet': 'assets/weather_icons/rain.png',
    'rain': 'assets/weather_icons/rain.png',
    'rain_showers': 'assets/weather_icons/rain_showers.png',
    'rain_showers_hi': 'assets/weather_icons/rain_showers.png',
    'tsra': 'assets/weather_icons/storm.png',
    'tsra_sct': 'assets/weather_icons/storm.png',
    'tsra_hi': 'assets/weather_icons/storm.png',
    'tornado': 'assets/weather_icons/storm.png',
    'hurricane': 'assets/weather_icons/storm.png',
    'tropical_storm': 'assets/weather_icons/storm.png',
    'dust': 'assets/weather_icons/fog.png',
    'smoke': 'assets/weather_icons/fog.png',
    'haze': 'assets/weather_icons/fog.png',
    'hot': 'assets/weather_icons/sun.png',
    'cold': 'assets/weather_icons/sun.png',
    'blizzard': 'assets/weather_icons/snow.png',
    'fog': 'assets/weather_icons/fog.png',
  };

  

  static AssetImage getIconAssetImage(String url) {
    String assetPath = "";
    String weatherConditionKey = extractWeatherConditionKey(url);
    if (_weatherIconMap.containsKey(weatherConditionKey)) {
      assetPath = _weatherIconMap[weatherConditionKey]!;
    } else {
      assetPath = 'assets/weather_icons/partly_cloudy.png';
    }
    return AssetImage(assetPath);
  }

  static String extractWeatherConditionKey(String url) {
    RegExp regExp = RegExp(r'\/land\/(day|night)\/(\w+)');

    return regExp.firstMatch(url)!.group(2)!;
  }

}

/* ATTRIBUTES
<a href="https://www.flaticon.com/free-icons/sun" title="sun icons">Sun icons created by Freepik - Flaticon</a>
<a href="https://www.flaticon.com/free-icons/cloud" title="cloud icons">Cloud icons created by Freepik - Flaticon</a>
<a href="https://www.flaticon.com/free-icons/rain" title="rain icons">Rain icons created by Freepik - Flaticon</a>
<a href="https://www.flaticon.com/free-icons/sun" title="sun icons">Sun icons created by Freepik - Flaticon</a>
<a href="https://www.flaticon.com/free-icons/rain" title="rain icons">Rain icons created by Freepik - Flaticon</a>
<a href="https://www.flaticon.com/free-icons/snow" title="snow icons">Snow icons created by Freepik - Flaticon</a>
<a href="https://www.flaticon.com/free-icons/rain" title="rain icons">Rain icons created by Freepik - Flaticon</a>
<a href="https://www.flaticon.com/free-icons/cloudy" title="cloudy icons">Cloudy icons created by Freepik - Flaticon</a>
*/