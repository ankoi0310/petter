import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/widgets/app_form_field.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/core/widgets/category_dropdown_field.dart';
import 'package:petter/core/widgets/gender_dropdown_field.dart';
import 'package:petter/core/widgets/image_upload_field.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/usecases/update_pet_use_case.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';

class PetUpdateForm extends StatefulWidget {
  const PetUpdateForm({
    required this.id,
    required this.pet,
    super.key,
  });

  final String id;
  final Pet pet;

  @override
  State<PetUpdateForm> createState() => _PetUpdateFormState();
}

class _PetUpdateFormState extends State<PetUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _speciesController = TextEditingController();
  final _addressController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _descriptionController = TextEditingController();

  File? selectedImage;
  late final ValueNotifier<String> categoryListenable;
  late final ValueNotifier<Gender> genderListenable;

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.pet.name;
    _speciesController.text = widget.pet.species;
    _addressController.text = widget.pet.address;
    _ageController.text = widget.pet.age;
    _weightController.text = widget.pet.weight;
    _descriptionController.text = widget.pet.description;
    categoryListenable = ValueNotifier<String>(widget.pet.categoryId);
    genderListenable = ValueNotifier<Gender>(widget.pet.gender);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _speciesController.dispose();
    _addressController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    final params = UpdatePetParams(
      id: widget.id,
      name: _nameController.text.trim(),
      categoryId: categoryListenable.value,
      species: _speciesController.text.trim(),
      address: _addressController.text.trim(),
      gender: genderListenable.value,
      age: _ageController.text.trim(),
      weight: _weightController.text.trim(),
      description: _descriptionController.text.trim(),
      currentImageUrl: widget.pet.imageUrl,
      imageFile: selectedImage,
    );

    context.read<PetBloc>().add(PetEvent.updatePet(params));
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
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CachedNetworkImage(
                      cacheKey: widget.pet.imageUrl,
                      imageUrl: widget.pet.imageUrl,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            border: .all(
                              color: context.colors.outline,
                            ),
                            borderRadius: .circular(12),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: .cover,
                            ),
                          ),
                        );
                      },
                      placeholder: (context, url) {
                        return Container(
                          color: context.colors.primaryContainer,
                        );
                      },
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    if (selectedImage != null) ...[
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          border: .all(color: context.colors.outline),
                          borderRadius: .circular(12),
                          image: DecorationImage(
                            image: FileImage(selectedImage!),
                            fit: .cover,
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
                              shape: .circle,
                            ),
                            child: Icon(
                              Iconsax.close_circle,
                              color: context.colors.surface,
                            ),
                          ),
                        ),
                      ),
                    ],
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
