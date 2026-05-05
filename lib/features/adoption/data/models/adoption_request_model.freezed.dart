// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adoption_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdoptionRequestModel {

 String get id; String get petId; String get petOwnerId; String get petName; String get petImageUrl; String get adopterId; String get adopterName; String? get adopterAvatar; String get adopterPhone; DateTime get createdAt; DateTime get updatedAt; RequestStatus get status; String? get rejectionReason;
/// Create a copy of AdoptionRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdoptionRequestModelCopyWith<AdoptionRequestModel> get copyWith => _$AdoptionRequestModelCopyWithImpl<AdoptionRequestModel>(this as AdoptionRequestModel, _$identity);

  /// Serializes this AdoptionRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdoptionRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.petId, petId) || other.petId == petId)&&(identical(other.petOwnerId, petOwnerId) || other.petOwnerId == petOwnerId)&&(identical(other.petName, petName) || other.petName == petName)&&(identical(other.petImageUrl, petImageUrl) || other.petImageUrl == petImageUrl)&&(identical(other.adopterId, adopterId) || other.adopterId == adopterId)&&(identical(other.adopterName, adopterName) || other.adopterName == adopterName)&&(identical(other.adopterAvatar, adopterAvatar) || other.adopterAvatar == adopterAvatar)&&(identical(other.adopterPhone, adopterPhone) || other.adopterPhone == adopterPhone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,petId,petOwnerId,petName,petImageUrl,adopterId,adopterName,adopterAvatar,adopterPhone,createdAt,updatedAt,status,rejectionReason);

@override
String toString() {
  return 'AdoptionRequestModel(id: $id, petId: $petId, petOwnerId: $petOwnerId, petName: $petName, petImageUrl: $petImageUrl, adopterId: $adopterId, adopterName: $adopterName, adopterAvatar: $adopterAvatar, adopterPhone: $adopterPhone, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, rejectionReason: $rejectionReason)';
}


}

