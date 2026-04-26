import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petter/core/widgets/app_form_field.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/core/widgets/image_upload_field.dart';
import 'package:petter/features/pet/presentation/widgets/category_dropdown_field.dart';

class PetCreateForm extends StatefulWidget {
  const PetCreateForm({super.key});

  @override
  State<PetCreateForm> createState() => _PetCreateFormState();
}

class _PetCreateFormState extends State<PetCreateForm> {
  final _formKey = GlobalKey<FormState>();

  File? selectedImage;
  final categoryListenable = ValueNotifier<String?>(null);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const .symmetric(horizontal: 16, vertical: 12),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: .stretch,
          spacing: 16,
          children: [
            ImageUploadField(
              selectedImage: selectedImage,
              onImageSelected: (image) {
                setState(() {
                  selectedImage = image;
                });
              },
            ),
            AppTextFormField(
              required: false,
              controller: TextEditingController(),
              focusNode: FocusNode(),
              title: 'Name',
            ),
            CategoryDropdownField(
              focusNode: FocusNode(),
              valueListenable: categoryListenable,
            ),
            AppTextFormField(
              controller: TextEditingController(),
              focusNode: FocusNode(),
              title: 'Species',
            ),
            AppTextFormField(
              controller: TextEditingController(),
              focusNode: FocusNode(),
              title: 'Gender',
            ),
            AppTextFormField(
              required: false,
              controller: TextEditingController(),
              focusNode: FocusNode(),
              title: 'Date of birth',
            ),
            AppTextFormField(
              controller: TextEditingController(),
              focusNode: FocusNode(),
              title: 'Weight',
            ),
            AppTextFormField(
              required: false,
              controller: TextEditingController(),
              focusNode: FocusNode(),
              title: 'Description',
              hintText: 'Any special from him/her?',
              maxLines: 4,
            ),
            const AppTextButton(
              text: 'Submit',
              padding: .symmetric(vertical: 12),
            ),
          ],
        ),
      ),
    );
  }
}
