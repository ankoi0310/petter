import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/features/species/presentation/bloc/species_bloc.dart';

class SpeciesDropdownField extends StatelessWidget {
  const SpeciesDropdownField({
    required this.focusNode,
    required this.valueListenable,
    this.showTitle = true,
    this.onChanged,
    super.key,
  });

  final bool showTitle;
  final FocusNode focusNode;
  final ValueNotifier<String?> valueListenable;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        if (showTitle)
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
        BlocBuilder<SpeciesBloc, SpeciesState>(
          builder: (context, state) {
            // Lấy danh sách items dựa trên state
            final dropdownItems = state.maybeWhen(
              loaded: (species) => species.map((species) {
                return DropdownItem<String>(
                  value: species.id,
                  child: Text(species.name),
                );
              }).toList(),
              orElse: () => [
                const DropdownItem<String?>(
                  child: Text('Đang tải hoặc lỗi...'),
                ),
              ],
            );

            return DropdownButtonFormField2<String?>(
              focusNode: focusNode,
              valueListenable: valueListenable,
              hint: const Text('Chọn danh mục'),
              items: [
                const DropdownItem<String?>(
                  child: Text('Chọn danh mục'),
                ),
                ...dropdownItems,
              ],
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding: const .symmetric(vertical: 16),
                filled: true,
                fillColor: context.colors.primaryContainer,
                border: OutlineInputBorder(
                  borderRadius: .circular(16),
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
      ],
    );
  }
}
