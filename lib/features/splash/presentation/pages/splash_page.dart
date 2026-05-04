import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Petter', style: context.textTheme.displayLarge),
      ),
    );
  }
}
