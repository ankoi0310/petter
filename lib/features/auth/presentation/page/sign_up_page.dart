import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/core/widgets/loading_screen.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/features/auth/presentation/widgets/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthBloc>().state;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const .symmetric(vertical: 16),
                        child: Column(
                          children: [
                            const Spacer(),
                            Column(
                              spacing: 24,
                              children: [
                                Text(
                                  'Đăng ký tài khoản',
                                  style: context
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                        color: context.colors.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SignUpForm(),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const .only(top: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  const Text('Đã có tài khoản? '),
                                  GestureDetector(
                                    onTap: () => context.goNamed(
                                      AppRoutes.signIn.name,
                                    ),
                                    child: Text(
                                      'Đăng nhập',
                                      style: TextStyle(
                                        color: context.colors.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ?state.whenOrNull(loading: LoadingScreen.new),
        ],
      ),
    );
  }
}
