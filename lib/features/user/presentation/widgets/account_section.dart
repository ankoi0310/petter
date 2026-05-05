import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/features/user/presentation/bloc/user_bloc.dart';

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
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: .zero,
          children: [
            ListTile(
              tileColor: context.colors.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: .circular(8),
                side: BorderSide(color: context.colors.outline),
              ),
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
              leading: const Icon(Icons.person_outline),
              title: const Text('Cập nhật thông tin cá nhân'),
            ),
            const SizedBox(height: 4),
            ListTile(
              tileColor: context.colors.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: .circular(8),
                side: BorderSide(color: context.colors.outline),
              ),
              onTap: () async {
                await context.pushNamed(
                  AppRoutes.accountChangePassword.name,
                );
              },
              leading: const Icon(Icons.key_outlined),
              title: const Text('Đổi mật khẩu'),
            ),
          ],
        ),
      ],
    );
  }
}
