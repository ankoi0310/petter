import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/extensions/string_extension.dart';

class GenderDropdownField extends StatelessWidget {
  const GenderDropdownField({
    required this.focusNode,
    required this.valueListenable,
    super.key,
  });

  final FocusNode focusNode;
  final ValueNotifier<Gender> valueListenable;

  @override
  Widget build(BuildContext context) {
    const list = Gender.values;

    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Row(
          children: [
            Text('Gender', style: context.textTheme.bodyLarge),
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
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: focusNode.hasFocus
                    ? context.colors.primary
                    : context.colors.outline,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: DropdownButtonFormField2<Gender>(
            focusNode: focusNode,
            valueListenable: valueListenable,
            onChanged: (value) {
              valueListenable.value = value ?? valueListenable.value;
            },
            decoration: InputDecoration(
              contentPadding: const .symmetric(vertical: 16),
              filled: true,
              fillColor: context.colors.primaryContainer,
              border: OutlineInputBorder(borderRadius: .circular(16)),
            ),
            items: list.map((item) {
              return DropdownItem<Gender>(
                value: item,
                child: Text(item.name.toTitleCase),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
