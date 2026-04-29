import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/favorite/domain/entities/favorite.dart';

abstract class FavoriteRepository {
  ResultFuture<List<Favorite>> getFavorites(String uid);

  ResultFuture<Favorite> addToFavorite({
    required String uid,
    required String petId,
  });

  VoidFuture removeFromFavorite({
    required String uid,
    required String petId,
  });
}
