import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.padding,
    this.border,
    this.borderRadius,
    this.boxShadow,
    super.key,
  });

  final void Function()? onTap;
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final Border? border;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? const .all(8),
        decoration: BoxDecoration(
          color: backgroundColor ?? context.colors.surface,
          border: border ?? Border.all(),
          borderRadius: borderRadius ?? .circular(12),
          boxShadow:
              boxShadow ??
              [
                BoxShadow(
                  color: context.colors.primary.withValues(alpha: .8),
                  blurStyle: BlurStyle.solid,
                  offset: const Offset(0, 1.5),
                ),
              ],
        ),
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}
