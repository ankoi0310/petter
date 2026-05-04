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
      height: 1.2,
      letterSpacing: -0.5,
    ),
    displayMedium: TextStyle(
      fontFamily: display,
      fontSize: 32,
      fontWeight: .w800,
      height: 1.2,
      letterSpacing: -0.3,
    ),
    displaySmall: TextStyle(
      fontFamily: display,
      fontSize: 26,
      fontWeight: .w700,
      height: 1.3,
    ),
    headlineLarge: TextStyle(
      fontFamily: display,
      fontSize: 24,
      fontWeight: .w700,
      height: 1.3,
    ),
    headlineMedium: TextStyle(
      fontFamily: display,
      fontSize: 20,
      fontWeight: .w700,
      height: 1.35,
    ),
    headlineSmall: TextStyle(
      fontFamily: display,
      fontSize: 18,
      fontWeight: .w700,
      height: 1.4,
    ),
    titleLarge: TextStyle(
      fontFamily: display,
      fontSize: 20,
      fontWeight: .w700,
      height: 1.35,
    ),
    titleMedium: TextStyle(
      fontFamily: body,
      fontSize: 16,
      fontWeight: .w600,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontFamily: body,
      fontSize: 15,
      fontWeight: .w500,
      height: 1.4,
    ),
    bodyLarge: TextStyle(
      fontFamily: body,
      fontSize: 16,
      fontWeight: .w400,
      height: 1.65,
    ),
    bodyMedium: TextStyle(
      fontFamily: body,
      fontSize: 15,
      fontWeight: .w400,
      height: 1.6,
    ),
    bodySmall: TextStyle(
      fontFamily: body,
      fontSize: 13,
      fontWeight: .w400,
      height: 1.5,
    ),
    labelLarge: TextStyle(
      fontFamily: body,
      fontSize: 17,
      fontWeight: .w700,
      height: 1.2,
      letterSpacing: 0.1,
    ),
    labelMedium: TextStyle(
      fontFamily: body,
      fontSize: 13,
      fontWeight: .w600,
      height: 1.3,
    ),
    labelSmall: TextStyle(
      fontFamily: body,
      fontSize: 12,
      fontWeight: .w400,
      height: 1.3,
    ),
  );
}
