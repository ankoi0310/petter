import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class PetDescriptionViewMore extends StatelessWidget {
  const PetDescriptionViewMore({
    required this.description,
    super.key,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(description, style: context.textTheme.titleMedium);
  }
}
