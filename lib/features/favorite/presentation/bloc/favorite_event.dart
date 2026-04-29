part of 'favorite_bloc.dart';

@freezed
class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.getFavorites(String uid) =
      _GetFavorites;

  const factory FavoriteEvent.toggleFavorite(FavoriteParams params) =
      _ToggleFavorite;
}
