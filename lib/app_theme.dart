import 'package:flutter/material.dart';
import '../constants.dart';


class AppTheme {

  static ThemeData lightTheme = ThemeData(

    brightness: Brightness.light,

    scaffoldBackgroundColor: kFirstColor,

    primaryColor: kThirdColor,

    colorScheme: ColorScheme.light(
      primary: kThirdColor,
      secondary: kSecondColor,
      surface: kFirstColor,
    ),


    appBarTheme: const AppBarTheme(
      backgroundColor: kThirdColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),


    cardColor: kLightColor,


    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: kLightColor,
    ),

  );



  static ThemeData darkTheme = ThemeData(

    brightness: Brightness.dark,

    scaffoldBackgroundColor: kDarkBackgroundColor,


    colorScheme: ColorScheme.dark(

      primary: kSecondColor,

      secondary: kThirdColor,

      surface: kDarkSurfaceColor,

    ),


    appBarTheme: const AppBarTheme(

      backgroundColor: kThirdColor,

      foregroundColor: Colors.white,

    ),

  );

}