import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/widgets/app_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _usernameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameFocusNode.dispose();
    _usernameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
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
            controller: _nameController,
            focusNode: _nameFocusNode,
            title: 'Your name or organization',
            hintText: 'What should we call you?',
          ),
          AppTextFormField(
            controller: _usernameController,
            focusNode: _usernameFocusNode,
            title: 'Username',
            hintText: 'Enter your username',
          ),
          AppTextFormField(
            controller: _emailController,
            focusNode: _emailFocusNode,
            title: 'Email',
            hintText: 'Enter your email',
          ),
          AppPasswordFormField(
            controller: _passwordController,
            focusNode: _passwordFocusNode,
          ),
          Padding(
            padding: const .only(top: 32),
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
