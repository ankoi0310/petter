import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/features/home/presentation/widgets/species_horizontal_list_view.dart';

class HomeSpeciesSection extends StatelessWidget {
  const HomeSpeciesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text('Species', style: context.textTheme.titleLarge),
              GestureDetector(
                onTap: () => context.pushNamed(AppRoutes.search.name),
                child: const Icon(Iconsax.arrow_right_2_copy),
              ),
            ],
          ),
          const SpeciesHorizontalListView(),
        ],
      ),
    );
  }
}
