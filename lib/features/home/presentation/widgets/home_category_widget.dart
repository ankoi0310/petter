import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({super.key});

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
              Text('Categories', style: context.textTheme.titleLarge),
              const Icon(Iconsax.arrow_right_2_copy),
            ],
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: Assets.images.categories.values.map((asset) {
                return Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: .circle,
                      border: Border.all(
                        color: context.colors.secondary,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 32,
                      child: ClipRRect(
                        borderRadius: .circular(32),
                        child: asset.image(),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
