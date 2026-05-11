import 'package:flutter/material.dart';
import 'package:petter/core/enums/species.dart';
import 'package:petter/features/home/presentation/widgets/species_card.dart';

class SpeciesHorizontalListView extends StatelessWidget {
  const SpeciesHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: homeSpecies.map((species) {
        return Flexible(child: SpeciesCard(species: species));
      }).toList(),
    );
  }
}
