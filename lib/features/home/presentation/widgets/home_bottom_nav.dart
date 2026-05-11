import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/core/router/router.dart';
import 'package:petter/features/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:petter/features/pet/presentation/bloc/pet_bloc.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({super.key});

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
      child: Row(
        mainAxisAlignment: .spaceAround,
        children: [
          const Icon(Iconsax.home_2_copy),
          GestureDetector(
            onTap: () async {
              context.read<FavoriteBloc>().add(
                const .getFavoritePets(),
              );
              await context.pushNamed(AppRoutes.favorite.name);
            },
            child: const Icon(Iconsax.heart_copy),
          ),
          GestureDetector(
            onTap: () async {
              context.read<PetBloc>().add(.getUserPets());
              await context.pushNamed(AppRoutes.myPet.name);
            },
            child: const Icon(Iconsax.pet_copy),
          ),
          GestureDetector(
            onTap: () =>
                context.pushNamed(AppRoutes.adoptionRequest.name),
            child: const Icon(Iconsax.receipt_edit_copy),
          ),
          GestureDetector(
            onTap: () => context.pushNamed(AppRoutes.account.name),
            child: const Icon(Iconsax.user_copy),
          ),
        ],
      ),
    );
  }
}
