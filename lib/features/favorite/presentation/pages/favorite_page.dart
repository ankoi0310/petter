import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/core/widgets/pet_card.dart';
import 'package:petter/features/favorite/presentation/bloc/favorite_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite'), titleSpacing: 0),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    loaded: (pets) {
                      if (pets.isEmpty) {
                        return const Center(child: Text('empty'));
                      }

                      return GridView.builder(
                        padding: const .symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 3 / 4,
                            ),
                        itemCount: pets.length,
                        itemBuilder: (context, index) {
                          final pet = pets[index];
                          return PetCard(
                            pet: pet,
                            iconSize: 16,
                            borderRadius: .circular(12),
                          );
                        },
                      );
                    },
                    error: (message) => Center(child: Text(message)),
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
