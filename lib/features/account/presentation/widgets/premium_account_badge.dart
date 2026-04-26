import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class PremiumAccountBadge extends StatelessWidget {
  const PremiumAccountBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: .circular(16),
        gradient: LinearGradient(
          colors: [
            context.colors.tertiary,
            context.colors.tertiary.withValues(alpha: .8),
            context.colors.tertiary.withValues(alpha: .5),
          ],
          begin: .topLeft,
          end: .bottomRight,
        ),
      ),
      child: Row(
        spacing: 16,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: context.colors.tertiaryContainer
                .withValues(alpha: .4),
            child: ClipRRect(
              borderRadius: .circular(32),
              child: Icon(
                Iconsax.crown_1_copy,
                color: context.colors.onTertiaryContainer,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: 4,
              children: [
                Text(
                  'Premium Account',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: .bold,
                    color: context.colors.onTertiary,
                  ),
                ),
                Text(
                  'Enjoy your premium features',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colors.onTertiary.withValues(
                      alpha: .8,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
