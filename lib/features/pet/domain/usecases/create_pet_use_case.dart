import 'dart:io';

import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/repositories/pet_repository.dart';

class CreatePetParams {
  const CreatePetParams({
    required this.uid,
    required this.name,
    required this.address,
    required this.gender,
    required this.category,
    required this.species,
    this.age,
    this.weight,
    required this.description,
    this.imageFile,
  });

  final String uid;
  final String name;
  final String address;
  final Gender gender;
  final String? age;
  final String? weight;
  final String category;
  final String species;
  final String description;
  final File? imageFile;
}

class CreatePetUseCase implements UseCase<Pet, CreatePetParams> {
  const CreatePetUseCase(this._repository);

  final PetRepository _repository;

  @override
  ResultFuture<Pet> call(CreatePetParams params) {
    return _repository.createPet(params);
  }
}
