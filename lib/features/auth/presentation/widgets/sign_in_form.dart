import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/extensions/string_extension.dart';
import 'package:petter/core/utils/show_snack_bar.dart';
import 'package:petter/core/widgets/app_form_field.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      context.read<AuthBloc>().add(
        AuthEvent.signIn(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .stretch,
        spacing: 20,
        children: [
          AppTextFormField(
            controller: _emailController,
            focusNode: _emailFocusNode,
            title: 'Email',
            hintText: 'Enter your email',
            validator: (value) {
              if (value == null) {
                return 'Email must not empty';
              }

              if (!value.isEmail) {
                return 'Email is invalid';
              }

              return null;
            },
            onFieldSubmitted: (value) =>
                _passwordFocusNode.requestFocus(),
          ),
          AppPasswordFormField(
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            validator: (value) {
              if (value == null) {
                return 'Password must not empty';
              }

              return null;
            },
            onFieldSubmitted: (value) => _signIn(),
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
              onPressed: _signIn,
              child: const Text('Sign In'),
            ),
          ),
        ],
      ),
    );
  }
}
