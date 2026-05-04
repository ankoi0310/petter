import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/core/theme/theme.dart';
import 'package:petter/core/utils/create_text_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen((payload) {
      print(payload);
      final notification = payload.notification;
      if (notification != null) {
        print(notification.title);
        print(notification.body);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(
    //   context,
    // ).platformDispatcher.platformBrightness;

    final textTheme = createTextTheme(
      context,
      'Baloo2',
      'NunitoSans',
    );
    final theme = AppTheme(textTheme);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Petter',
      theme: theme.light(),
      routerConfig: routerConfig,
    );
  }
}
