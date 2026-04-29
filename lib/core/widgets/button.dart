import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.child,
    this.onTap,
    this.backgroundColor,
    this.padding,
    this.border,
    this.borderRadius,
    this.boxShadow,
    super.key,
  });

  final void Function()? onTap;
  final Widget child;
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
        child: child,
      ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    this.onTap,
    this.iconSize,
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
  final double? iconSize;
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
        child: Icon(icon, size: iconSize, color: iconColor),
      ),
    );
  }
}

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required this.text,
    this.textStyle,
    this.onTap,
    this.backgroundColor,
    this.padding,
    this.border,
    this.borderRadius,
    this.boxShadow,
    super.key,
  });

  factory AppTextButton.outline(
    BuildContext context, {
    required String text,
    void Function()? onTap,
    List<BoxShadow>? boxShadow,
  }) {
    return AppTextButton(
      text: text,
      onTap: onTap,
      backgroundColor: context.colors.surface,
      border: Border.all(color: context.colors.primary),
      textStyle: context.textTheme.bodyLarge!.copyWith(
        color: context.colors.primary,
      ),
      boxShadow:
          boxShadow ??
          [
            BoxShadow(
              color: context.colors.primary.withValues(alpha: .8),
              blurStyle: BlurStyle.solid,
              offset: const Offset(1.5, 1.5),
            ),
          ],
    );
  }

  final void Function()? onTap;
  final String text;
  final TextStyle? textStyle;
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
          color: backgroundColor ?? context.colors.primary,
          border: border ?? Border.all(),
          borderRadius: borderRadius ?? .circular(12),
          boxShadow:
              boxShadow ??
              [
                BoxShadow(
                  color: context.colors.shadow.withValues(alpha: .8),
                  blurStyle: BlurStyle.solid,
                  offset: const Offset(1.5, 1.5),
                ),
              ],
        ),
        child: Text(
          text,
          textAlign: .center,
          style:
              textStyle ??
              context.textTheme.bodyLarge?.copyWith(
                color: context.colors.onPrimary,
              ),
        ),
      ),
    );
  }
}
