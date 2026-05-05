import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/extensions/string_extension.dart';
import 'package:petter/core/widgets/pet_card.dart';
import 'package:petter/core/widgets/species_dropdown_field.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final speciesListenable = ValueNotifier<String?>(null);
  final genderListenable = ValueNotifier<Gender?>(null);

  @override
  void initState() {
    super.initState();

    context.read<PetBloc>().add(const PetEvent.getPets());
  }

  @override
  Widget build(BuildContext context) {
    final petState = context.watch<PetBloc>().state;
    final valueListenable = ValueNotifier<String?>(null);
    return Scaffold(
      appBar: AppBar(title: const Text('Khám phá'), titleSpacing: 0),
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
                        child: SpeciesDropdownField(
                          focusNode: FocusNode(),
                          valueListenable: valueListenable,
                          showTitle: false,
                        ),
                      ),
                      Expanded(
                        child: DropdownButtonFormField2<Gender>(
                          valueListenable: genderListenable,
                          hint: Text(
                            'Giới tính',
                            style: context.textTheme.bodyLarge,
                          ),
                          onChanged: (value) {
                            genderListenable.value =
                                value ?? genderListenable.value;
                          },
                          decoration: InputDecoration(
                            contentPadding: const .symmetric(
                              vertical: 16,
                            ),
                            filled: true,
                            fillColor:
                                context.colors.primaryContainer,
                            border: OutlineInputBorder(
                              borderRadius: .circular(16),
                            ),
                          ),
                          items: Gender.values.map((item) {
                            return DropdownItem<Gender>(
                              value: item,
                              child: Text(item.name.toTitleCase),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: petState.maybeWhen(
                loaded: (pets, userPets, _) {
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
                    itemCount: pets.length,
                    itemBuilder: (context, index) {
                      final pet = pets[index];
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
