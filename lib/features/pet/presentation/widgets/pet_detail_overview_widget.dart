import 'package:flutter/material.dart';
import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/gen/assets.gen.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';

class PetDetailOverviewWidget extends StatelessWidget {
  const PetDetailOverviewWidget({required this.pet, super.key});

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 32,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .stretch,
                mainAxisAlignment: .center,
                spacing: 4,
                children: [
                  Text(pet.name, style: context.textTheme.titleLarge),
                  Row(
                    spacing: 4,
                    children: [
                      Assets.icons.mapPin.svg(width: 16),
                      Text(
                        pet.address,
                        style: context.textTheme.titleSmall,
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
            border: Border.all(),
            borderRadius: .circular(20),
            boxShadow: [
              BoxShadow(
                color: context.colors.shadow.withValues(alpha: .8),
                offset: const Offset(4, 4),
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
                      Text('Age', style: context.textTheme.bodyLarge),
                      Text(
                        pet.age,
                        style: context.textTheme.bodySmall,
                      ),
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
                        'Weight',
                        style: context.textTheme.bodyLarge,
                      ),
                      Text(
                        pet.weight,
                        style: context.textTheme.bodySmall,
                      ),
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
