import 'package:petter/features/favorite/data/models/favorite_model.dart';
import 'package:petter/features/favorite/domain/entities/favorite.dart';

extension FavoriteMapper on FavoriteModel {
  Favorite toEntity() {
    return Favorite(
      id: id,
      uid: uid,
      petId: petId,
      createdAt: createdAt,
    );
  }
}
