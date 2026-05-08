import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/features/user/presentation/widgets/menu_item_tile.dart';

class AppSection extends StatelessWidget {
  const AppSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Text('Về ứng dụng', style: context.textTheme.titleLarge),
        Column(
          spacing: 4,
          children: [
            MenuItemTile(
              onTap: () =>
                  context.pushNamed(AppRoutes.termsOfService.name),
              title: 'Điều khoản sử dụng',
              trailing: const Icon(Icons.shield_outlined),
            ),
            MenuItemTile(
              onTap: () =>
                  context.pushNamed(AppRoutes.privacyPolicy.name),
              title: 'Chính sách bảo mật',
              trailing: const Icon(Icons.policy_outlined),
            ),
            MenuItemTile(
              onTap: () {},
              title: 'Giới thiệu',
              trailing: const Icon(Icons.info_outline),
            ),
            MenuItemTile(
              title: 'Phiên bản',
              trailing: Text(
                '1.0.0',
                style: context.textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
