import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/utils/typedefs.dart';

part 'pet_model.freezed.dart';

part 'pet_model.g.dart';

@freezed
abstract class PetModel with _$PetModel {
  const factory PetModel({
    required String id,
    required String uid,
    required String name,
    required Gender gender,
    required double weight,
    required String age,
    required String description,
    required String imageUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    required bool isAdopted,
    required bool isDeleted,
  }) = _PetModel;

  factory PetModel.fromJson(JsonData json) =>
      _$PetModelFromJson(json);
}
