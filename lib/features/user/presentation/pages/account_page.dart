import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/features/user/presentation/widgets/account_overview.dart';
import 'package:petter/features/user/presentation/widgets/account_section.dart';
import 'package:petter/features/user/presentation/widgets/app_section.dart';
import 'package:petter/features/user/presentation/widgets/premium_account_badge.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(titleSpacing: 0, title: const Text('Account')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const .symmetric(horizontal: 16, vertical: 12),
            child: Column(
              spacing: 20,
              children: [
                const AccountOverview(),
                const PremiumAccountBadge(),
                const AccountSection(),
                const AppSection(),
                ListTile(
                  tileColor: context.colors.errorContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: .circular(16),
                    side: BorderSide(color: context.colors.error),
                  ),
                  contentPadding: const .symmetric(horizontal: 16),
                  onTap: () => context.read<AuthBloc>().add(
                    const AuthEvent.signOut(),
                  ),
                  leading: Icon(
                    Iconsax.logout_copy,
                    color: context.colors.error,
                  ),
                  title: Text(
                    'Sign Out',
                    style: TextStyle(color: context.colors.error),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
