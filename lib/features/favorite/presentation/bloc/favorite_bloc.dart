import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/features/favorite/domain/entities/favorite_params.dart';
import 'package:petter/features/favorite/domain/usecases/add_to_favorite_use_case.dart';
import 'package:petter/features/favorite/domain/usecases/get_favorite_pets_use_case.dart';
import 'package:petter/features/favorite/domain/usecases/remove_from_favorite_use_case.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';

part 'favorite_bloc.freezed.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc({
    required GetFavoritePetsUseCase getFavoritePets,
    required AddToFavoriteUseCase addToFavorite,
    required RemoveFromFavoriteUseCase removeFromFavorite,
  }) : _getFavoritePets = getFavoritePets,
       _addToFavorite = addToFavorite,
       _removeFromFavorite = removeFromFavorite,
       super(const .initial()) {
    on<_GetFavoritePets>(_onGetFavoritePets);
    on<_ToggleFavorite>(_onToggleFavorite);
  }

  final GetFavoritePetsUseCase _getFavoritePets;
  final AddToFavoriteUseCase _addToFavorite;
  final RemoveFromFavoriteUseCase _removeFromFavorite;

  Future<void> _onGetFavoritePets(
    _GetFavoritePets event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(const .loading());

    final result = await _getFavoritePets(NoParams());

    result.fold(
      (failure) => emit(.error(failure.message)),
      (pets) => emit(.loaded(List.unmodifiable(pets))),
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
      result.fold((failure) => emit(.error(failure.message)), (_) {
        currentList.removeWhere((p) => p.id == event.params.petId);
        emit(.loaded(List.unmodifiable(currentList)));
      });
    } else {
      final result = await _addToFavorite(event.params);
      result.fold((failure) => emit(.error(failure.message)), (_) {});
    }
  }
}
