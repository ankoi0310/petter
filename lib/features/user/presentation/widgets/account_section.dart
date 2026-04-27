import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/features/user/presentation/bloc/user_bloc.dart';
import 'package:petter/features/user/presentation/models/nav_item.dart';

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
        Text(
          'Account',
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
              final navItem = accountNavItems[index];
              return ListTile(
                contentPadding: .zero,
                onTap: () async {
                  if (navItem.routeName ==
                      AppRoutes.userProfile.name) {
                    var user = authState.maybeWhen(
                      authenticated: (user) => user,
                      orElse: () => false,
                    );

                    user = userState.maybeWhen(
                      loaded: (user) => user,
                      updating: () => user,
                      updateSuccess: (user) => user,
                      orElse: () => user,
                    );

                    await context.pushNamed(
                      navItem.routeName,
                      extra: user,
                    );
                    return;
                  }
                  await context.pushNamed(navItem.routeName);
                },
                leading: Icon(navItem.icon),
                title: Text(
                  navItem.title,
                  style: context.textTheme.bodyMedium,
                ),
                trailing: const Icon(Iconsax.arrow_right_3_copy),
              );
            },
            itemCount: accountNavItems.length,
          ),
        ),
      ],
    );
  }
}
