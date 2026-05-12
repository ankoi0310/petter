import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/enums/species.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/widgets/app_form_field.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/core/widgets/pet_card.dart';
import 'package:petter/features/pet/domain/entities/pet_filter_params.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  PetFilterParams _params = const PetFilterParams();
  Timer? _debounce;

  final _searchController = TextEditingController();
  final _minAgeController = TextEditingController();
  final _maxAgeController = TextEditingController();
  final _minWeightController = TextEditingController();
  final _maxWeightController = TextEditingController();

  final _minAgeFocusNode = FocusNode();
  final _maxAgeFocusNode = FocusNode();
  final _minWeightFocusNode = FocusNode();
  final _maxWeightFocusNode = FocusNode();

  final _speciesListenable = ValueNotifier<Species?>(null);
  final _genderListenable = ValueNotifier<Gender?>(null);

  int? minAge;
  int? maxAge;
  double? minWeight;
  double? maxWeight;

  @override
  void initState() {
    super.initState();

    _onFilterChanged();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _minAgeController.dispose();
    _maxAgeController.dispose();
    _minWeightController.dispose();
    _maxWeightController.dispose();
    _minAgeFocusNode.dispose();
    _maxAgeFocusNode.dispose();
    _minWeightFocusNode.dispose();
    _maxWeightFocusNode.dispose();
    super.dispose();
  }

  void _onFilterChanged() {
    // Debounce 500ms để tránh spam query Firestore
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<PetBloc>().add(
        PetEvent.getPets(params: _params, isSearch: true),
      );
    });
  }

  void _reset() {
    _searchController.clear();
    _minAgeController.clear();
    _maxAgeController.clear();
    _minWeightController.clear();
    _maxWeightController.clear();
    _speciesListenable.value = null;
    _genderListenable.value = null;

    _params = const PetFilterParams();
  }

  @override
  Widget build(BuildContext context) {
    final petState = context.watch<PetBloc>().state;
    return Scaffold(
      appBar: AppBar(title: const Text('Tìm kiếm thú cưng')),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const .symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: context.theme.scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: context.colors.shadow.withValues(
                      alpha: .8,
                    ),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: _buildSearchField(context),
            ),
            Expanded(
              child: petState.maybeWhen(
                loaded: (homePets, searchPets, userPets, _) {
                  return GridView.builder(
                    padding: const .symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 3 / 4,
                        ),
                    itemCount: searchPets.length,
                    itemBuilder: (context, index) {
                      final pet = searchPets[index];
                      return PetCard(
                        pet: pet,
                        iconSize: 16,
                        borderRadius: .circular(12),
                      );
                    },
                  );
                },
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        spacing: 16,
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchController.text = value;
                });
                _params = _params.copyWith(searchTerm: value);
                _onFilterChanged();
              },
              decoration: InputDecoration(
                hintText: 'Tìm thú cưng theo tên, đặc điểm...',
                hintStyle: context.textTheme.bodySmall,
                isDense: true,
                suffixIcon: const Icon(Iconsax.search_normal_copy),
                border: OutlineInputBorder(
                  borderRadius: .circular(16),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await showModalBottomSheet<dynamic>(
                context: context,
                useRootNavigator: true,
                isScrollControlled: true,
                constraints: BoxConstraints(
                  maxWidth: context.width - 8 * 2,
                ),
                builder: (context) {
                  return SafeArea(
                    child: Container(
                      padding: const .symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: .stretch,
                        mainAxisSize: .min,
                        spacing: 20,
                        children: [
                          Stack(
                            children: [
                              Center(
                                child: Text(
                                  'Filter',
                                  style: context.textTheme.titleLarge,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: GestureDetector(
                                  onTap: _reset,
                                  child: Icon(
                                    Iconsax.rotate_left_copy,
                                    color: context.colors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            spacing: 12,
                            children: [
                              AppDropdownFormField<Species>(
                                valueListenable: _speciesListenable,
                                onChanged: (species) {
                                  _speciesListenable.value = species;
                                  _params = _params.copyWith(
                                    species: species,
                                  );
                                },
                                label: 'Danh mục',
                                items: Species.values,
                                itemLabel: (species) => species.label,
                              ),
                              AppDropdownFormField<Gender>(
                                valueListenable: _genderListenable,
                                onChanged: (gender) {
                                  _genderListenable.value = gender;
                                  _params = _params.copyWith(
                                    gender: gender,
                                  );
                                },
                                label: 'Giới tính',
                                items: Gender.values,
                                itemLabel: (gender) => gender.label,
                              ),
                              _buildAgeFilter(context),
                              _buildWeightFilter(context),
                            ],
                          ),
                          Row(
                            spacing: 8,
                            children: [
                              Expanded(
                                child: AppTextButton.outline(
                                  context,
                                  onTap: () {
                                    _reset();
                                    _onFilterChanged();
                                    context.pop();
                                  },
                                  text: 'Xoá tất cả',
                                ),
                              ),
                              Expanded(
                                child: AppTextButton(
                                  onTap: () {
                                    _onFilterChanged();
                                    context.pop();
                                  },
                                  text: 'Áp dụng',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: const Icon(Iconsax.filter_copy),
          ),
        ],
      ),
    );
  }

  Column _buildAgeFilter(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Text(
          'Độ tuổi (theo tháng)',
          style: context.textTheme.titleMedium,
        ),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: AppTextFormField(
                controller: _minAgeController,
                focusNode: _minAgeFocusNode,
                title: '',
                hintText: '6',
                showTitle: false,
                keyboardType: .number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (age) {
                  if (age == null || age.isEmpty) return null;

                  final n = int.tryParse(age);
                  if (n == null) return 'Số không hợp lệ';
                  return null;
                },
                onChanged: (value) {
                  final age = value.isEmpty
                      ? null
                      : int.tryParse(value);
                  setState(() {
                    _params = _params.copyWith(minAge: age);
                  });
                },
              ),
            ),
            Expanded(
              child: AppTextFormField(
                controller: _maxAgeController,
                focusNode: _maxAgeFocusNode,
                title: '',
                hintText: '18',
                showTitle: false,
                keyboardType: .number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (age) {
                  if (age == null || age.isEmpty) return null;

                  final n = int.tryParse(age);
                  if (n == null) return 'Số không hợp lệ';
                  return null;
                },
                onChanged: (value) {
                  final age = value.isEmpty
                      ? null
                      : int.tryParse(value);
                  setState(() {
                    _params = _params.copyWith(maxAge: age);
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column _buildWeightFilter(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Text('Cân nặng (kg)', style: context.textTheme.titleMedium),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: AppTextFormField(
                controller: _minWeightController,
                focusNode: _minWeightFocusNode,
                title: '',
                hintText: '0',
                showTitle: false,
                keyboardType: const .numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^\d*\.?\d*'),
                  ),
                ],
                validator: (weight) {
                  if (weight == null || weight.isEmpty) return null;

                  final n = double.tryParse(weight);
                  if (n == null) return 'Định dạng số không hợp lệ';
                  if (n < 0) return 'Số không được âm';

                  return null;
                },
                onChanged: (value) {
                  final weight = value.isEmpty
                      ? null
                      : double.tryParse(value);
                  setState(() {
                    _params = _params.copyWith(minWeight: weight);
                  });
                },
              ),
            ),
            Expanded(
              child: AppTextFormField(
                controller: _maxWeightController,
                focusNode: _maxWeightFocusNode,
                title: '',
                hintText: '36.5',
                showTitle: false,
                keyboardType: const .numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^\d*\.?\d*'),
                  ),
                ],
                validator: (weight) {
                  if (weight == null || weight.isEmpty) return null;

                  final n = double.tryParse(weight);
                  if (n == null) return 'Định dạng số không hợp lệ';
                  if (n < 0) return 'Số không được âm';

                  return null;
                },
                onChanged: (value) {
                  final weight = value.isEmpty
                      ? null
                      : double.tryParse(value);
                  setState(() {
                    _params = _params.copyWith(maxWeight: weight);
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SearchSliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => kToolbarHeight + 24;

  @override
  double get minExtent => kToolbarHeight + 24;

  @override
  bool shouldRebuild(
    covariant SliverPersistentHeaderDelegate oldDelegate,
  ) => false;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      padding: const .symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: context.colors.shadow.withValues(alpha: .8),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        spacing: 12,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search pet...',
              suffixIcon: const Icon(Iconsax.search_normal_copy),
              border: OutlineInputBorder(borderRadius: .circular(16)),
            ),
          ),
        ],
      ),
    );
  }
}
