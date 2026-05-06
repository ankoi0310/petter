import 'package:fpdart/fpdart.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/entities/pet_filter_params.dart';
import 'package:petter/features/pet/domain/repositories/pet_repository.dart';

class WatchFavoritesUseCase
    implements StreamUseCase<List<Pet>, String> {
  const WatchFavoritesUseCase(
    this._favoriteRepository,
    this._petRepository,
  );

  final FavoriteRepository _favoriteRepository;
  final PetRepository _petRepository;

  @override
  ResultStreamList<Pet> call(String uid) {
    return _favoriteRepository.watchFavorites(uid).asyncMap((
      result,
    ) async {
      return result.fold(left, (favorites) async {
        if (favorites.isEmpty) return right(<Pet>[]);

        final ids = favorites.map((f) => f.petId).toList();
        return _petRepository.getPets(
          PetFilterParams(favoriteIds: ids),
        );
      });
    });
  }
}
