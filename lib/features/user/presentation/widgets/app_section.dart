import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/router/router.dart';

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
            ListTile(
              tileColor: context.colors.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: .circular(8),
                side: BorderSide(color: context.colors.outline),
              ),
              onTap: () =>
                  context.pushNamed(AppRoutes.termsOfService.name),
              leading: const Icon(Icons.shield_outlined),
              title: const Text('Điều khoản sử dụng'),
            ),
            ListTile(
              tileColor: context.colors.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: .circular(8),
                side: BorderSide(color: context.colors.outline),
              ),
              onTap: () =>
                  context.pushNamed(AppRoutes.privacyPolicy.name),
              leading: const Icon(Icons.policy_outlined),
              title: const Text('Chính sách bảo mật'),
            ),
            ListTile(
              tileColor: context.colors.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: .circular(8),
                side: BorderSide(color: context.colors.outline),
              ),
              onTap: () {},
              leading: const Icon(Icons.info_outline),
              title: const Text('Giới thiệu'),
            ),
            ListTile(
              tileColor: context.colors.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: .circular(8),
                side: BorderSide(color: context.colors.outline),
              ),
              onTap: () {},
              leading: const Icon(Icons.verified_outlined),
              title: const Text('Phiên bản'),
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
