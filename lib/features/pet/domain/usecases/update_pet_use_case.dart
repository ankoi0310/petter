import 'dart:io';

import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/repositories/pet_repository.dart';

class UpdatePetParams {
  const UpdatePetParams({
    required this.id,
    this.currentImageUrl,
    this.name,
    this.address,
    this.gender,
    this.age,
    this.weight,
    this.speciesId,
    this.bleed,
    this.description,
    this.imageFile,
    this.isAdopted,
  });

  final String id;
  final String? name;
  final String? address;
  final Gender? gender;
  final String? age;
  final String? weight;
  final String? speciesId;
  final String? bleed;
  final String? description;
  final String? currentImageUrl;
  final File? imageFile;
  final bool? isAdopted;

  JsonData toJson() => {
    if (name != null && name!.isNotEmpty) 'name': name,
    if (address != null && address!.isNotEmpty) 'address': address,
    if (gender != null) 'gender': gender?.name,
    if (age != null) 'age': age,
    if (weight != null) 'weight': weight,
    if (speciesId != null && speciesId!.isNotEmpty)
      'speciesId': speciesId,
    if (bleed != null && bleed!.isNotEmpty) 'species': bleed,
    if (description != null && description!.isNotEmpty)
      'description': description,
    if (isAdopted != null) 'isAdopted': isAdopted,
  };
}

class UpdatePetUseCase implements UseCase<Pet, UpdatePetParams> {
  const UpdatePetUseCase(this._repository);

  final PetRepository _repository;

  @override
  ResultFuture<Pet> call(UpdatePetParams params) {
    return _repository.updatePet(params);
  }
}
