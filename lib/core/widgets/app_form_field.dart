import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.controller,
    required this.focusNode,
    required this.title,
    this.showTitle = true,
    this.enabled = true,
    this.required = true,
    this.hintText,
    this.maxLines,
    this.validator,
    this.onFieldSubmitted,
    super.key,
  });

  final bool showTitle;
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
        if (showTitle)
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

class AppDropdownFormField<T> extends StatelessWidget {
  const AppDropdownFormField({
    required this.label,
    required this.valueListenable,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    this.required = true,
    this.showTitle = true,
    this.enabled = true,
    this.validator,
    super.key,
  });

  final bool enabled;
  final bool required;
  final bool showTitle;
  final String label;
  final ValueNotifier<T?> valueListenable;
  final List<T> items;
  final String Function(T) itemLabel;
  final void Function(T?) onChanged;
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        if (showTitle)
          Row(
            children: [
              Text(label, style: context.textTheme.titleMedium),
              if (required)
                Text(
                  '*',
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colors.error,
                  ),
                ),
            ],
          ),
        DropdownButtonFormField2<T?>(
          valueListenable: valueListenable,
          onChanged: enabled ? onChanged : null,
          decoration: InputDecoration(
            contentPadding: const .symmetric(vertical: 16),
            filled: true,
            fillColor: context.colors.primaryContainer,
            border: OutlineInputBorder(borderRadius: .circular(16)),
          ),
          errorBuilder: (context, error) {
            return Padding(
              padding: const .symmetric(horizontal: 16),
              child: Text(error),
            );
          },
          items: [
            DropdownItem<T?>(
              child: Text('Chọn $label', overflow: .ellipsis),
            ),
            ...items.map((item) {
              return DropdownItem<T?>(
                value: item,
                child: Text(itemLabel(item), overflow: .ellipsis),
              );
            }),
          ],
          autovalidateMode: .onUserInteractionIfError,
          validator: validator,
        ),
      ],
    );
  }
}
