import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.controller,
    required this.focusNode,
    required this.title,
    this.enabled = true,
    this.required = true,
    this.hintText,
    this.maxLines,
    this.validator,
    this.onFieldSubmitted,
    super.key,
  });

  final bool enabled;
  final bool required;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String title;
  final String? hintText;
  final int? maxLines;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Row(
          children: [
            Text(title, style: context.textTheme.titleMedium),
            if (required)
              Text(
                '*',
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colors.error,
                ),
              ),
          ],
        ),
        TextFormField(
          enabled: enabled,
          controller: controller,
          focusNode: focusNode,
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(hintText: hintText),
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          onTapOutside: (_) {
            focusNode.unfocus();
          },
        ),
      ],
    );
  }
}

class AppPasswordFormField extends StatefulWidget {
  const AppPasswordFormField({
    required this.controller,
    required this.focusNode,
    this.validator,
    this.onFieldSubmitted,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;

  @override
  State<AppPasswordFormField> createState() =>
      _AppPasswordFormFieldState();
}

class _AppPasswordFormFieldState extends State<AppPasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Row(
          children: [
            Text('Password', style: context.textTheme.titleMedium),
            Text(
              '*',
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colors.error,
              ),
            ),
          ],
        ),
        TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: 'Enter your password',
            border: OutlineInputBorder(borderRadius: .circular(16)),
            suffixIcon: GestureDetector(
              onTap: () => setState(() {
                _obscureText = !_obscureText;
              }),
              child: Icon(
                _obscureText
                    ? Iconsax.eye_slash_copy
                    : Iconsax.eye_copy,
              ),
            ),
          ),
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          onTapOutside: (_) {
            widget.focusNode.unfocus();
          },
        ),
      ],
    );
  }
}
