part of 'species_bloc.dart';

@freezed
abstract class SpeciesState with _$SpeciesState {
  const factory SpeciesState.initial() = _Initial;
  const factory SpeciesState.loading() = _Loading;
  const factory SpeciesState.loaded(List<Species> species) =
      _Loaded;
  const factory SpeciesState.error(String message) = _Error;
}
