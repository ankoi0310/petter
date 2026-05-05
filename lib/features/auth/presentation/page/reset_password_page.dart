import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/extensions/string_extension.dart';
import 'package:petter/core/utils/show_snack_bar.dart';
import 'package:petter/core/widgets/app_form_field.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/core/widgets/loading_screen.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _passwordReset() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      context.read<AuthBloc>().add(
        .resetPassword(email: _emailController.text.trim()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          resetPasswordSuccess: () {
            showSnackBar(
              context,
              content: 'Vui lòng kiểm tra email của bạn.',
            );
          },
          error: (message) {
            showSnackBar(context, content: message);
          },
        );
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const .all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: .stretch,
                      mainAxisAlignment: .center,
                      spacing: 24,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Quên mật khẩu',
                              style: context.textTheme.displayMedium
                                  ?.copyWith(
                                    color: context.colors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'Nhập email để cấp lại mật khẩu',
                              style: context.textTheme.bodySmall!
                                  .copyWith(
                                    color: context.colors.outline,
                                  ),
                            ),
                          ],
                        ),
                        AppTextFormField(
                          controller: _emailController,
                          focusNode: FocusNode(),
                          title: 'Email',
                          hintText: 'Nhập email của bạn',
                          validator: (value) {
                            if (value == null) {
                              return 'Email không được để trống';
                            }

                            if (!value.isEmail) {
                              return 'Email không hợp lệ';
                            }

                            return null;
                          },
                        ),
                        AppTextButton(
                          onTap: _passwordReset,
                          padding: const .symmetric(vertical: 12),
                          text: 'Gửi yêu cầu',
                        ),
                        AppTextButton.outline(
                          context,
                          onTap: context.pop,
                          padding: const .symmetric(vertical: 12),
                          text: 'Quay lại trang chủ',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              resizeToAvoidBottomInset: true,
            ),
            ?state.whenOrNull(
              loading: () => const LoadingScreen(
                loadingLabel: 'Đang gửi mail...',
              ),
            ),
          ],
        );
      },
    );
  }
}
