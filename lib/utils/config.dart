import 'package:flutter/material.dart';

class Config {
  //****************************************
  //? Sahred Prefs Config
  //****************************************
  //
  //
  //
  //
  //

  // dark mode prefs key

  // isFirstTimeOpen key
  static const String isFirstTimeOpenPrefs = "isFirstTimeOpen";

  //Light Theme Config
  static const Color primaryColor = Color(0xFFDDDDDE);
  static Color accentColor = Colors.indigo[300]; //Color(0xFFFFFFFF);
  static const Color scaffoldBackgroundColor = Color(0xFFFAFAFA);
  static const Color appBarColor = Color(0xFFFAFAFA);

  //custom colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color whiteGray = Color(0xFFDDDDDE);
  static const Color black = Color(0xFF020206);
  static const Color grayWhite = Color(0xFFADA4AA);
  static Color indigo = Colors.indigo[700];
  static const Color orange = Color(0xFFD93923);
  static const Color blueGray = Color(0xFF585967);
  static const Color other = Color(0xFFD39C61);

//card side border decoration
  static BoxBorder leftSideBorder =
      Border(left: BorderSide(color: Config.indigo, width: 6.0));

  //****************************************
  //?Dark Theme Config
  //****************************************
  //
  //
  //
  //
  //

  //****************************************
  //? Font Config
  //****************************************
  //
  //
  //
  //

  // Text Config
  static const String appName = "My Todo List";
}
