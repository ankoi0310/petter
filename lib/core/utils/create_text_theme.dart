import 'package:flutter/material.dart';

TextTheme createTextTheme(
  BuildContext context,
  String display,
  String body,
) {
  return TextTheme(
    displayLarge: TextStyle(
      fontFamily: display,
      fontSize: 40,
      fontWeight: .w800,
      height: 1.1,
      letterSpacing: -0.5,
    ),
    displayMedium: TextStyle(
      fontFamily: display,
      fontSize: 32,
      fontWeight: .w800,
      height: 1.1,
      letterSpacing: -0.3,
    ),
    displaySmall: TextStyle(
      fontFamily: display,
      fontSize: 26,
      fontWeight: .w700,
    ),
    headlineLarge: TextStyle(
      fontFamily: display,
      fontSize: 24,
      fontWeight: .w700,
    ),
    headlineMedium: TextStyle(
      fontFamily: display,
      fontSize: 20,
      fontWeight: .w700,
    ),
    headlineSmall: TextStyle(
      fontFamily: display,
      fontSize: 18,
      fontWeight: .w700,
    ),
    titleLarge: TextStyle(
      fontFamily: display,
      fontSize: 20,
      fontWeight: .w700,
    ),
    titleMedium: TextStyle(
      fontFamily: body,
      fontSize: 16,
      fontWeight: .w600,
    ),
    titleSmall: TextStyle(
      fontFamily: body,
      fontSize: 15,
      fontWeight: .w500,
    ),
    bodyLarge: TextStyle(
      fontFamily: body,
      fontSize: 16,
      fontWeight: .w400,
    ),
    bodyMedium: TextStyle(
      fontFamily: body,
      fontSize: 15,
      fontWeight: .w400,
    ),
    bodySmall: TextStyle(
      fontFamily: body,
      fontSize: 13,
      fontWeight: .w400,
    ),
    labelLarge: TextStyle(
      fontFamily: body,
      fontSize: 17,
      fontWeight: .w700,
    ),
    labelMedium: TextStyle(
      fontFamily: body,
      fontSize: 13,
      fontWeight: .w600,
    ),
    labelSmall: TextStyle(
      fontFamily: body,
      fontSize: 12,
      fontWeight: .w400,
    ),
  );
}
