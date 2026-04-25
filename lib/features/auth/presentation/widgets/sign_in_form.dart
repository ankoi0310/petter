import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/utils/show_snack_bar.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .stretch,
        spacing: 20,
        children: [
          Column(
            crossAxisAlignment: .start,
            spacing: 8,
            children: [
              Text('Email', style: context.textTheme.bodyLarge),
              Container(
                decoration: BoxDecoration(
                  borderRadius: .circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: _emailFocusNode.hasFocus
                          ? context.colors.primary
                          : context.colors.outline,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    filled: true,
                    fillColor: context.colors.primaryContainer,
                    border: OutlineInputBorder(
                      borderRadius: .circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: .start,
            spacing: 8,
            children: [
              Text('Password', style: context.textTheme.bodyLarge),
              Container(
                decoration: BoxDecoration(
                  borderRadius: .circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: _passwordFocusNode.hasFocus
                          ? context.colors.primary
                          : context.colors.outline,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: TextFormField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    filled: true,
                    fillColor: context.colors.primaryContainer,
                    border: OutlineInputBorder(
                      borderRadius: .circular(16),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () => setState(() {
                        _obscureText = !_obscureText;
                      }),
                      child: Icon(
                        _obscureText
                            ? Iconsax.eye_slash_copy
                            : Iconsax.eye_copy,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text.rich(
            TextSpan(
              text: 'Forgot you password?',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  showSnackBar(context, content: 'Forgot password');
                },
            ),
            style: TextStyle(color: context.colors.error),
            textAlign: .right,
          ),
          Padding(
            padding: const .only(top: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: context.textTheme.titleLarge,
                backgroundColor: context.colors.primary,
                foregroundColor: context.colors.onPrimary,
                shadowColor: context.colors.shadow,
                splashFactory: NoSplash.splashFactory,
                shape: RoundedRectangleBorder(
                  borderRadius: .circular(16),
                  side: BorderSide(
                    color: context.colors.secondary,
                    width: 2,
                  ),
                ),
                padding: const .symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
              ),
              onPressed: () {},
              child: const Text('Sign In'),
            ),
          ),
        ],
      ),
    );
  }
}
