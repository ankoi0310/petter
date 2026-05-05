part of 'species_bloc.dart';

@freezed
class SpeciesEvent with _$SpeciesEvent {
  const factory SpeciesEvent.started() = _Started;
  const factory SpeciesEvent.speciesUpdated(
    List<Species> species,
  ) = _SpeciesUpdated;
}
