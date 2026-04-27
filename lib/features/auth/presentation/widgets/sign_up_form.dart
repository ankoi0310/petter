import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/extensions/string_extension.dart';
import 'package:petter/core/widgets/app_form_field.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _displayNameFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _displayNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _displayNameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        AuthEvent.signUp(
          displayName: _displayNameController.text.trim(),
          phoneNumber: _phoneNumberController.text.trim(),
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
            controller: _displayNameController,
            focusNode: _displayNameFocusNode,
            title: 'Your name or organization',
            hintText: 'What should we call you?',
            validator: (value) {
              if (value == null) {
                return 'Name must not empty';
              }

              return null;
            },
            onFieldSubmitted: (value) =>
                _phoneNumberFocusNode.requestFocus(),
          ),
          AppTextFormField(
            controller: _phoneNumberController,
            focusNode: _phoneNumberFocusNode,
            title: 'Phone',
            hintText: 'Enter your phone number',
            validator: (value) {
              if (value == null) {
                return 'Phone must not empty';
              }

              if (!value.isPhone) {
                return 'Phone is invalid';
              }

              return null;
            },
            onFieldSubmitted: (value) =>
                _emailFocusNode.requestFocus(),
          ),
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
            onFieldSubmitted: (value) {
              _signUp();
            },
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
              onPressed: _signUp,
              child: const Text('Sign In'),
            ),
          ),
        ],
      ),
    );
  }
}
