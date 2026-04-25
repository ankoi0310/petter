import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class PetDescriptionViewMore extends StatelessWidget {
  const PetDescriptionViewMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Max is a friendly and lovable cat. Born on a sunny spring day. '
      'Something that you want to know more but I can type',
      style: context.textTheme.titleMedium,
    );
  }
}
