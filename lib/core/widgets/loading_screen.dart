import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({this.loadingLabel, super.key});

  final String? loadingLabel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.shadow.withValues(alpha: .5),
      body: Center(
        child: Container(
          padding: const .symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: context.colors.secondaryContainer,
            borderRadius: .circular(16),
          ),
          child: Column(
            mainAxisSize: .min,
            spacing: 12,
            children: [
              const CircularProgressIndicator(),
              if (loadingLabel != null)
                Text(
                  loadingLabel!,
                  style: context.textTheme.titleMedium,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
