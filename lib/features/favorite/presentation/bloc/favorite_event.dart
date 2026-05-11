part of 'favorite_bloc.dart';

@freezed
class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.getFavoritePets() = _GetFavoritePets;

  const factory FavoriteEvent.toggleFavorite(FavoriteParams params) =
      _ToggleFavorite;
}
