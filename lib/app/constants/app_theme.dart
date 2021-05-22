import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: PRIMARY_DARK_COLOR,
  accentColor: PRIMARY_COLOR,
  splashColor: PRIMARY_COLOR,
  highlightColor: PRIMARY_LIGHT_COLOR,
  fontFamily: FONT_FAMILY_NUNITO,
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);
