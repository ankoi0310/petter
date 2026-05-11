import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/enums/gender.dart';
import 'package:petter/core/enums/species.dart';

part 'pet_filter_params.freezed.dart';

@freezed
abstract class PetFilterParams with _$PetFilterParams {
  const factory PetFilterParams({
    List<String>? favoriteIds,
    String? searchTerm,
    Species? species,
    Gender? gender,
    double? minWeight,
    double? maxWeight,
    int? limit,
    int? minAge,
    int? maxAge,
    @Default(true) bool showAdopted,
    @Default('createdAt') String sortBy,
    @Default(true) bool descending,
  }) = _PetFilterParams;

  factory PetFilterParams.empty() => const PetFilterParams();
}
