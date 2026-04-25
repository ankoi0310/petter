import 'package:flutter/material.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/core/theme/theme.dart';
import 'package:petter/core/utils/create_text_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(
      context,
    ).platformDispatcher.platformBrightness;

    final textTheme = createTextTheme(context, 'Manrope', 'Mitr');
    // final theme = AppTheme(textTheme);
    final theme = ThemeData(
      primaryColor: const Color(0xFFC16438),
      scaffoldBackgroundColor: const Color(0xFFF7EED3),
      appBarTheme: const AppBarThemeData(
        backgroundColor: Color(0xFFF7EED3),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFC16438),
        primary: const Color(0xFFC16438),
        surface: Colors.white, // Dùng cho các Card
      ),
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Petter',
      theme: theme.copyWith(
        textTheme: textTheme.apply(
          decorationColor: theme.colorScheme.onSurface,
          // bodyColor: colorScheme.onSurface,
          // displayColor: colorScheme.onSurface,
        ),
      ),
      routerConfig: routerConfig,
    );
  }
}
