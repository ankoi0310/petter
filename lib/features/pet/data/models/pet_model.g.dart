// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PetModel _$PetModelFromJson(Map<String, dynamic> json) => _PetModel(
  id: json['id'] as String,
  uid: json['uid'] as String,
  name: json['name'] as String,
  address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  age: (json['age'] as num?)?.toInt(),
  weight: (json['weight'] as num?)?.toDouble(),
  species: $enumDecode(_$SpeciesEnumMap, json['species']),
  bleed: json['bleed'] as String,
  description: json['description'] as String,
  imageUrl: json['imageUrl'] as String,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
  isAdopted: json['isAdopted'] as bool? ?? false,
  isDeleted: json['isDeleted'] as bool? ?? false,
  deletedAt: const TimestampConverterNullable().fromJson(json['deletedAt']),
);

Map<String, dynamic> _$PetModelToJson(_PetModel instance) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'address': instance.address.toJson(),
  'gender': _$GenderEnumMap[instance.gender]!,
  'age': instance.age,
  'weight': instance.weight,
  'species': _$SpeciesEnumMap[instance.species]!,
  'bleed': instance.bleed,
  'description': instance.description,
  'imageUrl': instance.imageUrl,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
  'isAdopted': instance.isAdopted,
  'isDeleted': instance.isDeleted,
  'deletedAt': const TimestampConverterNullable().toJson(instance.deletedAt),
};

const _$GenderEnumMap = {Gender.male: 'male', Gender.female: 'female'};

const _$SpeciesEnumMap = {
  Species.cat: 'cat',
  Species.dog: 'dog',
  Species.bird: 'bird',
  Species.rabbit: 'rabbit',
  Species.mouse: 'mouse',
};
