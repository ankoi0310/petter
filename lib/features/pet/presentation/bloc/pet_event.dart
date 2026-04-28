part of 'pet_bloc.dart';

@freezed
class PetEvent with _$PetEvent {
  const factory PetEvent.getPets() = _GetPets;
  const factory PetEvent.getUserPets(String uid) = _GetUserPets;
  const factory PetEvent.getPet(String id) = _GetPet;
  const factory PetEvent.createPet(CreatePetParams params) =
      _CreatePet;
  const factory PetEvent.updatePet(UpdatePetParams params) =
      _UpdatePet;
  const factory PetEvent.deletePet(String id) = _DeletePet;
}
