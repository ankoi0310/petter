import 'package:flutter/material.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/core/widgets/pet_card.dart';

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
        return PetCard(
          pet: pet,
          editable: true,
          iconSize: 16,
          borderRadius: .circular(12),
        );
      },
    );
  }
}
