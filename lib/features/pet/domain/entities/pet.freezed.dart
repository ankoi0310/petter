// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Pet {

 String get id; String get uid; String get name; Address get address; Gender get gender; int? get age; double? get weight; Species get species; String get bleed; String get description; String get imageUrl; DateTime get createdAt; DateTime get updatedAt; bool get isAdopted; bool get isDeleted; DateTime? get deletedAt;
/// Create a copy of Pet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetCopyWith<Pet> get copyWith => _$PetCopyWithImpl<Pet>(this as Pet, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pet&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.age, age) || other.age == age)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.species, species) || other.species == species)&&(identical(other.bleed, bleed) || other.bleed == bleed)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isAdopted, isAdopted) || other.isAdopted == isAdopted)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,uid,name,address,gender,age,weight,species,bleed,description,imageUrl,createdAt,updatedAt,isAdopted,isDeleted,deletedAt);

@override
String toString() {
  return 'Pet(id: $id, uid: $uid, name: $name, address: $address, gender: $gender, age: $age, weight: $weight, species: $species, bleed: $bleed, description: $description, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt, isAdopted: $isAdopted, isDeleted: $isDeleted, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $PetCopyWith<$Res>  {
  factory $PetCopyWith(Pet value, $Res Function(Pet) _then) = _$PetCopyWithImpl;
@useResult
$Res call({
 String id, String uid, String name, Address address, Gender gender, int? age, double? weight, Species species, String bleed, String description, String imageUrl, DateTime createdAt, DateTime updatedAt, bool isAdopted, bool isDeleted, DateTime? deletedAt
});


$AddressCopyWith<$Res> get address;

}
/// @nodoc
class _$PetCopyWithImpl<$Res>
    implements $PetCopyWith<$Res> {
  _$PetCopyWithImpl(this._self, this._then);

  final Pet _self;
  final $Res Function(Pet) _then;

/// Create a copy of Pet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? address = null,Object? gender = null,Object? age = freezed,Object? weight = freezed,Object? species = null,Object? bleed = null,Object? description = null,Object? imageUrl = null,Object? createdAt = null,Object? updatedAt = null,Object? isAdopted = null,Object? isDeleted = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as Species,bleed: null == bleed ? _self.bleed : bleed // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isAdopted: null == isAdopted ? _self.isAdopted : isAdopted // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Pet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get address {
  
  return $AddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// Adds pattern-matching-related methods to [Pet].
extension PetPatterns on Pet {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pet() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pet value)  $default,){
final _that = this;
switch (_that) {
case _Pet():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pet value)?  $default,){
final _that = this;
switch (_that) {
case _Pet() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String uid,  String name,  Address address,  Gender gender,  int? age,  double? weight,  Species species,  String bleed,  String description,  String imageUrl,  DateTime createdAt,  DateTime updatedAt,  bool isAdopted,  bool isDeleted,  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pet() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.address,_that.gender,_that.age,_that.weight,_that.species,_that.bleed,_that.description,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.isAdopted,_that.isDeleted,_that.deletedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String uid,  String name,  Address address,  Gender gender,  int? age,  double? weight,  Species species,  String bleed,  String description,  String imageUrl,  DateTime createdAt,  DateTime updatedAt,  bool isAdopted,  bool isDeleted,  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _Pet():
return $default(_that.id,_that.uid,_that.name,_that.address,_that.gender,_that.age,_that.weight,_that.species,_that.bleed,_that.description,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.isAdopted,_that.isDeleted,_that.deletedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String uid,  String name,  Address address,  Gender gender,  int? age,  double? weight,  Species species,  String bleed,  String description,  String imageUrl,  DateTime createdAt,  DateTime updatedAt,  bool isAdopted,  bool isDeleted,  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _Pet() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.address,_that.gender,_that.age,_that.weight,_that.species,_that.bleed,_that.description,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.isAdopted,_that.isDeleted,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Pet implements Pet {
  const _Pet({required this.id, required this.uid, required this.name, required this.address, required this.gender, required this.age, required this.weight, required this.species, required this.bleed, required this.description, required this.imageUrl, required this.createdAt, required this.updatedAt, required this.isAdopted, required this.isDeleted, required this.deletedAt});
  

@override final  String id;
@override final  String uid;
@override final  String name;
@override final  Address address;
@override final  Gender gender;
@override final  int? age;
@override final  double? weight;
@override final  Species species;
@override final  String bleed;
@override final  String description;
@override final  String imageUrl;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  bool isAdopted;
@override final  bool isDeleted;
@override final  DateTime? deletedAt;

/// Create a copy of Pet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PetCopyWith<_Pet> get copyWith => __$PetCopyWithImpl<_Pet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pet&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.age, age) || other.age == age)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.species, species) || other.species == species)&&(identical(other.bleed, bleed) || other.bleed == bleed)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isAdopted, isAdopted) || other.isAdopted == isAdopted)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,uid,name,address,gender,age,weight,species,bleed,description,imageUrl,createdAt,updatedAt,isAdopted,isDeleted,deletedAt);

@override
String toString() {
  return 'Pet(id: $id, uid: $uid, name: $name, address: $address, gender: $gender, age: $age, weight: $weight, species: $species, bleed: $bleed, description: $description, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt, isAdopted: $isAdopted, isDeleted: $isDeleted, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$PetCopyWith<$Res> implements $PetCopyWith<$Res> {
  factory _$PetCopyWith(_Pet value, $Res Function(_Pet) _then) = __$PetCopyWithImpl;
@override @useResult
$Res call({
 String id, String uid, String name, Address address, Gender gender, int? age, double? weight, Species species, String bleed, String description, String imageUrl, DateTime createdAt, DateTime updatedAt, bool isAdopted, bool isDeleted, DateTime? deletedAt
});


@override $AddressCopyWith<$Res> get address;

}
/// @nodoc
class __$PetCopyWithImpl<$Res>
    implements _$PetCopyWith<$Res> {
  __$PetCopyWithImpl(this._self, this._then);

  final _Pet _self;
  final $Res Function(_Pet) _then;

/// Create a copy of Pet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? address = null,Object? gender = null,Object? age = freezed,Object? weight = freezed,Object? species = null,Object? bleed = null,Object? description = null,Object? imageUrl = null,Object? createdAt = null,Object? updatedAt = null,Object? isAdopted = null,Object? isDeleted = null,Object? deletedAt = freezed,}) {
  return _then(_Pet(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as Species,bleed: null == bleed ? _self.bleed : bleed // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isAdopted: null == isAdopted ? _self.isAdopted : isAdopted // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Pet
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get address {
  
  return $AddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}

// dart format on
