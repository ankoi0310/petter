import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/favorite/domain/entities/favorite_params.dart';
import 'package:petter/features/favorite/domain/repositories/favorite_repository.dart';

class RemoveFromFavoriteUseCase
    implements UseCase<void, FavoriteParams> {
  const RemoveFromFavoriteUseCase(this._repository);

  final FavoriteRepository _repository;

  @override
  VoidFuture call(FavoriteParams params) {
    return _repository.removeFromFavorite(
      uid: params.uid,
      petId: params.petId,
    );
  }
}
