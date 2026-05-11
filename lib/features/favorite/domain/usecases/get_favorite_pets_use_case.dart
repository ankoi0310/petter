import 'package:fpdart/fpdart.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/repositories/pet_repository.dart';

class GetFavoritePetsUseCase implements UseCase<List<Pet>, NoParams> {
  const GetFavoritePetsUseCase(
    this._favoriteRepository,
    this._petRepository,
  );

  final FavoriteRepository _favoriteRepository;
  final PetRepository _petRepository;

  @override
  ResultFuture<List<Pet>> call(NoParams params) {
    return _favoriteRepository.getFavoritePets().then((result) async {
      return result.fold(left, (favorites) async {
        if (favorites.isEmpty) return right(<Pet>[]);

        final ids = favorites.map((f) => f.petId).toList();
        return _petRepository.getFavoritePets(ids);
      });
    });
  }
}
