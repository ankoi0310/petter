import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/utils/show_snack_bar.dart';
import 'package:petter/core/widgets/app_form_field.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/core/widgets/image_upload_field.dart';
import 'package:petter/features/pet/domain/usecases/create_pet_use_case.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';
import 'package:petter/features/species/domain/entities/species.dart';
import 'package:petter/features/species/presentation/bloc/species_bloc.dart';
import 'package:vn_provinces_api/vn_provinces_api.dart';

class PetCreateForm extends StatefulWidget {
  const PetCreateForm({super.key});

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
  final _speciesListenable = ValueNotifier<Species?>(null);
  final _genderListenable = ValueNotifier<Gender?>(null);
  final _provinceListenable = ValueNotifier<Province?>(null);
  final _wardListenable = ValueNotifier<Ward?>(null);

  final _client = VnProvincesClient();

  List<Province> _provinces = [];
  List<Ward> _wards = [];

  File? selectedImage;
  String? _imageError;

  String get _fullAddress {
    final parts = [
      if (_addressDetailController.text.trim().isNotEmpty)
        _addressDetailController.text.trim(),
      if (_wardListenable.value != null) _wardListenable.value!.name,
      if (_provinceListenable.value != null)
        _provinceListenable.value!.name,
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
    _client.dispose();

    super.dispose();
  }

  Future<void> _loadProvinces() async {
    try {
      final provinces = await _client.getProvinces();
      setState(() {
        _provinces = provinces;
      });
    } on VnProvincesException catch (e) {
      showSnackBar(context, content: e.message);
    }
  }

  Future<void> _onProvinceChanged(
    BuildContext context, {
    Province? province,
  }) async {
    _provinceListenable.value = province;
    _wardListenable.value = null;

    setState(() {
      _wards = [];
    });

    try {
      if (province != null) {
        final provinceWithWards = await _client.getProvince(
          province.code,
          depth: 2,
        );

        setState(() {
          _wards = provinceWithWards.wards ?? [];
        });
      }
    } on VnProvincesException catch (e) {
      showSnackBar(context, content: e.message);
    }
  }

  void _submit() {
    FocusScope.of(context).unfocus();

    if (selectedImage == null) {
      setState(() {
        _imageError = 'Vui lòng chọn ảnh';
      });
      return;
    }

    if (_formKey.currentState!.validate()) {
      final params = CreatePetParams(
        name: _nameController.text.trim(),
        species: _speciesListenable.value!,
        bleed: _bleedController.text.trim(),
        addressDetail: _addressDetailController.text.trim(),
        province: _provinceListenable.value!,
        ward: _wardListenable.value!,
        fullAddress: _fullAddress,
        gender: _genderListenable.value!,
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
          spacing: 20,
          children: [
            buildPetInfo(context),
            const Divider(),
            buildAddressFormField(context),
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

  Widget buildPetInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      spacing: 16,
      children: [
        Text(
          'Thông tin thú cưng',
          style: context.textTheme.titleLarge,
        ),
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
            if (value == null || value.trim().isEmpty) {
              return 'Tên không được để trống';
            }

            return null;
          },
          onFieldSubmitted: (value) {
            _bleedFocusNode.requestFocus();
          },
        ),
        BlocBuilder<SpeciesBloc, SpeciesState>(
          builder: (context, state) {
            final species = state.maybeWhen(
              loaded: (species) => species,
              orElse: () => <Species>[],
            );

            return AppDropdownFormField<Species>(
              label: 'Danh mục',
              valueListenable: _speciesListenable,
              items: species,
              itemLabel: (p) => p.name,
              onChanged: (species) {
                _speciesListenable.value = species;
              },
              validator: (species) {
                if (species == null) {
                  return 'Vui lòng chọn danh mục';
                }

                return null;
              },
            );
          },
        ),
        AppTextFormField(
          controller: _bleedController,
          focusNode: _bleedFocusNode,
          title: 'Giống loài',
          hintText: 'VD: Golden, Mèo Anh lông ngắn,..',
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Giống loài không được để trống';
            }

            return null;
          },
          onFieldSubmitted: (value) {
            _addressDetailFocusNode.requestFocus();
          },
        ),
        AppDropdownFormField<Gender>(
          label: 'Giới tính',
          valueListenable: _genderListenable,
          items: Gender.values,
          itemLabel: (p) => p.label,
          onChanged: (gender) {
            _genderListenable.value = gender;
          },
          validator: (gender) {
            if (gender == null) {
              return 'Vui lòng chọn giới tính';
            }

            return null;
          },
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
      ],
    );
  }

  Widget buildAddressFormField(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      spacing: 16,
      children: [
        Text(
          'Thông tin địa chỉ',
          style: context.textTheme.titleLarge,
        ),
        AppDropdownFormField<Province>(
          label: 'Tỉnh thành',
          valueListenable: _provinceListenable,
          items: _provinces,
          itemLabel: (p) => p.name,
          onChanged: (province) async {
            await _onProvinceChanged(context, province: province);
          },
          validator: (province) {
            if (province == null) {
              return 'Vui lòng chọn tỉnh thành';
            }

            return null;
          },
        ),
        AppDropdownFormField<Ward>(
          label: 'Phường',
          valueListenable: _wardListenable,
          items: _wards,
          itemLabel: (p) => p.name,
          onChanged: (ward) {
            _wardListenable.value = ward;
          },
          validator: (ward) {
            if (ward == null) {
              return 'Vui lòng chọn phường';
            }

            return null;
          },
        ),
        AppTextFormField(
          required: false,
          controller: _addressDetailController,
          focusNode: _addressDetailFocusNode,
          title: 'Chi tiết',
          hintText: 'Nhập địa chỉ chi tiết (nếu có)',
          onFieldSubmitted: (value) {
            _ageFocusNode.requestFocus();
          },
        ),
      ],
    );
  }
}
