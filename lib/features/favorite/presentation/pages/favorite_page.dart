import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    // final uid = context.read<AuthBloc>().state.maybeWhen(
    //   authenticated: (user) => user.uid,
    //   orElse: () => null,
    // );
    //
    // if (uid != null) {
    //   context.read<FavoriteBloc>().add(
    //     FavoriteEvent.getFavorites(uid),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite'), titleSpacing: 0),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            loaded: (favorites) {
              if (favorites.isEmpty) {
                return const Center(child: Text('empty'));
              }

              return Center(child: Text('${favorites.length}'));
            },
            error: (message) => Center(child: Text(message)),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
