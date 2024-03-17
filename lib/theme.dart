import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherTheme {


  static final ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.dosis().fontFamily,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xff5F6D6E),
      ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.dosis().fontFamily,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0x5F6D6E),
      brightness: Brightness.dark,
      // secondary: Color(0x523423)
    ),
  );

}