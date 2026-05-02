// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adoption_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdoptionRequestModel _$AdoptionRequestModelFromJson(
  Map<String, dynamic> json,
) => _AdoptionRequestModel(
  id: json['id'] as String,
  petId: json['petId'] as String,
  petName: json['petName'] as String,
  petImageUrl: json['petImageUrl'] as String,
  adopterId: json['adopterId'] as String,
  adopterName: json['adopterName'] as String,
  adopterAvatar: json['adopterAvatar'] as String,
  adopterPhone: json['adopterPhone'] as String,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
  status:
      $enumDecodeNullable(_$RequestStatusEnumMap, json['status']) ??
      RequestStatus.pending,
  rejectionReason: json['rejectionReason'] as String?,
);

Map<String, dynamic> _$AdoptionRequestModelToJson(
  _AdoptionRequestModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'petId': instance.petId,
  'petName': instance.petName,
  'petImageUrl': instance.petImageUrl,
  'adopterId': instance.adopterId,
  'adopterName': instance.adopterName,
  'adopterAvatar': instance.adopterAvatar,
  'adopterPhone': instance.adopterPhone,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
  'status': _$RequestStatusEnumMap[instance.status]!,
  'rejectionReason': instance.rejectionReason,
};

const _$RequestStatusEnumMap = {
  RequestStatus.pending: 'pending',
  RequestStatus.reviewing: 'reviewing',
  RequestStatus.approved: 'approved',
  RequestStatus.rejected: 'rejected',
  RequestStatus.cancelled: 'cancelled',
};
