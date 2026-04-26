import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/core/widgets/button.dart';

class AccountOverview extends StatelessWidget {
  const AccountOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: context.colors.tertiaryContainer,
        border: Border.all(),
        borderRadius: .circular(16),
      ),
      child: Row(
        spacing: 16,
        children: [
          CircleAvatar(
            radius: 32,
            child: ClipRRect(
              borderRadius: .circular(32),
              child: Assets.images.categories.cat.image(fit: .cover),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: 4,
              children: [
                Text(
                  'Call me Koi',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: .bold,
                  ),
                ),
                Text(
                  'support.petter@cwk.com',
                  style: context.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          AppIconButton(onTap: () {}, icon: Iconsax.edit_2_copy),
        ],
      ),
    );
  }
}
