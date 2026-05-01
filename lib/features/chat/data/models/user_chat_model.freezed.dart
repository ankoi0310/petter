// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserChatModel {

 UserModel get user; bool get isOnline; DateTime? get lastSeen;
/// Create a copy of UserChatModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserChatModelCopyWith<UserChatModel> get copyWith => _$UserChatModelCopyWithImpl<UserChatModel>(this as UserChatModel, _$identity);

  /// Serializes this UserChatModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserChatModel&&(identical(other.user, user) || other.user == user)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,isOnline,lastSeen);

@override
String toString() {
  return 'UserChatModel(user: $user, isOnline: $isOnline, lastSeen: $lastSeen)';
}


}

/// @nodoc
abstract mixin class $UserChatModelCopyWith<$Res>  {
  factory $UserChatModelCopyWith(UserChatModel value, $Res Function(UserChatModel) _then) = _$UserChatModelCopyWithImpl;
@useResult
$Res call({
 UserModel user, bool isOnline, DateTime? lastSeen
});


$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$UserChatModelCopyWithImpl<$Res>
    implements $UserChatModelCopyWith<$Res> {
  _$UserChatModelCopyWithImpl(this._self, this._then);

  final UserChatModel _self;
  final $Res Function(UserChatModel) _then;

/// Create a copy of UserChatModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? isOnline = null,Object? lastSeen = freezed,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: freezed == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of UserChatModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserChatModel].
extension UserChatModelPatterns on UserChatModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserChatModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserChatModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserChatModel value)  $default,){
final _that = this;
switch (_that) {
case _UserChatModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserChatModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserChatModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserModel user,  bool isOnline,  DateTime? lastSeen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserChatModel() when $default != null:
return $default(_that.user,_that.isOnline,_that.lastSeen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserModel user,  bool isOnline,  DateTime? lastSeen)  $default,) {final _that = this;
switch (_that) {
case _UserChatModel():
return $default(_that.user,_that.isOnline,_that.lastSeen);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserModel user,  bool isOnline,  DateTime? lastSeen)?  $default,) {final _that = this;
switch (_that) {
case _UserChatModel() when $default != null:
return $default(_that.user,_that.isOnline,_that.lastSeen);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@TimestampConverterNullable()
class _UserChatModel implements UserChatModel {
  const _UserChatModel({required this.user, required this.isOnline, this.lastSeen});
  factory _UserChatModel.fromJson(Map<String, dynamic> json) => _$UserChatModelFromJson(json);

@override final  UserModel user;
@override final  bool isOnline;
@override final  DateTime? lastSeen;

/// Create a copy of UserChatModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserChatModelCopyWith<_UserChatModel> get copyWith => __$UserChatModelCopyWithImpl<_UserChatModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserChatModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserChatModel&&(identical(other.user, user) || other.user == user)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,isOnline,lastSeen);

@override
String toString() {
  return 'UserChatModel(user: $user, isOnline: $isOnline, lastSeen: $lastSeen)';
}


}

/// @nodoc
abstract mixin class _$UserChatModelCopyWith<$Res> implements $UserChatModelCopyWith<$Res> {
  factory _$UserChatModelCopyWith(_UserChatModel value, $Res Function(_UserChatModel) _then) = __$UserChatModelCopyWithImpl;
@override @useResult
$Res call({
 UserModel user, bool isOnline, DateTime? lastSeen
});


@override $UserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$UserChatModelCopyWithImpl<$Res>
    implements _$UserChatModelCopyWith<$Res> {
  __$UserChatModelCopyWithImpl(this._self, this._then);

  final _UserChatModel _self;
  final $Res Function(_UserChatModel) _then;

/// Create a copy of UserChatModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? isOnline = null,Object? lastSeen = freezed,}) {
  return _then(_UserChatModel(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: freezed == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of UserChatModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
