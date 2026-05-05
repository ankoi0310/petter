import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/error/failure.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/features/species/domain/entities/species.dart';
import 'package:petter/features/species/domain/usecases/watch_species_use_case.dart';

part 'species_event.dart';

part 'species_state.dart';

part 'species_bloc.freezed.dart';

class SpeciesBloc extends Bloc<SpeciesEvent, SpeciesState> {
  SpeciesBloc({required WatchSpeciesUseCase watchSpecies})
    : _watchSpecies = watchSpecies,
      super(const SpeciesState.initial()) {
    on<_Started>((event, emit) async {
      emit(const SpeciesState.loading());

      await _speciesSubcription?.cancel();
      _speciesSubcription = _watchSpecies(NoParams()).listen(
        (result) {
          result.fold((failure) {}, (species) {
            add(SpeciesEvent.speciesUpdated(species));
          });
        },
        onError: (dynamic e) =>
            emit(SpeciesState.error(e.toString())),
      );
    });
    on<_SpeciesUpdated>((event, emit) {
      emit(SpeciesState.loaded(event.species));
    });
  }

  final WatchSpeciesUseCase _watchSpecies;
  StreamSubscription<Either<Failure, List<Species>>>?
  _speciesSubcription;

  @override
  Future<void> close() async {
    await _speciesSubcription?.cancel();
    return super.close();
  }
}
