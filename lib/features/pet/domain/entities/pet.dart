import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/enums/species.dart';
import 'package:petter/features/pet/domain/entities/address.dart';

part 'pet.freezed.dart';

@freezed
abstract class Pet with _$Pet {
  const factory Pet({
    required String id,
    required String uid,
    required String name,
    required Address address,
    required Gender gender,
    required int? age,
    required double? weight,
    required Species species,
    required String bleed,
    required String description,
    required String imageUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    required bool isAdopted,
    required bool isDeleted,
  }) = _Pet;
}
