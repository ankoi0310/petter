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
import 'package:vn_provinces/vn_provinces.dart';

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
  final _addressDetailController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _bleedFocusNode = FocusNode();
  final _addressDetailFocusNode = FocusNode();
  final _ageFocusNode = FocusNode();
  final _weightFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();

  final _client = VnProvincesClient();

  List<Province> _provinces = [];
  List<Ward> _wards = [];

  final _provinceListenable = ValueNotifier<Province?>(null);
  final _wardListenable = ValueNotifier<Ward?>(null);
  String? _addressError;

  File? selectedImage;
  String? _imageError;
  late ValueNotifier<String> speciesListenable = ValueNotifier(
    widget.species.first.id,
  );
  ValueNotifier<Gender> genderListenable = ValueNotifier(
    Gender.values.first,
  );

  String get _fullAddress {
    final parts = [
      if (_wardListenable.value != null) _wardListenable.value,
      if (_provinceListenable.value != null)
        _provinceListenable.value,
      if (_addressDetailController.text.trim().isNotEmpty)
        _addressDetailController.text.trim(),
    ];

    return parts.join(', ');
  }

  @override
  void initState() {
    super.initState();
    _loadProvinces();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bleedController.dispose();
    _addressDetailController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _descriptionController.dispose();
    _nameFocusNode.dispose();
    _bleedFocusNode.dispose();
    _addressDetailFocusNode.dispose();
    _ageFocusNode.dispose();
    _weightFocusNode.dispose();
    _descriptionFocusNode.dispose();

    super.dispose();
  }

  Future<void> _loadProvinces() async {
    try {
      final provinces = await _client.getProvinces();
      setState(() {
        _provinces = provinces;
        _addressError = null;
      });
    } on VnProvincesException catch (e) {
      setState(() {
        _addressError = e.message;
      });
    }
  }

  Future<void> _onProvinceChanged(Province? province) async {
    if (province == null) return;

    _provinceListenable.value = province;
    _wardListenable.value = null;

    setState(() {
      _wards = [];
    });

    try {
      // depth 2 for show wards
      final provinceWithWards = await _client.getProvince(
        province.code,
        depth: 2,
      );

      setState(() {
        _wards = provinceWithWards.wards ?? [];
        _addressError = null;
      });
    } on VnProvincesException catch (e) {
      setState(() {
        _addressError = e.message;
      });
    }
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      if (selectedImage == null) {
        setState(() {
          _imageError = 'Vui lòng chọn ảnh';
        });
        return;
      }

      if (_provinceListenable.value == null) {
        setState(() {
          _addressError = 'Vui lòng chọn tỉnh thành';
        });
        return;
      }

      if (_wardListenable.value == null) {
        setState(() {
          _addressError = 'Vui lòng chọn phường';
        });
        return;
      }

      final params = CreatePetParams(
        name: _nameController.text.trim(),
        speciesId: speciesListenable.value,
        bleed: _bleedController.text.trim(),
        addressDetail: _addressDetailController.text.trim(),
        province: _provinceListenable.value!,
        ward: _wardListenable.value!,
        fullAddress: _fullAddress,
        gender: genderListenable.value,
        age: _ageController.text.trim(),
        weight: _weightController.text.trim(),
        description: _descriptionController.text.trim(),
        imageFile: selectedImage!,
      );

      context.read<PetBloc>().add(.createPet(params));
    }
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
                  imageError: _imageError,
                  onImageError: (error) {
                    setState(() {
                      _imageError = error;
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
                _addressDetailFocusNode.requestFocus();
              },
            ),
            AppDropdownFormField<Province>(
              label: 'Địa chỉ',
              valueListenable: _provinceListenable,
              items: _provinces,
              itemLabel: (p) => p.name,
              onChanged: _onProvinceChanged,
            ),
            AppDropdownFormField<Ward>(
              showTitle: false,
              label: 'Phường',
              valueListenable: _wardListenable,
              items: _wards,
              itemLabel: (p) => p.name,
              onChanged: (ward) {
                setState(() {
                  _wardListenable.value = ward;
                });
              },
            ),
            AppTextFormField(
              showTitle: false,
              controller: _addressDetailController,
              focusNode: _addressDetailFocusNode,
              title: 'Địa chỉ',
              hintText: 'Nhập địa chỉ chi tiết (nếu có)',
              onFieldSubmitted: (value) {
                _ageFocusNode.requestFocus();
              },
            ),
            if (_addressError != null &&
                _addressError?.isNotEmpty == true)
              Text(
                _addressError!,
                style: TextStyle(color: context.colors.error),
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
                _addressDetailFocusNode.requestFocus();
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
