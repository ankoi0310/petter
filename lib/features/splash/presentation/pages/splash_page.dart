import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 5), () {
    //   if (mounted && context.matchedLocation == AppRoutes.splash.path) {
    //     context.goNamed(AppRoutes.home.name);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Petter', style: context.textTheme.displayMedium),
      ),
    );
  }
}
