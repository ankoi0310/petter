import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/widgets/app_form_field.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/core/widgets/gender_dropdown_field.dart';
import 'package:petter/core/widgets/image_upload_field.dart';
import 'package:petter/core/widgets/species_dropdown_field.dart';
import 'package:petter/features/pet/domain/usecases/create_pet_use_case.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';
import 'package:petter/features/species/domain/entities/species.dart';

class PetCreateForm extends StatefulWidget {
  const PetCreateForm({required this.species, super.key});

  final List<Species> species;

  @override
  State<PetCreateForm> createState() => _PetCreateFormState();
}

class _PetCreateFormState extends State<PetCreateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _bleedController = TextEditingController();
  final _addressController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _bleedFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _ageFocusNode = FocusNode();
  final _weightFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();

  File? selectedImage;
  String? imageError;
  late ValueNotifier<String> speciesListenable = ValueNotifier(
    widget.species.first.id,
  );
  ValueNotifier<Gender> genderListenable = ValueNotifier(
    Gender.values.first,
  );

  @override
  void dispose() {
    _nameController.dispose();
    _bleedController.dispose();
    _addressController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _descriptionController.dispose();
    _nameFocusNode.dispose();
    _bleedFocusNode.dispose();
    _addressFocusNode.dispose();
    _ageFocusNode.dispose();
    _weightFocusNode.dispose();
    _descriptionFocusNode.dispose();

    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate() || selectedImage == null) {
      if (selectedImage == null) {
        setState(() {
          imageError = 'Vui lòng chọn ảnh';
        });
      }
      return;
    }

    final params = CreatePetParams(
      name: _nameController.text.trim(),
      speciesId: speciesListenable.value,
      bleed: _bleedController.text.trim(),
      address: _addressController.text.trim(),
      gender: genderListenable.value,
      age: _ageController.text.trim(),
      weight: _weightController.text.trim(),
      description: _descriptionController.text.trim(),
      imageFile: selectedImage!,
    );

    context.read<PetBloc>().add(.createPet(params));
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
                  imageError: imageError,
                  onImageError: (error) {
                    setState(() {
                      imageError = error;
                    });
                  },
                ),
                if (selectedImage != null)
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
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
              focusNode: _nameFocusNode,
              title: 'Tên',
              hintText: 'Tên của ẻm là gì?',
              validator: (value) {
                print(value);
                if (value == null) {
                  return 'Tên không được để trống';
                }

                return null;
              },
              onFieldSubmitted: (value) {
                _bleedFocusNode.requestFocus();
              },
            ),
            SpeciesDropdownField(
              focusNode: FocusNode(),
              valueListenable: speciesListenable,
            ),
            AppTextFormField(
              controller: _bleedController,
              focusNode: _bleedFocusNode,
              title: 'Giống loài',
              hintText: 'VD: Golden, Mèo Anh lông ngắn,..',
              validator: (value) {
                if (value == null) {
                  return 'Giống loài không được để trống';
                }

                return null;
              },
              onFieldSubmitted: (value) {
                _addressFocusNode.requestFocus();
              },
            ),
            AppTextFormField(
              controller: _addressController,
              focusNode: _addressFocusNode,
              title: 'Địa chỉ/Khu vực sinh sống',
              hintText: 'VD: Trường Chinh, Đông Hưng Thuận, TP.HCM',
              validator: (value) {
                if (value == null) {
                  return 'Địa chỉ không được để trống';
                }

                return null;
              },
              onFieldSubmitted: (value) {
                _ageFocusNode.requestFocus();
              },
            ),
            GenderDropdownField(
              focusNode: FocusNode(),
              valueListenable: genderListenable,
            ),
            AppTextFormField(
              required: false,
              controller: _ageController,
              focusNode: _ageFocusNode,
              title: 'Tuổi',
              onFieldSubmitted: (value) {
                _weightFocusNode.requestFocus();
              },
            ),
            AppTextFormField(
              required: false,
              controller: _weightController,
              focusNode: _weightFocusNode,
              title: 'Cân nặng',
              onFieldSubmitted: (value) {
                _addressFocusNode.requestFocus();
              },
            ),
            AppTextFormField(
              required: false,
              controller: _descriptionController,
              focusNode: _descriptionFocusNode,
              title: 'Mô tả chi tiết',
              hintText: 'Một số mô tả về thú cưng của bạn',
              maxLines: 4,
            ),
            AppTextButton(
              onTap: _submit,
              text: 'Xác nhận',
              padding: const .symmetric(vertical: 12),
            ),
          ],
        ),
      ),
    );
  }
}
