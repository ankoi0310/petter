part of 'favorite_bloc.dart';

@freezed
class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.watchFavorites(String uid) =
      _WatchFavorites;

  const factory FavoriteEvent.toggleFavorite(FavoriteParams params) =
      _ToggleFavorite;
}
