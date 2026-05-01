// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SendMessageParams {

 String get roomId; String get text;
/// Create a copy of SendMessageParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessageParamsCopyWith<SendMessageParams> get copyWith => _$SendMessageParamsCopyWithImpl<SendMessageParams>(this as SendMessageParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessageParams&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,roomId,text);

@override
String toString() {
  return 'SendMessageParams(roomId: $roomId, text: $text)';
}


}

/// @nodoc
abstract mixin class $SendMessageParamsCopyWith<$Res>  {
  factory $SendMessageParamsCopyWith(SendMessageParams value, $Res Function(SendMessageParams) _then) = _$SendMessageParamsCopyWithImpl;
@useResult
$Res call({
 String roomId, String text
});




}
/// @nodoc
class _$SendMessageParamsCopyWithImpl<$Res>
    implements $SendMessageParamsCopyWith<$Res> {
  _$SendMessageParamsCopyWithImpl(this._self, this._then);

  final SendMessageParams _self;
  final $Res Function(SendMessageParams) _then;

/// Create a copy of SendMessageParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomId = null,Object? text = null,}) {
  return _then(_self.copyWith(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SendMessageParams].
extension SendMessageParamsPatterns on SendMessageParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendMessageParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendMessageParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendMessageParams value)  $default,){
final _that = this;
switch (_that) {
case _SendMessageParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendMessageParams value)?  $default,){
final _that = this;
switch (_that) {
case _SendMessageParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String roomId,  String text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendMessageParams() when $default != null:
return $default(_that.roomId,_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String roomId,  String text)  $default,) {final _that = this;
switch (_that) {
case _SendMessageParams():
return $default(_that.roomId,_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String roomId,  String text)?  $default,) {final _that = this;
switch (_that) {
case _SendMessageParams() when $default != null:
return $default(_that.roomId,_that.text);case _:
  return null;

}
}

}

/// @nodoc


class _SendMessageParams implements SendMessageParams {
  const _SendMessageParams({required this.roomId, required this.text});
  

@override final  String roomId;
@override final  String text;

/// Create a copy of SendMessageParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMessageParamsCopyWith<_SendMessageParams> get copyWith => __$SendMessageParamsCopyWithImpl<_SendMessageParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMessageParams&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,roomId,text);

@override
String toString() {
  return 'SendMessageParams(roomId: $roomId, text: $text)';
}


}

/// @nodoc
abstract mixin class _$SendMessageParamsCopyWith<$Res> implements $SendMessageParamsCopyWith<$Res> {
  factory _$SendMessageParamsCopyWith(_SendMessageParams value, $Res Function(_SendMessageParams) _then) = __$SendMessageParamsCopyWithImpl;
@override @useResult
$Res call({
 String roomId, String text
});




}
/// @nodoc
class __$SendMessageParamsCopyWithImpl<$Res>
    implements _$SendMessageParamsCopyWith<$Res> {
  __$SendMessageParamsCopyWithImpl(this._self, this._then);

  final _SendMessageParams _self;
  final $Res Function(_SendMessageParams) _then;

/// Create a copy of SendMessageParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomId = null,Object? text = null,}) {
  return _then(_SendMessageParams(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
