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
    final theme = AppTheme(textTheme);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Petter',
      theme: theme.light(),
      routerConfig: routerConfig,
    );
  }
}
