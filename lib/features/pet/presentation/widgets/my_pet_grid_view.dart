import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/presentation/widgets/pet_image_container.dart';

class MyPetGridView extends StatelessWidget {
  const MyPetGridView({required this.pets, super.key});

  final List<Pet> pets;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 3 / 4,
      ),
      itemCount: pets.length,
      itemBuilder: (context, index) {
        final pet = pets[index];
        return Stack(
          children: [
            PetImageContainer(pet: pet),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                  gradient: LinearGradient(
                    begin: .bottomCenter,
                    end: .topCenter,
                    colors: [
                      Colors.black.withValues(alpha: .7),
                      Colors.black.withValues(alpha: .5),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Text(
                  pet.name,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: context.colors.surface,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 8,
              right: 8,
              child: LikeButton(
                onTap: () {},
                iconSize: 16,
                borderRadius: .circular(12),
              ),
            ),

            Positioned(
              bottom: 8,
              right: 8,
              child: AppIconButton(
                onTap: () {},
                icon: Iconsax.edit_2_copy,
                iconSize: 16,
                borderRadius: .circular(12),
              ),
            ),
          ],
        );
      },
    );
  }
}
