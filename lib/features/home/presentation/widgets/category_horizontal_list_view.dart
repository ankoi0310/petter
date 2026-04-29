import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/features/category/presentation/bloc/category_bloc.dart';
import 'package:petter/features/home/presentation/widgets/category_card.dart';

class CategoryHorizontalListView extends StatefulWidget {
  const CategoryHorizontalListView({super.key});

  @override
  State<CategoryHorizontalListView> createState() =>
      _CategoryHorizontalListViewState();
}

class _CategoryHorizontalListViewState
    extends State<CategoryHorizontalListView> {
  @override
  void initState() {
    super.initState();

    context.read<CategoryBloc>().add(const CategoryEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CategoryBloc>().state;
    return state.maybeWhen(
      loaded: (categories) {
        return Row(
          mainAxisAlignment: .spaceBetween,
          children: List.generate(4, (index) {
            return Flexible(
              child: CategoryCard(category: categories[index]),
            );
          }),
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}
