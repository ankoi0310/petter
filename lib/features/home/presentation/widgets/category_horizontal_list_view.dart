import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/features/category/presentation/bloc/category_bloc.dart';
import 'package:petter/features/home/presentation/widgets/category_card.dart';

class CategoryHorizontalListView extends StatelessWidget {
  const CategoryHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CategoryBloc>().state;
    return state.maybeWhen(
      loaded: (categories) {
        // final displayCategories = categories.take(4).toList();
        return Row(
          mainAxisAlignment: .spaceBetween,
          children: categories.map((category) {
            return Flexible(child: CategoryCard(category: category));
          }).toList(),
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}
