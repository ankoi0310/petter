import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petter/core/widgets/pet_card.dart';
import 'package:petter/features/favorite/presentation/bloc/favorite_bloc.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();

    context.read<FavoriteBloc>().add(const .getFavoritePets());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yêu thích'), titleSpacing: 0),
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
                        return const Padding(
                          padding: .all(16),
                          child: Center(
                            child: Text(
                              'Bạn chưa thêm bé nào vào danh sách yêu thích',
                            ),
                          ),
                        );
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
