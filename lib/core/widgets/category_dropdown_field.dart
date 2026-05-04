import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/features/category/presentation/bloc/category_bloc.dart';

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
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Row(
          children: [
            Text('Danh mục', style: context.textTheme.titleMedium),
            Text(
              '*',
              style: context.textTheme.titleMedium?.copyWith(
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
          child: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              // Lấy danh sách items dựa trên state
              final dropdownItems = state.maybeWhen(
                loaded: (categories) => categories.map((category) {
                  return DropdownItem<String>(
                    value: category.id,
                    child: Text(category.name),
                  );
                }).toList(),
                orElse: () => [
                  const DropdownItem<String>(
                    child: Text('Đang tải hoặc lỗi...'),
                  ),
                ],
              );

              return DropdownButtonFormField2<String>(
                focusNode: focusNode,
                valueListenable: valueListenable,
                hint: const Text('Chọn danh mục'),
                items: dropdownItems,
                onChanged: (value) {
                  valueListenable.value = value;
                },
                decoration: InputDecoration(
                  contentPadding: const .symmetric(vertical: 16),
                  filled: true,
                  fillColor: context.colors.primaryContainer,
                  border: OutlineInputBorder(
                    borderRadius: .circular(16),
                    borderSide: .none,
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: .circular(16),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
