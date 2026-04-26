import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.controller,
    required this.focusNode,
    required this.title,
    this.required = true,
    this.hintText,
    this.maxLines,
    super.key,
  });

  final bool required;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String title;
  final String? hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Row(
          children: [
            Text(title, style: context.textTheme.bodyLarge),
            if (required)
              Text(
                '*',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colors.error,
                ),
              ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: .circular(16),
            boxShadow: [
              BoxShadow(
                color: focusNode.hasFocus
                    ? context.colors.primary
                    : context.colors.outline,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            maxLines: maxLines ?? 1,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: context.colors.primaryContainer,
              border: OutlineInputBorder(borderRadius: .circular(16)),
            ),
          ),
        ),
      ],
    );
  }
}

class AppPasswordFormField extends StatefulWidget {
  const AppPasswordFormField({
    required this.controller,
    required this.focusNode,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

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
        Text('Password', style: context.textTheme.bodyLarge),
        Container(
          decoration: BoxDecoration(
            borderRadius: .circular(16),
            boxShadow: [
              BoxShadow(
                color: widget.focusNode.hasFocus
                    ? context.colors.primary
                    : context.colors.outline,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              filled: true,
              fillColor: context.colors.primaryContainer,
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
          ),
        ),
      ],
    );
  }
}
