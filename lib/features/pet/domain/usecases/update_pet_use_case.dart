import 'dart:io';

import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/usecases/usecase.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';
import 'package:petter/features/pet/domain/repositories/pet_repository.dart';
import 'package:petter/features/species/domain/entities/species.dart';
import 'package:vn_provinces_api/vn_provinces_api.dart';

class UpdatePetParams {
  const UpdatePetParams({
    required this.id,
    this.currentImageUrl,
    this.name,
    this.addressDetail,
    this.province,
    this.ward,
    this.fullAddress,
    this.gender,
    this.age,
    this.weight,
    this.species,
    this.bleed,
    this.description,
    this.imageFile,
    this.isAdopted,
  });

  final String id;
  final String? name;
  final String? addressDetail;
  final Province? province;
  final Ward? ward;
  final String? fullAddress;
  final Gender? gender;
  final String? age;
  final String? weight;
  final Species? species;
  final String? bleed;
  final String? description;
  final String? currentImageUrl;
  final File? imageFile;
  final bool? isAdopted;

  JsonData toJson() => {
    if (name != null && name!.isNotEmpty) 'name': name,
    'address': {
      if (addressDetail != null) 'detail': addressDetail,
      if (province != null) ...{
        'province': province?.name,
        'provinceCode': province?.code,
      },
      if (ward != null) ...{
        'ward': ward?.name,
        'wardCode': ward?.code,
      },
      if (fullAddress != null && fullAddress?.isNotEmpty == true)
        'fullAddress': fullAddress,
    },
    if (gender != null) 'gender': gender?.name,
    if (age != null) 'age': age,
    if (weight != null) 'weight': weight,
    if (species != null) 'speciesId': species!.id,
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
