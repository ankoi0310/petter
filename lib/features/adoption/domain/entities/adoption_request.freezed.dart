// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adoption_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdoptionRequest {

 String get id; String get petId; String get adopterId; DateTime get createAt; DateTime get updatedAt; RequestStatus get status; String? get rejectionReason;
/// Create a copy of AdoptionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdoptionRequestCopyWith<AdoptionRequest> get copyWith => _$AdoptionRequestCopyWithImpl<AdoptionRequest>(this as AdoptionRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdoptionRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.petId, petId) || other.petId == petId)&&(identical(other.adopterId, adopterId) || other.adopterId == adopterId)&&(identical(other.createAt, createAt) || other.createAt == createAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason));
}


@override
int get hashCode => Object.hash(runtimeType,id,petId,adopterId,createAt,updatedAt,status,rejectionReason);

@override
String toString() {
  return 'AdoptionRequest(id: $id, petId: $petId, adopterId: $adopterId, createAt: $createAt, updatedAt: $updatedAt, status: $status, rejectionReason: $rejectionReason)';
}


}

/// @nodoc
abstract mixin class $AdoptionRequestCopyWith<$Res>  {
  factory $AdoptionRequestCopyWith(AdoptionRequest value, $Res Function(AdoptionRequest) _then) = _$AdoptionRequestCopyWithImpl;
@useResult
$Res call({
 String id, String petId, String adopterId, DateTime createAt, DateTime updatedAt, RequestStatus status, String? rejectionReason
});




}
/// @nodoc
class _$AdoptionRequestCopyWithImpl<$Res>
    implements $AdoptionRequestCopyWith<$Res> {
  _$AdoptionRequestCopyWithImpl(this._self, this._then);

  final AdoptionRequest _self;
  final $Res Function(AdoptionRequest) _then;

/// Create a copy of AdoptionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? petId = null,Object? adopterId = null,Object? createAt = null,Object? updatedAt = null,Object? status = null,Object? rejectionReason = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,petId: null == petId ? _self.petId : petId // ignore: cast_nullable_to_non_nullable
as String,adopterId: null == adopterId ? _self.adopterId : adopterId // ignore: cast_nullable_to_non_nullable
as String,createAt: null == createAt ? _self.createAt : createAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RequestStatus,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdoptionRequest].
extension AdoptionRequestPatterns on AdoptionRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdoptionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdoptionRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdoptionRequest value)  $default,){
final _that = this;
switch (_that) {
case _AdoptionRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdoptionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AdoptionRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String petId,  String adopterId,  DateTime createAt,  DateTime updatedAt,  RequestStatus status,  String? rejectionReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdoptionRequest() when $default != null:
return $default(_that.id,_that.petId,_that.adopterId,_that.createAt,_that.updatedAt,_that.status,_that.rejectionReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String petId,  String adopterId,  DateTime createAt,  DateTime updatedAt,  RequestStatus status,  String? rejectionReason)  $default,) {final _that = this;
switch (_that) {
case _AdoptionRequest():
return $default(_that.id,_that.petId,_that.adopterId,_that.createAt,_that.updatedAt,_that.status,_that.rejectionReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String petId,  String adopterId,  DateTime createAt,  DateTime updatedAt,  RequestStatus status,  String? rejectionReason)?  $default,) {final _that = this;
switch (_that) {
case _AdoptionRequest() when $default != null:
return $default(_that.id,_that.petId,_that.adopterId,_that.createAt,_that.updatedAt,_that.status,_that.rejectionReason);case _:
  return null;

}
}

}

/// @nodoc


class _AdoptionRequest implements AdoptionRequest {
  const _AdoptionRequest({required this.id, required this.petId, required this.adopterId, required this.createAt, required this.updatedAt, required this.status, this.rejectionReason});
  

@override final  String id;
@override final  String petId;
@override final  String adopterId;
@override final  DateTime createAt;
@override final  DateTime updatedAt;
@override final  RequestStatus status;
@override final  String? rejectionReason;

/// Create a copy of AdoptionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdoptionRequestCopyWith<_AdoptionRequest> get copyWith => __$AdoptionRequestCopyWithImpl<_AdoptionRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdoptionRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.petId, petId) || other.petId == petId)&&(identical(other.adopterId, adopterId) || other.adopterId == adopterId)&&(identical(other.createAt, createAt) || other.createAt == createAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason));
}


@override
int get hashCode => Object.hash(runtimeType,id,petId,adopterId,createAt,updatedAt,status,rejectionReason);

@override
String toString() {
  return 'AdoptionRequest(id: $id, petId: $petId, adopterId: $adopterId, createAt: $createAt, updatedAt: $updatedAt, status: $status, rejectionReason: $rejectionReason)';
}


}

/// @nodoc
abstract mixin class _$AdoptionRequestCopyWith<$Res> implements $AdoptionRequestCopyWith<$Res> {
  factory _$AdoptionRequestCopyWith(_AdoptionRequest value, $Res Function(_AdoptionRequest) _then) = __$AdoptionRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, String petId, String adopterId, DateTime createAt, DateTime updatedAt, RequestStatus status, String? rejectionReason
});




}
/// @nodoc
class __$AdoptionRequestCopyWithImpl<$Res>
    implements _$AdoptionRequestCopyWith<$Res> {
  __$AdoptionRequestCopyWithImpl(this._self, this._then);

  final _AdoptionRequest _self;
  final $Res Function(_AdoptionRequest) _then;

/// Create a copy of AdoptionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? petId = null,Object? adopterId = null,Object? createAt = null,Object? updatedAt = null,Object? status = null,Object? rejectionReason = freezed,}) {
  return _then(_AdoptionRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,petId: null == petId ? _self.petId : petId // ignore: cast_nullable_to_non_nullable
as String,adopterId: null == adopterId ? _self.adopterId : adopterId // ignore: cast_nullable_to_non_nullable
as String,createAt: null == createAt ? _self.createAt : createAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RequestStatus,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
