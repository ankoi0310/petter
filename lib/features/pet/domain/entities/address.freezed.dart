// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Address {

 String get detail; String get ward; String get province; int get wardCode; int get provinceCode; String get fullAddress;
/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressCopyWith<Address> get copyWith => _$AddressCopyWithImpl<Address>(this as Address, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Address&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.province, province) || other.province == province)&&(identical(other.wardCode, wardCode) || other.wardCode == wardCode)&&(identical(other.provinceCode, provinceCode) || other.provinceCode == provinceCode)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress));
}


@override
int get hashCode => Object.hash(runtimeType,detail,ward,province,wardCode,provinceCode,fullAddress);

@override
String toString() {
  return 'Address(detail: $detail, ward: $ward, province: $province, wardCode: $wardCode, provinceCode: $provinceCode, fullAddress: $fullAddress)';
}


}

/// @nodoc
abstract mixin class $AddressCopyWith<$Res>  {
  factory $AddressCopyWith(Address value, $Res Function(Address) _then) = _$AddressCopyWithImpl;
@useResult
$Res call({
 String detail, String ward, String province, int wardCode, int provinceCode, String fullAddress
});




}
/// @nodoc
class _$AddressCopyWithImpl<$Res>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._self, this._then);

  final Address _self;
  final $Res Function(Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? detail = null,Object? ward = null,Object? province = null,Object? wardCode = null,Object? provinceCode = null,Object? fullAddress = null,}) {
  return _then(_self.copyWith(
detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,ward: null == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,wardCode: null == wardCode ? _self.wardCode : wardCode // ignore: cast_nullable_to_non_nullable
as int,provinceCode: null == provinceCode ? _self.provinceCode : provinceCode // ignore: cast_nullable_to_non_nullable
as int,fullAddress: null == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Address].
extension AddressPatterns on Address {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Address value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Address() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Address value)  $default,){
final _that = this;
switch (_that) {
case _Address():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Address value)?  $default,){
final _that = this;
switch (_that) {
case _Address() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String detail,  String ward,  String province,  int wardCode,  int provinceCode,  String fullAddress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.detail,_that.ward,_that.province,_that.wardCode,_that.provinceCode,_that.fullAddress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String detail,  String ward,  String province,  int wardCode,  int provinceCode,  String fullAddress)  $default,) {final _that = this;
switch (_that) {
case _Address():
return $default(_that.detail,_that.ward,_that.province,_that.wardCode,_that.provinceCode,_that.fullAddress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String detail,  String ward,  String province,  int wardCode,  int provinceCode,  String fullAddress)?  $default,) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.detail,_that.ward,_that.province,_that.wardCode,_that.provinceCode,_that.fullAddress);case _:
  return null;

}
}

}

/// @nodoc


class _Address implements Address {
  const _Address({required this.detail, required this.ward, required this.province, required this.wardCode, required this.provinceCode, required this.fullAddress});
  

@override final  String detail;
@override final  String ward;
@override final  String province;
@override final  int wardCode;
@override final  int provinceCode;
@override final  String fullAddress;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressCopyWith<_Address> get copyWith => __$AddressCopyWithImpl<_Address>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Address&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.province, province) || other.province == province)&&(identical(other.wardCode, wardCode) || other.wardCode == wardCode)&&(identical(other.provinceCode, provinceCode) || other.provinceCode == provinceCode)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress));
}


@override
int get hashCode => Object.hash(runtimeType,detail,ward,province,wardCode,provinceCode,fullAddress);

@override
String toString() {
  return 'Address(detail: $detail, ward: $ward, province: $province, wardCode: $wardCode, provinceCode: $provinceCode, fullAddress: $fullAddress)';
}


}

/// @nodoc
abstract mixin class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) _then) = __$AddressCopyWithImpl;
@override @useResult
$Res call({
 String detail, String ward, String province, int wardCode, int provinceCode, String fullAddress
});




}
/// @nodoc
class __$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(this._self, this._then);

  final _Address _self;
  final $Res Function(_Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? detail = null,Object? ward = null,Object? province = null,Object? wardCode = null,Object? provinceCode = null,Object? fullAddress = null,}) {
  return _then(_Address(
detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,ward: null == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,wardCode: null == wardCode ? _self.wardCode : wardCode // ignore: cast_nullable_to_non_nullable
as int,provinceCode: null == provinceCode ? _self.provinceCode : provinceCode // ignore: cast_nullable_to_non_nullable
as int,fullAddress: null == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
