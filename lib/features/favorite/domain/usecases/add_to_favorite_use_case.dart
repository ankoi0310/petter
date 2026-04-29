import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/favorite/domain/entities/favorite.dart';
import 'package:petter/features/favorite/domain/entities/favorite_params.dart';
import 'package:petter/features/favorite/domain/repositories/favorite_repository.dart';

class AddToFavoriteUseCase
    implements UseCase<Favorite, FavoriteParams> {
  const AddToFavoriteUseCase(this._repository);

  final FavoriteRepository _repository;

  @override
  ResultFuture<Favorite> call(FavoriteParams params) {
    return _repository.addToFavorite(
      uid: params.uid,
      petId: params.petId,
    );
  }
}
