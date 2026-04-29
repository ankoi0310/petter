// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PetModel _$PetModelFromJson(Map<String, dynamic> json) => _PetModel(
  id: json['id'] as String,
  uid: json['uid'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  age: json['age'] as String,
  weight: json['weight'] as String,
  categoryId: json['categoryId'] as String,
  species: json['species'] as String,
  description: json['description'] as String,
  imageUrl: json['imageUrl'] as String,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
  isAdopted: json['isAdopted'] as bool,
  isDeleted: json['isDeleted'] as bool,
);

Map<String, dynamic> _$PetModelToJson(_PetModel instance) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'address': instance.address,
  'gender': _$GenderEnumMap[instance.gender]!,
  'age': instance.age,
  'weight': instance.weight,
  'categoryId': instance.categoryId,
  'species': instance.species,
  'description': instance.description,
  'imageUrl': instance.imageUrl,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
  'isAdopted': instance.isAdopted,
  'isDeleted': instance.isDeleted,
};

const _$GenderEnumMap = {Gender.male: 'male', Gender.female: 'female'};
