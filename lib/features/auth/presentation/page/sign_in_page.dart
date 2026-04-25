import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/features/auth/presentation/widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                            Column(
                              children: [
                                Text(
                                  'Sign In',
                                  style: context
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                        color: context.colors.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  'Welcome back, your pets are missing you!',
                                  style: context
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: context.colors.outline,
                                      ),
                                ),
                              ],
                            ),
                            const SignInForm(),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const .only(top: 16),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Wanna see your paw longer? ',
                              ),
                              GestureDetector(
                                onTap: () => context.goNamed(
                                  AppRoutes.signUp.name,
                                ),
                                child: Text(
                                  'Sign up now',
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
      resizeToAvoidBottomInset: true,
    );
  }
}
