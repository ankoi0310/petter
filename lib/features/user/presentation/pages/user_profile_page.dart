import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:petter/core/utils/show_snack_bar.dart';
import 'package:petter/core/widgets/loading_screen.dart';
import 'package:petter/features/user/domain/entities/user.dart';
import 'package:petter/features/user/presentation/bloc/user_bloc.dart';
import 'package:petter/features/user/presentation/widgets/user_profile_form.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        state.maybeWhen(
          updateSuccess: (user) {
            context.pop();
          },
          error: (message) => showSnackBar(context, content: message),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text('Hồ sơ người dùng'),
                titleSpacing: 0,
              ),
              body: SafeArea(child: UserProfileForm(user: user)),
            ),
            if (state.maybeWhen(
              loading: () => true,
              updating: () => true,
              orElse: () => false,
            ))
              const LoadingScreen(),
          ],
        );
      },
    );
  }
}
