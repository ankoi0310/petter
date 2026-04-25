import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const .symmetric(horizontal: 16),
      padding: const .symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: .circular(16),
        border: Border.all(),
        boxShadow: [
          BoxShadow(
            color: context.colors.onPrimaryContainer,
            blurRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: .spaceAround,
        children: [
          Icon(Iconsax.home_2_copy),
          Icon(Iconsax.message_copy),
          Icon(Iconsax.add_square_copy),
          Icon(Iconsax.heart_copy),
          Icon(Iconsax.pet_copy),
        ],
      ),
    );
  }
}
