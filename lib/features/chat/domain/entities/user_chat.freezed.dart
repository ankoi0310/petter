// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserChat {

 User get user; bool get isOnline; DateTime? get lastSeen;
/// Create a copy of UserChat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserChatCopyWith<UserChat> get copyWith => _$UserChatCopyWithImpl<UserChat>(this as UserChat, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserChat&&(identical(other.user, user) || other.user == user)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen));
}


@override
int get hashCode => Object.hash(runtimeType,user,isOnline,lastSeen);

@override
String toString() {
  return 'UserChat(user: $user, isOnline: $isOnline, lastSeen: $lastSeen)';
}


}

/// @nodoc
abstract mixin class $UserChatCopyWith<$Res>  {
  factory $UserChatCopyWith(UserChat value, $Res Function(UserChat) _then) = _$UserChatCopyWithImpl;
@useResult
$Res call({
 User user, bool isOnline, DateTime? lastSeen
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$UserChatCopyWithImpl<$Res>
    implements $UserChatCopyWith<$Res> {
  _$UserChatCopyWithImpl(this._self, this._then);

  final UserChat _self;
  final $Res Function(UserChat) _then;

/// Create a copy of UserChat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? isOnline = null,Object? lastSeen = freezed,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: freezed == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of UserChat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserChat].
extension UserChatPatterns on UserChat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserChat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserChat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserChat value)  $default,){
final _that = this;
switch (_that) {
case _UserChat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserChat value)?  $default,){
final _that = this;
switch (_that) {
case _UserChat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( User user,  bool isOnline,  DateTime? lastSeen)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserChat() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( User user,  bool isOnline,  DateTime? lastSeen)  $default,) {final _that = this;
switch (_that) {
case _UserChat():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( User user,  bool isOnline,  DateTime? lastSeen)?  $default,) {final _that = this;
switch (_that) {
case _UserChat() when $default != null:
return $default(_that.user,_that.isOnline,_that.lastSeen);case _:
  return null;

}
}

}

/// @nodoc

@TimestampConverter()
class _UserChat implements UserChat {
  const _UserChat({required this.user, required this.isOnline, this.lastSeen});
  

@override final  User user;
@override final  bool isOnline;
@override final  DateTime? lastSeen;

/// Create a copy of UserChat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserChatCopyWith<_UserChat> get copyWith => __$UserChatCopyWithImpl<_UserChat>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserChat&&(identical(other.user, user) || other.user == user)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen));
}


@override
int get hashCode => Object.hash(runtimeType,user,isOnline,lastSeen);

@override
String toString() {
  return 'UserChat(user: $user, isOnline: $isOnline, lastSeen: $lastSeen)';
}


}

/// @nodoc
abstract mixin class _$UserChatCopyWith<$Res> implements $UserChatCopyWith<$Res> {
  factory _$UserChatCopyWith(_UserChat value, $Res Function(_UserChat) _then) = __$UserChatCopyWithImpl;
@override @useResult
$Res call({
 User user, bool isOnline, DateTime? lastSeen
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$UserChatCopyWithImpl<$Res>
    implements _$UserChatCopyWith<$Res> {
  __$UserChatCopyWithImpl(this._self, this._then);

  final _UserChat _self;
  final $Res Function(_UserChat) _then;

/// Create a copy of UserChat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? isOnline = null,Object? lastSeen = freezed,}) {
  return _then(_UserChat(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeen: freezed == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of UserChat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
