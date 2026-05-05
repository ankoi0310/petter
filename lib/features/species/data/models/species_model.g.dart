// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpeciesModel _$SpeciesModelFromJson(Map<String, dynamic> json) =>
    _SpeciesModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$SpeciesModelToJson(_SpeciesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'isActive': instance.isActive,
    };
