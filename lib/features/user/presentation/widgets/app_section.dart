import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/features/user/presentation/widgets/menu_item_tile.dart';

class AppSection extends StatefulWidget {
  const AppSection({super.key});

  @override
  State<AppSection> createState() => _AppSectionState();
}

class _AppSectionState extends State<AppSection> {
  late Future<PackageInfo> _packageInfo;

  @override
  void initState() {
    super.initState();
    _packageInfo = PackageInfo.fromPlatform();
  }

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
              onTap: () => context.pushNamed(AppRoutes.about.name),
              title: 'Giới thiệu',
              trailing: const Icon(Icons.info_outline),
            ),
            MenuItemTile(
              title: 'Phiên bản',
              trailing: FutureBuilder<PackageInfo>(
                future: _packageInfo,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final version = snapshot.data!.version;
                    return Text(
                      version,
                      style: context.textTheme.bodySmall,
                    );
                  }
                  return Text(
                    'Loading...',
                    style: context.textTheme.bodySmall,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
