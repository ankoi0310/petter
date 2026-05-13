import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/enums/species.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/utils/show_snack_bar.dart';
import 'package:petter/core/widgets/app_form_field.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/core/widgets/image_upload_field.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/usecases/update_pet_use_case.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';
import 'package:vn_provinces_api/vn_provinces_api.dart';

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
  final _breedController = TextEditingController();
  final _addressDetailController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _breedFocusNode = FocusNode();
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
        _addressDetailController.text.trim()
      else
        widget.pet.address.detail,
      if (_wardListenable.value != null)
        _wardListenable.value!.name
      else
        widget.pet.address.ward,
      if (_provinceListenable.value != null)
        _provinceListenable.value!.name
      else
        widget.pet.address.province,
    ];

    return parts.isEmpty
        ? widget.pet.address.fullAddress
        : parts.join(', ');
  }

  @override
  void initState() {
    super.initState();

    _initData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _breedController.dispose();
    _addressDetailController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _descriptionController.dispose();
    _nameFocusNode.dispose();
    _breedFocusNode.dispose();
    _addressDetailFocusNode.dispose();
    _ageFocusNode.dispose();
    _weightFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _client.dispose();

    super.dispose();
  }

  Future<void> _initData() async {
    _nameController.text = widget.pet.name;
    _breedController.text = widget.pet.breed;
    _ageController.text = '${widget.pet.age}';
    _weightController.text = '${widget.pet.weight}';
    _descriptionController.text = widget.pet.description;
    _addressDetailController.text = widget.pet.address.detail;

    _speciesListenable.value = widget.pet.species;
    _genderListenable.value = widget.pet.gender;

    await _loadProvinces();

    final currentProvince = _provinces.firstWhere(
      (p) => p.code == widget.pet.address.provinceCode,
    );

    await _onProvinceChanged(context, province: currentProvince);
    _wardListenable.value = _wards.firstWhere(
      (w) => w.code == widget.pet.address.wardCode,
    );
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

    if (!_formKey.currentState!.validate()) return;

    final params = UpdatePetParams(
      id: widget.pet.id,
      name: _nameController.text.trim(),
      species: _speciesListenable.value!,
      bleed: _breedController.text.trim(),
      addressDetail: _addressDetailController.text.trim(),
      province: _provinceListenable.value,
      ward: _wardListenable.value,
      fullAddress: _fullAddress,
      gender: _genderListenable.value,
      age: _ageController.text.trim(),
      weight: _weightController.text.trim(),
      description: _descriptionController.text.trim(),
      imageFile: selectedImage,
      currentImageUrl: widget.pet.imageUrl,
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
                        border: .all(color: context.colors.outline),
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
            _breedFocusNode.requestFocus();
          },
        ),
        AppDropdownFormField<Species>(
          label: 'Danh mục',
          valueListenable: _speciesListenable,
          items: Species.values,
          itemLabel: (p) => p.label,
          onChanged: (species) {
            _speciesListenable.value = species;
          },
          validator: (species) {
            if (species == null) {
              return 'Vui lòng chọn danh mục';
            }

            return null;
          },
        ),
        AppTextFormField(
          controller: _breedController,
          focusNode: _breedFocusNode,
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
