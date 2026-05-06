part of 'pet_bloc.dart';

@freezed
class PetState with _$PetState {
  const factory PetState.initial() = _Initial;

  const factory PetState.loading() = _Loading;

  const factory PetState.loaded({
    @Default([]) List<Pet> homePets,
    @Default([]) List<Pet> searchPets,
    @Default([]) List<Pet> userPets,
    Pet? pet,
  }) = _Loaded;

  const factory PetState.creating() = _Creating;
  const factory PetState.createPetSuccess() = _CreatePetSuccess;

  const factory PetState.updating() = _Updating;
  const factory PetState.updatePetSuccess() = _UpdatePetSuccess;

  const factory PetState.error(String message) = _Error;
}
