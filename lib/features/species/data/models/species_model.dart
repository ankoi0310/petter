import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/utils/typedefs.dart';

part 'species_model.freezed.dart';
part 'species_model.g.dart';

@freezed
abstract class SpeciesModel with _$SpeciesModel {
  const factory SpeciesModel({
    required String id,
    required String name,
    required String imageUrl,
    required bool isActive,
  }) = _SpeciesModel;

  factory SpeciesModel.fromJson(JsonData json) =>
      _$SpeciesModelFromJson(json);
}
