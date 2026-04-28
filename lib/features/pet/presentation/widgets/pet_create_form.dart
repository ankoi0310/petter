import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/widgets/app_form_field.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/core/widgets/image_upload_field.dart';
import 'package:petter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:petter/features/pet/domain/usecases/create_pet_use_case.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';
import 'package:petter/features/pet/presentation/widgets/category_dropdown_field.dart';
import 'package:petter/features/pet/presentation/widgets/gender_dropdown_field.dart';

class PetCreateForm extends StatefulWidget {
  const PetCreateForm({super.key});

  @override
  State<PetCreateForm> createState() => _PetCreateFormState();
}

class _PetCreateFormState extends State<PetCreateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _speciesController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _descriptionController = TextEditingController();

  File? selectedImage;
  final categoryListenable = ValueNotifier<String?>('Dog');
  final genderListenable = ValueNotifier<Gender?>(Gender.male);

  void _submit() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;
    final authState = context.read<AuthBloc>().state;
    final uid = authState.mapOrNull(
      authenticated: (state) => state.user.uid,
    );
    if (uid == null) return;

    final params = CreatePetParams(
      uid: uid,
      name: _nameController.text.trim(),
      category: categoryListenable.value ?? 'Dog',
      species: _speciesController.text.trim(),
      address: 'address',
      gender: genderListenable.value ?? Gender.male,
      age: _ageController.text.trim(),
      weight: _weightController.text.trim(),
      description: _descriptionController.text.trim(),
      imageFile: selectedImage,
    );

    context.read<PetBloc>().add(PetEvent.createPet(params));
  }

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
            Column(
              crossAxisAlignment: .start,
              spacing: 8,
              children: [
                ImageUploadField(
                  selectedImage: selectedImage,
                  onImageSelected: (image) {
                    setState(() {
                      selectedImage = image;
                    });
                  },
                ),
                if (selectedImage != null)
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: context.colors.outline,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            selectedImage!,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedImage = null;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.colors.onSurface,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Iconsax.close_circle,
                              color: context.colors.surface,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            AppTextFormField(
              controller: _nameController,
              focusNode: FocusNode(),
              title: 'Name',
            ),
            CategoryDropdownField(
              focusNode: FocusNode(),
              valueListenable: categoryListenable,
            ),
            AppTextFormField(
              controller: _speciesController,
              focusNode: FocusNode(),
              title: 'Species',
            ),
            GenderDropdownField(
              focusNode: FocusNode(),
              valueListenable: genderListenable,
            ),
            AppTextFormField(
              required: false,
              controller: _ageController,
              focusNode: FocusNode(),
              title: 'Age',
            ),
            AppTextFormField(
              required: false,
              controller: _weightController,
              focusNode: FocusNode(),
              title: 'Weight',
            ),
            AppTextFormField(
              required: false,
              controller: _descriptionController,
              focusNode: FocusNode(),
              title: 'Description',
              hintText: 'Any special from him/her?',
              maxLines: 4,
            ),
            AppTextButton(
              onTap: _submit,
              text: 'Submit',
              padding: const .symmetric(vertical: 12),
            ),
          ],
        ),
      ),
    );
  }
}
