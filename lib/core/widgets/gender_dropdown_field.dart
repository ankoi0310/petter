import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class GenderDropdownField extends StatelessWidget {
  const GenderDropdownField({
    required this.focusNode,
    required this.valueListenable,
    this.showTitle = true,
    this.onChanged,
    super.key,
  });

  final bool showTitle;
  final FocusNode focusNode;
  final ValueNotifier<Gender?> valueListenable;
  final void Function(Gender?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        if (showTitle)
          Row(
            children: [
              Text('Giới tính', style: context.textTheme.titleMedium),
              Text(
                '*',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colors.error,
                ),
              ),
            ],
          ),
        DropdownButtonFormField2<Gender?>(
          focusNode: focusNode,
          valueListenable: valueListenable,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const .symmetric(vertical: 16),
            filled: true,
            fillColor: context.colors.primaryContainer,
            border: OutlineInputBorder(borderRadius: .circular(16)),
          ),
          items: [
            const DropdownItem<Gender?>(
              child: Text('Chọn giới tính'),
            ),
            ...Gender.values.map((item) {
              return DropdownItem<Gender?>(
                value: item,
                child: Text(item.label),
              );
            }),
          ],
        ),
      ],
    );
  }
}
