import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/features/auth/presentation/widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const .symmetric(horizontal: 16),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: .center,
                  spacing: 32,
                  children: [
                    Column(
                      spacing: 4,
                      children: [
                        Text(
                          'Sign In',
                          style: context.textTheme.displayMedium,
                        ),
                        Text(
                          'Welcome back, your pets are missing you!',
                          style: context.textTheme.titleMedium!
                              .copyWith(
                                color: context.colors.outline,
                              ),
                        ),
                      ],
                    ),
                    const SignInForm(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
