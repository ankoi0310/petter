import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/widgets/like_button.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';

class PetDetailImageView extends StatelessWidget {
  const PetDetailImageView({required this.pet, super.key});

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.width,
          height: context.width - 16 * 2,
          decoration: BoxDecoration(
            border: Border.all(
              color: context.colors.primary,
              width: 4,
            ),
            borderRadius: .circular(32),
            image: DecorationImage(
              image: CachedNetworkImageProvider(pet.imageUrl),
              fit: .cover,
            ),
          ),
        ),
        if (pet.isAdopted)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const .symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: context.colors.primary,
                borderRadius: const .only(
                  topLeft: .circular(16),
                  bottomRight: .circular(16),
                ),
                border: Border.all(
                  color: context.colors.primary,
                  width: 2,
                ),
              ),
              child: Text(
                'Đã được nhận nuôi',
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colors.onPrimary,
                ),
              ),
            ),
          ),
        Positioned(
          top: 16,
          right: 16,
          child: LikeButton(petId: pet.id),
        ),
      ],
    );
  }
}
