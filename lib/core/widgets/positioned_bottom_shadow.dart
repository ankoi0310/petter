import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class PositionedBottomShadow extends StatelessWidget {
  const PositionedBottomShadow({
    required this.child,
    this.padding = const .symmetric(horizontal: 12, vertical: 8),
    super.key,
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: const .vertical(bottom: .circular(16)),
          border: Border(
            bottom: BorderSide(
              color: context.colors.primary,
              width: 2,
            ),
          ),
          gradient: LinearGradient(
            begin: .bottomCenter,
            end: .topCenter,
            colors: [
              Colors.black.withValues(alpha: .7),
              Colors.black.withValues(alpha: .5),
              Colors.transparent,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
