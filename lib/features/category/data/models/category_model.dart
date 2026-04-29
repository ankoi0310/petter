import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/utils/typedefs.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String id,
    required String name,
    required String imageUrl,
    required bool isActive,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(JsonData json) =>
      _$CategoryModelFromJson(json);
}
