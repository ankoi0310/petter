import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/features/user/presentation/bloc/user_bloc.dart';
import 'package:petter/features/user/presentation/widgets/menu_item_tile.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    final userState = context.watch<UserBloc>().state;
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Text('Tài khoản', style: context.textTheme.titleLarge),
        Column(
          spacing: 4,
          children: [
            MenuItemTile(
              onTap: () async {
                var user = authState.whenOrNull(
                  authenticated: (user) => user,
                );

                user = userState.maybeWhen(
                  loaded: (user) => user,
                  updating: () => user,
                  updateSuccess: (user) => user,
                  orElse: () => user,
                );

                await context.pushNamed(
                  AppRoutes.userProfile.name,
                  extra: user,
                );
              },
              title: 'Cập nhật thông tin cá nhân',
              trailing: const Icon(Icons.person_outline),
            ),
            MenuItemTile(
              onTap: () async {
                await context.pushNamed(
                  AppRoutes.accountChangePassword.name,
                );
              },
              title: 'Đổi mật khẩu',
              trailing: const Icon(Icons.key_outlined),
            ),
          ],
        ),
      ],
    );
  }
}
