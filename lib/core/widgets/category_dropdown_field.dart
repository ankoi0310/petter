import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class CategoryDropdownField extends StatelessWidget {
  const CategoryDropdownField({
    required this.focusNode,
    required this.valueListenable,
    super.key,
  });

  final FocusNode focusNode;
  final ValueNotifier<String?> valueListenable;

  @override
  Widget build(BuildContext context) {
    final list = ['Dog', 'Cat', 'Rabbit', 'Bird'];

    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Row(
          children: [
            Text('Category', style: context.textTheme.bodyLarge),
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
          child: DropdownButtonFormField2<String>(
            focusNode: focusNode,
            valueListenable: valueListenable,
            onChanged: (value) {
              valueListenable.value = value;
            },
            decoration: InputDecoration(
              contentPadding: const .symmetric(vertical: 16),
              filled: true,
              fillColor: context.colors.primaryContainer,
              border: OutlineInputBorder(borderRadius: .circular(16)),
            ),
            items: list.map((item) {
              return DropdownItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
