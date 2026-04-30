import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/error/failure.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/features/auth/domain/usecases/watch_auth_state_use_case.dart';
import 'package:petter/features/favorite/domain/entities/favorite_params.dart';
import 'package:petter/features/favorite/domain/usecases/add_to_favorite_use_case.dart';
import 'package:petter/features/favorite/domain/usecases/remove_from_favorite_use_case.dart';
import 'package:petter/features/favorite/domain/usecases/watch_favorites_use_case.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/user/domain/entities/user.dart';

part 'favorite_bloc.freezed.dart';
part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc({
    required WatchAuthStateUseCase watchAuthState,
    required WatchFavoritesUseCase watchFavorites,
    required AddToFavoriteUseCase addToFavorite,
    required RemoveFromFavoriteUseCase removeFromFavorite,
  }) : _watchAuthState = watchAuthState,
       _watchFavorites = watchFavorites,
       _addToFavorite = addToFavorite,
       _removeFromFavorite = removeFromFavorite,
       super(const FavoriteState.initial()) {
    on<_WatchFavorites>(_onWatchFavorites);
    on<_ToggleFavorite>(_onToggleFavorite);

    _authSubscription = _watchAuthState(NoParams()).listen((result) {
      result.fold((failure) {}, (user) {
        if (user != null) {
          add(FavoriteEvent.watchFavorites(user.uid));
        }
      });
    });
  }

  final WatchAuthStateUseCase _watchAuthState;
  final WatchFavoritesUseCase _watchFavorites;
  final AddToFavoriteUseCase _addToFavorite;
  final RemoveFromFavoriteUseCase _removeFromFavorite;

  StreamSubscription<Either<Failure, User?>>? _authSubscription;

  Future<void> _onWatchFavorites(
    _WatchFavorites event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(const FavoriteState.loading());

    await emit.onEach(
      _watchFavorites(event.uid),
      onData: (result) => result.fold(
        (failure) => emit(FavoriteState.error(_mapFailure(failure))),
        (pets) => emit(FavoriteState.loaded(List.unmodifiable(pets))),
      ),
      onError: (error, _) =>
          emit(FavoriteState.error(error.toString())),
    );
  }

  FutureOr<void> _onToggleFavorite(
    _ToggleFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    final currentState = state;
    if (currentState is! _Loaded) return;

    final currentList = List<Pet>.from(currentState.pets);
    final isExist = currentList.any(
      (pet) => pet.id == event.params.petId,
    );

    if (isExist) {
      final result = await _removeFromFavorite(event.params);
      result.fold(
        (failure) => emit(FavoriteState.error(_mapFailure(failure))),
        (_) {
          currentList.removeWhere((p) => p.id == event.params.petId);
          emit(FavoriteState.loaded(List.unmodifiable(currentList)));
        },
      );
    } else {
      final result = await _addToFavorite(event.params);
      result.fold(
        (failure) => emit(FavoriteState.error(_mapFailure(failure))),
        (_) {},
      );
    }
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
