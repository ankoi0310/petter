import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petter/core/utils/typedefs.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
abstract class AddressModel with _$AddressModel {
  const factory AddressModel({
    required String detail,
    required String ward,
    required String province,
    required int wardCode,
    required int provinceCode,
    required String fullAddress,
  }) = _AddressModel;

  factory AddressModel.fromJson(JsonData json) =>
      _$AddressModelFromJson(json);
}
