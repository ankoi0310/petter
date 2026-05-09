// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddressModel _$AddressModelFromJson(Map<String, dynamic> json) =>
    _AddressModel(
      detail: json['detail'] as String,
      ward: json['ward'] as String,
      province: json['province'] as String,
      wardCode: (json['wardCode'] as num).toInt(),
      provinceCode: (json['provinceCode'] as num).toInt(),
      fullAddress: json['fullAddress'] as String,
    );

Map<String, dynamic> _$AddressModelToJson(_AddressModel instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'ward': instance.ward,
      'province': instance.province,
      'wardCode': instance.wardCode,
      'provinceCode': instance.provinceCode,
      'fullAddress': instance.fullAddress,
    };
