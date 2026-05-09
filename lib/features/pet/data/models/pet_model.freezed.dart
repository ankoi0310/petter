// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PetModel {

 String get id; String get uid; String get name; AddressModel get address; Gender get gender; String get age; String get weight; String get speciesId; String get bleed; String get description; String get imageUrl; DateTime get createdAt; DateTime get updatedAt; bool get isAdopted; bool get isDeleted;
/// Create a copy of PetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetModelCopyWith<PetModel> get copyWith => _$PetModelCopyWithImpl<PetModel>(this as PetModel, _$identity);

  /// Serializes this PetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.age, age) || other.age == age)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.speciesId, speciesId) || other.speciesId == speciesId)&&(identical(other.bleed, bleed) || other.bleed == bleed)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isAdopted, isAdopted) || other.isAdopted == isAdopted)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,address,gender,age,weight,speciesId,bleed,description,imageUrl,createdAt,updatedAt,isAdopted,isDeleted);

@override
String toString() {
  return 'PetModel(id: $id, uid: $uid, name: $name, address: $address, gender: $gender, age: $age, weight: $weight, speciesId: $speciesId, bleed: $bleed, description: $description, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt, isAdopted: $isAdopted, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class $PetModelCopyWith<$Res>  {
  factory $PetModelCopyWith(PetModel value, $Res Function(PetModel) _then) = _$PetModelCopyWithImpl;
@useResult
$Res call({
 String id, String uid, String name, AddressModel address, Gender gender, String age, String weight, String speciesId, String bleed, String description, String imageUrl, DateTime createdAt, DateTime updatedAt, bool isAdopted, bool isDeleted
});


$AddressModelCopyWith<$Res> get address;

}
/// @nodoc
class _$PetModelCopyWithImpl<$Res>
    implements $PetModelCopyWith<$Res> {
  _$PetModelCopyWithImpl(this._self, this._then);

  final PetModel _self;
  final $Res Function(PetModel) _then;

/// Create a copy of PetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? address = null,Object? gender = null,Object? age = null,Object? weight = null,Object? speciesId = null,Object? bleed = null,Object? description = null,Object? imageUrl = null,Object? createdAt = null,Object? updatedAt = null,Object? isAdopted = null,Object? isDeleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressModel,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as String,speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as String,bleed: null == bleed ? _self.bleed : bleed // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isAdopted: null == isAdopted ? _self.isAdopted : isAdopted // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressModelCopyWith<$Res> get address {
  
  return $AddressModelCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// Adds pattern-matching-related methods to [PetModel].
extension PetModelPatterns on PetModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PetModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PetModel value)  $default,){
final _that = this;
switch (_that) {
case _PetModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PetModel value)?  $default,){
final _that = this;
switch (_that) {
case _PetModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String uid,  String name,  AddressModel address,  Gender gender,  String age,  String weight,  String speciesId,  String bleed,  String description,  String imageUrl,  DateTime createdAt,  DateTime updatedAt,  bool isAdopted,  bool isDeleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PetModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.address,_that.gender,_that.age,_that.weight,_that.speciesId,_that.bleed,_that.description,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.isAdopted,_that.isDeleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String uid,  String name,  AddressModel address,  Gender gender,  String age,  String weight,  String speciesId,  String bleed,  String description,  String imageUrl,  DateTime createdAt,  DateTime updatedAt,  bool isAdopted,  bool isDeleted)  $default,) {final _that = this;
switch (_that) {
case _PetModel():
return $default(_that.id,_that.uid,_that.name,_that.address,_that.gender,_that.age,_that.weight,_that.speciesId,_that.bleed,_that.description,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.isAdopted,_that.isDeleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String uid,  String name,  AddressModel address,  Gender gender,  String age,  String weight,  String speciesId,  String bleed,  String description,  String imageUrl,  DateTime createdAt,  DateTime updatedAt,  bool isAdopted,  bool isDeleted)?  $default,) {final _that = this;
switch (_that) {
case _PetModel() when $default != null:
return $default(_that.id,_that.uid,_that.name,_that.address,_that.gender,_that.age,_that.weight,_that.speciesId,_that.bleed,_that.description,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.isAdopted,_that.isDeleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@TimestampConverter()
class _PetModel implements PetModel {
  const _PetModel({required this.id, required this.uid, required this.name, required this.address, required this.gender, required this.age, required this.weight, required this.speciesId, required this.bleed, required this.description, required this.imageUrl, required this.createdAt, required this.updatedAt, this.isAdopted = false, this.isDeleted = false});
  factory _PetModel.fromJson(Map<String, dynamic> json) => _$PetModelFromJson(json);

@override final  String id;
@override final  String uid;
@override final  String name;
@override final  AddressModel address;
@override final  Gender gender;
@override final  String age;
@override final  String weight;
@override final  String speciesId;
@override final  String bleed;
@override final  String description;
@override final  String imageUrl;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey() final  bool isAdopted;
@override@JsonKey() final  bool isDeleted;

/// Create a copy of PetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PetModelCopyWith<_PetModel> get copyWith => __$PetModelCopyWithImpl<_PetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PetModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.age, age) || other.age == age)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.speciesId, speciesId) || other.speciesId == speciesId)&&(identical(other.bleed, bleed) || other.bleed == bleed)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isAdopted, isAdopted) || other.isAdopted == isAdopted)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,name,address,gender,age,weight,speciesId,bleed,description,imageUrl,createdAt,updatedAt,isAdopted,isDeleted);

@override
String toString() {
  return 'PetModel(id: $id, uid: $uid, name: $name, address: $address, gender: $gender, age: $age, weight: $weight, speciesId: $speciesId, bleed: $bleed, description: $description, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt, isAdopted: $isAdopted, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class _$PetModelCopyWith<$Res> implements $PetModelCopyWith<$Res> {
  factory _$PetModelCopyWith(_PetModel value, $Res Function(_PetModel) _then) = __$PetModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String uid, String name, AddressModel address, Gender gender, String age, String weight, String speciesId, String bleed, String description, String imageUrl, DateTime createdAt, DateTime updatedAt, bool isAdopted, bool isDeleted
});


@override $AddressModelCopyWith<$Res> get address;

}
/// @nodoc
class __$PetModelCopyWithImpl<$Res>
    implements _$PetModelCopyWith<$Res> {
  __$PetModelCopyWithImpl(this._self, this._then);

  final _PetModel _self;
  final $Res Function(_PetModel) _then;

/// Create a copy of PetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? name = null,Object? address = null,Object? gender = null,Object? age = null,Object? weight = null,Object? speciesId = null,Object? bleed = null,Object? description = null,Object? imageUrl = null,Object? createdAt = null,Object? updatedAt = null,Object? isAdopted = null,Object? isDeleted = null,}) {
  return _then(_PetModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressModel,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as String,speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as String,bleed: null == bleed ? _self.bleed : bleed // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isAdopted: null == isAdopted ? _self.isAdopted : isAdopted // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressModelCopyWith<$Res> get address {
  
  return $AddressModelCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}

// dart format on
