import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/error/failure.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/features/auth/domain/usecases/watch_auth_state_use_case.dart';
import 'package:petter/features/favorite/domain/entities/favorite.dart';
import 'package:petter/features/favorite/domain/entities/favorite_params.dart';
import 'package:petter/features/favorite/domain/usecases/add_to_favorite_use_case.dart';
import 'package:petter/features/favorite/domain/usecases/get_favorites_use_case.dart';
import 'package:petter/features/favorite/domain/usecases/remove_from_favorite_use_case.dart';
import 'package:petter/features/user/domain/entities/user.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

part 'favorite_bloc.freezed.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc({
    required WatchAuthStateUseCase watchAuthState,
    required GetFavoritesUseCase getFavorites,
    required AddToFavoriteUseCase addToFavorite,
    required RemoveFromFavoriteUseCase removeFromFavorite,
  }) : _watchAuthState = watchAuthState,
       _getFavorites = getFavorites,
       _addToFavorite = addToFavorite,
       _removeFromFavorite = removeFromFavorite,
       super(const FavoriteState.initial()) {
    on<_GetFavorites>(_onGetFavorites);
    on<_ToggleFavorite>(_onToggleFavorite);

    _authSubscription = _watchAuthState(NoParams()).listen((user) {
      if (user != null) {
        add(FavoriteEvent.getFavorites(user.uid));
      }
    });
  }

  final WatchAuthStateUseCase _watchAuthState;
  final GetFavoritesUseCase _getFavorites;
  final AddToFavoriteUseCase _addToFavorite;
  final RemoveFromFavoriteUseCase _removeFromFavorite;

  StreamSubscription<User?>? _authSubscription;

  FutureOr<void> _onToggleFavorite(
    _ToggleFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    final currentState = state;
    if (currentState is! _Loaded) return;

    final currentList = List<Favorite>.from(currentState.favorites);
    final isExist = currentList.any((p) {
      return p.uid == event.params.uid &&
          p.petId == event.params.petId;
    });

    try {
      if (isExist) {
        final result = await _removeFromFavorite(event.params);
        result.fold(
          (failure) =>
              emit(FavoriteState.error(_mapFailure(failure))),
          (_) {
            currentList.removeWhere(
              (f) =>
                  f.uid == event.params.uid &&
                  f.petId == event.params.petId,
            );
            emit(FavoriteState.loaded(currentList));
          },
        );
      } else {
        final result = await _addToFavorite(event.params);
        result.fold(
          (failure) =>
              emit(FavoriteState.error(_mapFailure(failure))),
          (newFavorite) {
            currentList.add(newFavorite);
            emit(FavoriteState.loaded(currentList));
          },
        );
      }
    } catch (e) {
      // Nếu lỗi thì hoàn tác (rollback) lại danh sách cũ
      emit(FavoriteState.loaded(currentState.favorites));
      // Hiện thông báo lỗi...
    }
  }

  Future<void> _onGetFavorites(
    _GetFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(const FavoriteState.loading());

    final result = await _getFavorites(event.uid);

    result.fold(
      (failure) => emit(
        FavoriteState.error(
          failure.when(
            auth: (message) => message,
            chat: (message) => message,
            server: (message) => message,
            unknown: (message) => message,
          ),
        ),
      ),
      (favorites) {
        print('Fetch favorites successfully');
        emit(FavoriteState.loaded(List.unmodifiable(favorites)));
      },
    );
  }

  String _mapFailure(Failure failure) {
    return failure.when(
      auth: (message) => message,
      chat: (message) => message,
      server: (message) => message,
      unknown: (message) => message,
    );
  }

  @override
  Future<void> close() async {
    await _authSubscription?.cancel();
    return super.close();
  }
}
