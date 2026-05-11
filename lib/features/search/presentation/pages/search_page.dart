import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/enums/species.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/widgets/app_form_field.dart';
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

  final _speciesListenable = ValueNotifier<Species?>(null);
  final _genderListenable = ValueNotifier<Gender?>(null);

  @override
  void initState() {
    super.initState();

    _onFilterChanged();
  }

  @override
  void dispose() {
    _searchController.dispose();
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
              child: Column(
                spacing: 12,
                children: [
                  TextField(
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
                      suffixIcon: const Icon(
                        Iconsax.search_normal_copy,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: .circular(16),
                      ),
                    ),
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: AppDropdownFormField<Species>(
                          valueListenable: _speciesListenable,
                          showTitle: false,
                          onChanged: (species) {
                            _speciesListenable.value = species;
                            _params = _params.copyWith(
                              species: species,
                            );
                            _onFilterChanged();
                          },
                          label: 'Danh mục',
                          items: Species.values,
                          itemLabel: (species) => species.label,
                        ),
                      ),
                      Expanded(
                        child: AppDropdownFormField<Gender>(
                          valueListenable: _genderListenable,
                          showTitle: false,
                          onChanged: (gender) {
                            _genderListenable.value = gender;
                            _params = _params.copyWith(
                              gender: gender,
                            );
                            _onFilterChanged();
                          },
                          label: 'Giới tính',
                          items: Gender.values,
                          itemLabel: (gender) => gender.label,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