/// @nodoc
abstract mixin class $AdoptionRequestModelCopyWith<$Res>  {
  factory $AdoptionRequestModelCopyWith(AdoptionRequestModel value, $Res Function(AdoptionRequestModel) _then) = _$AdoptionRequestModelCopyWithImpl;
@useResult
$Res call({
 String id, String petId, String petOwnerId, String petName, String petImageUrl, String adopterId, String adopterName, String? adopterAvatar, String adopterPhone, DateTime createdAt, DateTime updatedAt, RequestStatus status, String? rejectionReason
});




}
/// @nodoc
class _$AdoptionRequestModelCopyWithImpl<$Res>
    implements $AdoptionRequestModelCopyWith<$Res> {
  _$AdoptionRequestModelCopyWithImpl(this._self, this._then);

  final AdoptionRequestModel _self;
  final $Res Function(AdoptionRequestModel) _then;

/// Create a copy of AdoptionRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? petId = null,Object? petOwnerId = null,Object? petName = null,Object? petImageUrl = null,Object? adopterId = null,Object? adopterName = null,Object? adopterAvatar = freezed,Object? adopterPhone = null,Object? createdAt = null,Object? updatedAt = null,Object? status = null,Object? rejectionReason = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,petId: null == petId ? _self.petId : petId // ignore: cast_nullable_to_non_nullable
as String,petOwnerId: null == petOwnerId ? _self.petOwnerId : petOwnerId // ignore: cast_nullable_to_non_nullable
as String,petName: null == petName ? _self.petName : petName // ignore: cast_nullable_to_non_nullable
as String,petImageUrl: null == petImageUrl ? _self.petImageUrl : petImageUrl // ignore: cast_nullable_to_non_nullable
as String,adopterId: null == adopterId ? _self.adopterId : adopterId // ignore: cast_nullable_to_non_nullable
as String,adopterName: null == adopterName ? _self.adopterName : adopterName // ignore: cast_nullable_to_non_nullable
as String,adopterAvatar: freezed == adopterAvatar ? _self.adopterAvatar : adopterAvatar // ignore: cast_nullable_to_non_nullable
as String?,adopterPhone: null == adopterPhone ? _self.adopterPhone : adopterPhone // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RequestStatus,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdoptionRequestModel].
extension AdoptionRequestModelPatterns on AdoptionRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdoptionRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdoptionRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdoptionRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _AdoptionRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdoptionRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _AdoptionRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String petId,  String petOwnerId,  String petName,  String petImageUrl,  String adopterId,  String adopterName,  String? adopterAvatar,  String adopterPhone,  DateTime createdAt,  DateTime updatedAt,  RequestStatus status,  String? rejectionReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdoptionRequestModel() when $default != null:
return $default(_that.id,_that.petId,_that.petOwnerId,_that.petName,_that.petImageUrl,_that.adopterId,_that.adopterName,_that.adopterAvatar,_that.adopterPhone,_that.createdAt,_that.updatedAt,_that.status,_that.rejectionReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String petId,  String petOwnerId,  String petName,  String petImageUrl,  String adopterId,  String adopterName,  String? adopterAvatar,  String adopterPhone,  DateTime createdAt,  DateTime updatedAt,  RequestStatus status,  String? rejectionReason)  $default,) {final _that = this;
switch (_that) {
case _AdoptionRequestModel():
return $default(_that.id,_that.petId,_that.petOwnerId,_that.petName,_that.petImageUrl,_that.adopterId,_that.adopterName,_that.adopterAvatar,_that.adopterPhone,_that.createdAt,_that.updatedAt,_that.status,_that.rejectionReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String petId,  String petOwnerId,  String petName,  String petImageUrl,  String adopterId,  String adopterName,  String? adopterAvatar,  String adopterPhone,  DateTime createdAt,  DateTime updatedAt,  RequestStatus status,  String? rejectionReason)?  $default,) {final _that = this;
switch (_that) {
case _AdoptionRequestModel() when $default != null:
return $default(_that.id,_that.petId,_that.petOwnerId,_that.petName,_that.petImageUrl,_that.adopterId,_that.adopterName,_that.adopterAvatar,_that.adopterPhone,_that.createdAt,_that.updatedAt,_that.status,_that.rejectionReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@TimestampConverter()
class _AdoptionRequestModel implements AdoptionRequestModel {
  const _AdoptionRequestModel({required this.id, required this.petId, required this.petOwnerId, required this.petName, required this.petImageUrl, required this.adopterId, required this.adopterName, required this.adopterAvatar, required this.adopterPhone, required this.createdAt, required this.updatedAt, this.status = RequestStatus.pending, this.rejectionReason});
  factory _AdoptionRequestModel.fromJson(Map<String, dynamic> json) => _$AdoptionRequestModelFromJson(json);

@override final  String id;
@override final  String petId;
@override final  String petOwnerId;
@override final  String petName;
@override final  String petImageUrl;
@override final  String adopterId;
@override final  String adopterName;
@override final  String? adopterAvatar;
@override final  String adopterPhone;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey() final  RequestStatus status;
@override final  String? rejectionReason;

/// Create a copy of AdoptionRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdoptionRequestModelCopyWith<_AdoptionRequestModel> get copyWith => __$AdoptionRequestModelCopyWithImpl<_AdoptionRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdoptionRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdoptionRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.petId, petId) || other.petId == petId)&&(identical(other.petOwnerId, petOwnerId) || other.petOwnerId == petOwnerId)&&(identical(other.petName, petName) || other.petName == petName)&&(identical(other.petImageUrl, petImageUrl) || other.petImageUrl == petImageUrl)&&(identical(other.adopterId, adopterId) || other.adopterId == adopterId)&&(identical(other.adopterName, adopterName) || other.adopterName == adopterName)&&(identical(other.adopterAvatar, adopterAvatar) || other.adopterAvatar == adopterAvatar)&&(identical(other.adopterPhone, adopterPhone) || other.adopterPhone == adopterPhone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,petId,petOwnerId,petName,petImageUrl,adopterId,adopterName,adopterAvatar,adopterPhone,createdAt,updatedAt,status,rejectionReason);

@override
String toString() {
  return 'AdoptionRequestModel(id: $id, petId: $petId, petOwnerId: $petOwnerId, petName: $petName, petImageUrl: $petImageUrl, adopterId: $adopterId, adopterName: $adopterName, adopterAvatar: $adopterAvatar, adopterPhone: $adopterPhone, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, rejectionReason: $rejectionReason)';
}


}

/// @nodoc
abstract mixin class _$AdoptionRequestModelCopyWith<$Res> implements $AdoptionRequestModelCopyWith<$Res> {
  factory _$AdoptionRequestModelCopyWith(_AdoptionRequestModel value, $Res Function(_AdoptionRequestModel) _then) = __$AdoptionRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String petId, String petOwnerId, String petName, String petImageUrl, String adopterId, String adopterName, String? adopterAvatar, String adopterPhone, DateTime createdAt, DateTime updatedAt, RequestStatus status, String? rejectionReason
});




}
/// @nodoc
class __$AdoptionRequestModelCopyWithImpl<$Res>
    implements _$AdoptionRequestModelCopyWith<$Res> {
  __$AdoptionRequestModelCopyWithImpl(this._self, this._then);

  final _AdoptionRequestModel _self;
  final $Res Function(_AdoptionRequestModel) _then;

/// Create a copy of AdoptionRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? petId = null,Object? petOwnerId = null,Object? petName = null,Object? petImageUrl = null,Object? adopterId = null,Object? adopterName = null,Object? adopterAvatar = freezed,Object? adopterPhone = null,Object? createdAt = null,Object? updatedAt = null,Object? status = null,Object? rejectionReason = freezed,}) {
  return _then(_AdoptionRequestModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,petId: null == petId ? _self.petId : petId // ignore: cast_nullable_to_non_nullable
as String,petOwnerId: null == petOwnerId ? _self.petOwnerId : petOwnerId // ignore: cast_nullable_to_non_nullable
as String,petName: null == petName ? _self.petName : petName // ignore: cast_nullable_to_non_nullable
as String,petImageUrl: null == petImageUrl ? _self.petImageUrl : petImageUrl // ignore: cast_nullable_to_non_nullable
as String,adopterId: null == adopterId ? _self.adopterId : adopterId // ignore: cast_nullable_to_non_nullable
as String,adopterName: null == adopterName ? _self.adopterName : adopterName // ignore: cast_nullable_to_non_nullable
as String,adopterAvatar: freezed == adopterAvatar ? _self.adopterAvatar : adopterAvatar // ignore: cast_nullable_to_non_nullable
as String?,adopterPhone: null == adopterPhone ? _self.adopterPhone : adopterPhone // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RequestStatus,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
