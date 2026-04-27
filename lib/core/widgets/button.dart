import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
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

class LikeButton extends StatefulWidget {
  const LikeButton({
    required this.onTap,
    this.iconSize,
    this.padding,
    this.borderRadius,
    super.key,
  });

  final VoidCallback onTap;
  final double? iconSize;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  bool _liked = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _scale =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween(begin: 1, end: 1.4),
            weight: 40,
          ),
          TweenSequenceItem(
            tween: Tween(begin: 1.4, end: 0.88),
            weight: 30,
          ),
          TweenSequenceItem(
            tween: Tween(begin: 0.88, end: 1),
            weight: 30,
          ),
        ]).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _toggle() async {
    setState(() {
      _liked = !_liked;
    });

    await _controller.forward(from: 0);

    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      behavior: .opaque,
      child: ScaleTransition(
        scale: _scale,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          child: AppIconButton(
            key: ValueKey(_liked),
            icon: _liked ? Iconsax.heart : Iconsax.heart_copy,
            iconSize: widget.iconSize,
            iconColor: _liked
                ? context.colors.error
                : context.colors.onSurface,
            padding: widget.padding,
            borderRadius: widget.borderRadius ?? .circular(16),
          ),
        ),
      ),
    );
  }
}
