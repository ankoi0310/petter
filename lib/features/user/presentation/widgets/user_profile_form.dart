import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/core/widgets/app_form_field.dart';
import 'package:petter/features/user/domain/entities/user.dart';
import 'package:petter/features/user/domain/usecases/update_profile_use_case.dart';
import 'package:petter/features/user/presentation/bloc/user_bloc.dart';

class UserProfileForm extends StatefulWidget {
  const UserProfileForm({required this.user, super.key});

  final User user;

  @override
  State<UserProfileForm> createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<UserProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final _uidController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _uidController.text = widget.user.id;
    _nameController.text = widget.user.name;
    _phoneController.text = widget.user.phone;
    _emailController.text = widget.user.email;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _nameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<UserBloc>().add(
        UserEvent.updateProfile(
          UpdateProfileParams(
            uid: _uidController.text.trim(),
            name: _nameController.text.trim(),
            // phone: _phoneController.text.trim(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const .all(16),
        child: Column(
          mainAxisAlignment: .center,
          spacing: 16,
          children: [
            Container(
              padding: .symmetric(vertical: context.width * .1),
              decoration: BoxDecoration(
                shape: .circle,
                border: .all(),
              ),
              child: Stack(
                clipBehavior: .none,
                children: [
                  CircleAvatar(
                    radius: 64,
                    child: ClipRRect(
                      borderRadius: .circular(64),
                      child: Assets.images.species.cat.image(),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    bottom: -4,
                    child: Container(
                      padding: const .all(8),
                      decoration: BoxDecoration(
                        color: context.colors.primary,
                        border: .all(),
                        shape: .circle,
                      ),
                      child: Icon(
                        Iconsax.gallery_edit_copy,
                        size: 20,
                        color: context.colors.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: Column(
                crossAxisAlignment: .stretch,
                spacing: 16,
                children: [
                  AppTextFormField(
                    controller: _nameController,
                    focusNode: _nameFocusNode,
                    title: 'Tên của bạn hoặc tổ chức',
                  ),
                  AppTextFormField(
                    enabled: false,
                    required: false,
                    controller: _phoneController,
                    focusNode: _phoneFocusNode,
                    title: 'Số điện thoại',
                  ),
                  AppTextFormField(
                    enabled: false,
                    required: false,
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    title: 'Email',
                  ),
                  const Spacer(),
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
                      onPressed: _submit,
                      child: const Text('Xác nhận'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
