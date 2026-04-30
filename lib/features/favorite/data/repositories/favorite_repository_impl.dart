import 'package:fpdart/fpdart.dart';
import 'package:petter/core/error/exception.dart';
import 'package:petter/core/error/failure.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/favorite/data/datasources/favorite_remote_data_source.dart';
import 'package:petter/features/favorite/data/mapper/favorite_mapper.dart';
import 'package:petter/features/favorite/domain/entities/favorite.dart';
import 'package:petter/features/favorite/domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  const FavoriteRepositoryImpl(this._remoteDataSource);

  final FavoriteRemoteDataSource _remoteDataSource;

  @override
  ResultStreamList<Favorite> watchFavorites(String uid) {
    return _remoteDataSource
        .watchFavorites(uid)
        .map<Either<Failure, List<Favorite>>>((models) {
          final entities = models
              .map((model) => model.toEntity())
              .toList();
          return right(entities);
        })
        .handleError((dynamic error) {
          return left<Failure, List<Favorite>>(
            Failure.server(error.toString()),
          );
        });
  }

  @override
  ResultFuture<Favorite> addToFavorite({
    required String uid,
    required String petId,
  }) async {
    try {
      final model = await _remoteDataSource.addToFavorite(
        uid: uid,
        petId: petId,
      );
      return right(model.toEntity());
    } on ServerException catch (e) {
      return left(Failure.server(e.message));
    }
  }

  @override
  VoidFuture removeFromFavorite({
    required String uid,
    required String petId,
  }) async {
    try {
      await _remoteDataSource.removeFromFavorite(
        uid: uid,
        petId: petId,
      );
      return right(unit);
    } on ServerException catch (e) {
      return left(Failure.server(e.message));
    }
  }
}
