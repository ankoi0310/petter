import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/utils/image_util.dart';
import 'package:petter/core/utils/show_snack_bar.dart';
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
  final _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nameFocusNode = FocusNode();

  File? selectedImage;

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.user.name;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameFocusNode.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: .gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      final isValid = isImageFile(pickedFile.path);

      if (!isValid) {
        setState(() {
          showSnackBar(
            context,
            content: 'Định dạng ảnh không phù hợp',
          );
        });

        return;
      }

      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<UserBloc>().add(
        UserEvent.updateProfile(
          UpdateProfileParams(
            id: widget.user.id,
            name: _nameController.text.trim(),
            currentImageUrl: widget.user.avatar,
            imageFile: selectedImage,
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
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 128,
                width: 128,
                margin: const .symmetric(vertical: 32),
                padding: .symmetric(vertical: context.width * .1),
                decoration: BoxDecoration(
                  shape: .circle,
                  border: .all(),
                  image: DecorationImage(
                    fit: .cover,
                    image: selectedImage != null
                        ? FileImage(selectedImage!)
                        : widget.user.avatar == null ||
                              widget.user.avatar?.isEmpty == true
                        ? pickDefaultAvatar(widget.user.id).provider()
                        : CachedNetworkImageProvider(
                            widget.user.avatar!,
                            cacheKey: widget.user.id,
                          ),
                  ),
                ),
              ),
            ),
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
                    controller: TextEditingController(
                      text: widget.user.phone,
                    ),
                    focusNode: FocusNode(),
                    title: 'Số điện thoại',
                  ),
                  AppTextFormField(
                    enabled: false,
                    required: false,
                    controller: TextEditingController(
                      text: widget.user.email,
                    ),
                    focusNode: FocusNode(),
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
