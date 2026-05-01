import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/features/user/domain/entities/user.dart';
import 'package:petter/features/user/presentation/bloc/user_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AccountOverview extends StatelessWidget {
  const AccountOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = context.read<AuthBloc>().state.maybeWhen(
      authenticated: (user) => user.id,
      orElse: () => null,
    );

    if (uid != null) {
      context.read<UserBloc>().add(UserEvent.getProfile(uid));
    }

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          authenticated: (user) {
            return BlocBuilder<UserBloc, UserState>(
              builder: (context, userState) {
                return userState.maybeWhen(
                  loaded: (user) =>
                      buildUserInfo(context, user: user),
                  orElse: () => buildUserInfo(context, user: user),
                );
              },
            );
          },
          orElse: () => Skeletonizer(child: buildUserInfo(context)),
        );
      },
    );
  }

  Container buildUserInfo(BuildContext context, {User? user}) {
    return Container(
      padding: const .symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: context.colors.tertiaryContainer,
        border: Border.all(),
        borderRadius: .circular(16),
      ),
      child: Row(
        spacing: 16,
        children: [
          CircleAvatar(
            radius: 32,
            child: ClipRRect(
              borderRadius: .circular(32),
              child: Assets.images.categories.cat.image(fit: .cover),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              spacing: 4,
              children: [
                Text(
                  user?.name ?? 'Call me Koi',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: .bold,
                  ),
                ),
                Text(
                  user?.email ?? 'support.petter@cwk.com',
                  style: context.textTheme.labelMedium,
                ),
              ],
            ),
          ),
          Skeleton.keep(
            child: AppIconButton(
              onTap: () => context.pushNamed(
                AppRoutes.userProfile.name,
                extra: user,
              ),
              icon: Iconsax.edit_2_copy,
            ),
          ),
        ],
      ),
    );
  }
}
