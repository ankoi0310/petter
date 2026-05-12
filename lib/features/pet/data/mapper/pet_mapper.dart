import 'package:petter/features/pet/data/mapper/address_mapper.dart';
import 'package:petter/features/pet/data/models/pet_model.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';

extension PetMapper on PetModel {
  Pet toEntity() {
    return Pet(
      id: id,
      uid: uid,
      address: address.toEntity(),
      name: name,
      gender: gender,
      species: species,
      bleed: bleed,
      age: age,
      weight: weight,
      description: description,
      imageUrl: imageUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isAdopted: isAdopted,
      isDeleted: isDeleted,
      deletedAt: deletedAt,
    );
  }
}
