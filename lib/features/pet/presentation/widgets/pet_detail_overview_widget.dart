import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/extensions/number_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';

class PetDetailOverviewWidget extends StatelessWidget {
  const PetDetailOverviewWidget({required this.pet, super.key});

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .stretch,
                mainAxisAlignment: .center,
                spacing: 8,
                children: [
                  Text(pet.name, style: context.textTheme.titleLarge),
                  Row(
                    spacing: 8,
                    children: [
                      const Icon(Iconsax.pet_copy),
                      Expanded(child: Text(pet.bleed)),
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      const Icon(Iconsax.location_copy),
                      Expanded(
                        child: Text(
                          pet.address.fullAddress,
                          maxLines: 2,
                          overflow: .ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppButton(
              child:
                  (pet.gender == Gender.male
                          ? Assets.icons.male
                          : Assets.icons.female)
                      .svg(
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          context.colors.primary,
                          .srcIn,
                        ),
                      ),
            ),
          ],
        ),
        Container(
          padding: const .symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: context.colors.primaryContainer,
            border: .all(),
            borderRadius: .circular(20),
            boxShadow: [
              BoxShadow(
                color: context.colors.shadow.withValues(alpha: .8),
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    spacing: 4,
                    children: [
                      Text(
                        'Tuổi',
                        style: context.textTheme.titleMedium,
                      ),
                      Text(pet.age.toAgeString()),
                    ],
                  ),
                ),
                VerticalDivider(
                  thickness: 2,
                  color: context.colors.onSurface,
                ),
                Expanded(
                  child: Column(
                    spacing: 4,
                    children: [
                      Text(
                        'Cân nặng',
                        style: context.textTheme.titleMedium,
                      ),
                      Text(pet.weight.toWeightString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
