import 'dart:io';

import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/enums/species.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/repositories/pet_repository.dart';
import 'package:vn_provinces_api/vn_provinces_api.dart';

class CreatePetParams {
  const CreatePetParams({
    required this.name,
    required this.addressDetail,
    required this.province,
    required this.ward,
    required this.fullAddress,
    required this.gender,
    required this.species,
    required this.bleed,
    required this.age,
    required this.weight,
    required this.description,
    required this.imageFile,
  });

  final String name;
  final String addressDetail;
  final Province province;
  final Ward ward;
  final String fullAddress;
  final Gender gender;
  final int? age;
  final double? weight;
  final Species species;
  final String bleed;
  final String description;
  final File imageFile;
}

class CreatePetUseCase implements UseCase<Pet, CreatePetParams> {
  const CreatePetUseCase(this._repository);

  final PetRepository _repository;

  @override
  ResultFuture<Pet> call(CreatePetParams params) {
    return _repository.createPet(params);
  }
}
