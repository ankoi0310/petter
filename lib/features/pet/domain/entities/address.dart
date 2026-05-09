import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';

@freezed
abstract class Address with _$Address {
  const factory Address({
    required String detail,
    required String ward,
    required String province,
    required int wardCode,
    required int provinceCode,
    required String fullAddress,
  }) = _Address;
}
