import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/core/widgets/button.dart';
import 'package:petter/core/widgets/like_button.dart';
import 'package:petter/core/widgets/pet_image_container.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PetCard extends StatelessWidget {
  const PetCard({
    required this.pet,
    this.editable = false,
    this.iconSize,
    this.borderRadius,
    super.key,
  });

  final Pet pet;
  final bool editable;
  final double? iconSize;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<PetBloc>().state.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return Skeletonizer(
      enabled: isLoading,
      child: Stack(
        children: [
          PetImageContainer(pet: pet),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const .symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: const .vertical(bottom: .circular(16)),
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
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    pet.name,
                    style: context.textTheme.headlineMedium?.copyWith(
                      color: context.colors.tertiaryContainer,
                    ),
                  ),
                  Text(
                    pet.bleed,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colors.surface,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                ],
              ),
            ),
          ),

          if (editable) ...[
            Positioned(
              top: 8,
              right: 8,
              child: Skeleton.keep(
                child: AppIconButton(
                  icon: Iconsax.trash_copy,
                  iconSize: iconSize,
                  borderRadius: borderRadius,
                ),
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Skeleton.keep(
                child: AppIconButton(
                  onTap: () => context.pushNamed(
                    AppRoutes.myPetUpdate.name,
                    pathParameters: {'id': pet.id},
                    extra: pet,
                  ),
                  icon: Iconsax.edit_2_copy,
                  iconSize: iconSize,
                  borderRadius: borderRadius,
                ),
              ),
            ),
          ] else ...[
            Positioned(
              top: 8,
              right: 8,
              child: Skeleton.keep(
                child: LikeButton(
                  petId: pet.id,
                  iconSize: iconSize,
                  borderRadius: borderRadius,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
