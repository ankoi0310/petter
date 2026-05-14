import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/features/user/presentation/widgets/account_overview.dart';
import 'package:petter/features/user/presentation/widgets/account_section.dart';
import 'package:petter/features/user/presentation/widgets/app_section.dart';
import 'package:petter/features/user/presentation/widgets/support_section.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tài khoản')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Column(
            spacing: 20,
            children: [
              const AccountOverview(),
              const AccountSection(),
              const AppSection(),
              const SupportSection(),
              ListTile(
                tileColor: context.colors.errorContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: context.colors.error),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                onTap: () => context.read<AuthBloc>().add(
                  const AuthEvent.signOut(),
                ),
                leading: Icon(
                  Icons.logout_outlined,
                  color: context.colors.error,
                ),
                title: Text(
                  'Đăng xuất',
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colors.error,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
