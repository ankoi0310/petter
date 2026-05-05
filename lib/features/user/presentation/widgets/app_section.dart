import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/features/user/presentation/models/nav_item.dart';

class AppSection extends StatelessWidget {
  const AppSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Text(
          'Ứng dụng',
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colors.outline,
          ),
        ),
        Container(
          padding: const .symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: context.colors.secondaryContainer,
            border: Border.all(),
            borderRadius: .circular(16),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: .zero,
            itemBuilder: (context, index) {
              final navItem = appNavItems[index];
              return ListTile(
                contentPadding: .zero,
                onTap: () => context.pushNamed(navItem.routeName),
                leading: Icon(navItem.icon),
                title: Text(
                  navItem.title,
                  style: context.textTheme.bodyMedium,
                ),
                trailing: const Icon(Iconsax.arrow_right_3_copy),
              );
            },
            itemCount: appNavItems.length,
          ),
        ),
      ],
    );
  }
}
