import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/favorite/domain/entities/favorite.dart';
import 'package:petter/features/favorite/domain/repositories/favorite_repository.dart';

class GetFavoritesUseCase implements UseCase<List<Favorite>, String> {
  const GetFavoritesUseCase(this._repository);

  final FavoriteRepository _repository;

  @override
  ResultFuture<List<Favorite>> call(String uid) async {
    return _repository.getFavorites(uid);
  }
}
