import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/entities/pet_filter_params.dart';
import 'package:petter/features/pet/domain/usecases/create_pet_use_case.dart';
import 'package:petter/features/pet/domain/usecases/update_pet_use_case.dart';

abstract class PetRepository {
  ResultFuture<List<Pet>> getPets(PetFilterParams params);

  ResultFuture<List<Pet>> getUserPets(
    String uid,
  ); // maybe search update
  ResultFuture<Pet> getPet(String id);

  ResultFuture<Pet> createPet(CreatePetParams params);

  ResultFuture<Pet> updatePet(UpdatePetParams params);
}
