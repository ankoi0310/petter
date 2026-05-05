import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/utils/timestamp_converter.dart';
import 'package:petter/core/utils/typedefs.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  @TimestampConverter()
  const factory UserModel({
    required String id,
    required String email,
    required String name,
    required String phone,
    required String? avatar,
    required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(JsonData json) =>
      _$UserModelFromJson(json);
}
