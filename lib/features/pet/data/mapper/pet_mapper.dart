import 'package:petter/features/pet/data/models/pet_model.dart';
import 'package:petter/features/pet/domain/entities/pet.dart';

extension PetMapper on PetModel {
  Pet toEntity() {
    return Pet(
      id: id,
      uid: uid,
      name: name,
      gender: gender,
      age: age,
      weight: weight,
      description: description,
      imageUrl: imageUrl,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isAdopted: isAdopted,
      isDeleted: isDeleted,
    );
  }
}
