import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/utils/timestamp_converter.dart';
import 'package:petter/core/utils/typedefs.dart';

part 'favorite_model.freezed.dart';

part 'favorite_model.g.dart';

@freezed
abstract class FavoriteModel with _$FavoriteModel {
  const factory FavoriteModel({
    required String id,
    required String uid,
    required String petId,
    @TimestampConverter() required DateTime createdAt,
  }) = _FavoriteModel;

  factory FavoriteModel.fromJson(JsonData json) =>
      _$FavoriteModelFromJson(json);
}
