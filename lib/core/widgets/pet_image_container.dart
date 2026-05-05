import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';

class PetImageContainer extends StatelessWidget {
  const PetImageContainer({required this.pet, super.key});

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        AppRoutes.myPetInfo.name,
        pathParameters: {'id': pet.id},
        extra: pet,
      ),
      child: CachedNetworkImage(
        cacheKey: pet.imageUrl,
        imageUrl: pet.imageUrl,
        memCacheHeight: 300,
        memCacheWidth: 300,
        fit: .cover,
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
              color: context.colors.primaryContainer,
              image: DecorationImage(
                image: imageProvider,
                fit: .cover,
              ),
              border: Border.all(
                color: context.colors.primary,
                width: 2,
              ),
              borderRadius: .circular(16),
            ),
          );
        },
        placeholder: (context, url) {
          return Container(
            decoration: BoxDecoration(
              color: context.colors.primaryContainer,
              border: Border.all(
                color: context.colors.primary,
                width: 2,
              ),
              borderRadius: .circular(16),
            ),
          );
        },
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
