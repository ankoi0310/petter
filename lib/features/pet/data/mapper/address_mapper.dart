import 'package:petter/features/pet/data/models/address_model.dart';
import 'package:petter/features/pet/domain/entities/address.dart';

extension AddressMapper on AddressModel {
  Address toEntity() {
    return Address(
      detail: detail,
      ward: ward,
      province: province,
      wardCode: wardCode,
      provinceCode: provinceCode,
      fullAddress: fullAddress,
    );
  }
}
