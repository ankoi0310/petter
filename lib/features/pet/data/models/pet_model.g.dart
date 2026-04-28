// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PetModel _$PetModelFromJson(Map<String, dynamic> json) => _PetModel(
  id: json['id'] as String,
  uid: json['uid'] as String,
  name: json['name'] as String,
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  weight: (json['weight'] as num).toDouble(),
  age: json['age'] as String,
  description: json['description'] as String,
  imageUrl: json['imageUrl'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  isAdopted: json['isAdopted'] as bool,
  isDeleted: json['isDeleted'] as bool,
);

Map<String, dynamic> _$PetModelToJson(_PetModel instance) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'gender': _$GenderEnumMap[instance.gender]!,
  'weight': instance.weight,
  'age': instance.age,
  'description': instance.description,
  'imageUrl': instance.imageUrl,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'isAdopted': instance.isAdopted,
  'isDeleted': instance.isDeleted,
};

const _$GenderEnumMap = {Gender.male: 'male', Gender.female: 'female'};
