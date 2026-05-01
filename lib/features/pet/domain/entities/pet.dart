import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/enums/pet_status.dart';

part 'pet.freezed.dart';

@freezed
abstract class Pet with _$Pet {
  const factory Pet({
    required String id,
    required String uid,
    required String name,
    required String address,
    required Gender gender,
    required String age,
    required String weight,
    required String categoryId,
    required String species,
    required String description,
    required String imageUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    required PetStatus status,
    required bool isDeleted,
  }) = _Pet;
}
