import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/enums/species.dart';
import 'package:petter/core/utils/timestamp_converter.dart';
import 'package:petter/core/utils/typedefs.dart';
import 'package:petter/features/pet/data/models/address_model.dart';

part 'pet_model.freezed.dart';

part 'pet_model.g.dart';

@freezed
abstract class PetModel with _$PetModel {
  const factory PetModel({
    required String id,
    required String uid,
    required String name,
    required AddressModel address,
    required Gender gender,
    required int? age,
    required double? weight,
    required Species species,
    required String bleed,
    required String description,
    required String imageUrl,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
    @Default(false) bool isAdopted,
    @Default(false) bool isDeleted,
    @TimestampConverterNullable() DateTime? deletedAt,
  }) = _PetModel;

  factory PetModel.fromJson(JsonData json) =>
      _$PetModelFromJson(json);
}
