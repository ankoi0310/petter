import 'package:flutter/material.dart';
import 'package:petter/core/enums/species.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class SpeciesCard extends StatelessWidget {
  const SpeciesCard({required this.species, super.key});

  final Species species;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: .circle,
        border: Border.all(color: context.colors.secondary),
      ),
      child: CircleAvatar(
        radius: 32,
        child: ClipRRect(
          borderRadius: .circular(32),
          child: species.asset.image(fit: .cover),
        ),
      ),
    );
  }
}
