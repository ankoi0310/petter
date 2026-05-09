import 'dart:io';

import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/repositories/pet_repository.dart';
import 'package:vn_provinces/vn_provinces.dart';

class CreatePetParams {
  const CreatePetParams({
    required this.name,
    required this.addressDetail,
    required this.province,
    required this.ward,
    required this.fullAddress,
    required this.gender,
    required this.speciesId,
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
  final String age;
  final String weight;
  final String speciesId;
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
