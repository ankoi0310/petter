// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatRoom {

 String get id; List<String> get memberIds; Map<String, String> get memberNames; Map<String, String?> get memberAvatars; Map<String, int> get unreadCount; String? get lastMessage; DateTime? get lastMessageSent;
/// Create a copy of ChatRoom
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRoomCopyWith<ChatRoom> get copyWith => _$ChatRoomCopyWithImpl<ChatRoom>(this as ChatRoom, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoom&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.memberIds, memberIds)&&const DeepCollectionEquality().equals(other.memberNames, memberNames)&&const DeepCollectionEquality().equals(other.memberAvatars, memberAvatars)&&const DeepCollectionEquality().equals(other.unreadCount, unreadCount)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageSent, lastMessageSent) || other.lastMessageSent == lastMessageSent));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(memberIds),const DeepCollectionEquality().hash(memberNames),const DeepCollectionEquality().hash(memberAvatars),const DeepCollectionEquality().hash(unreadCount),lastMessage,lastMessageSent);

@override
String toString() {
  return 'ChatRoom(id: $id, memberIds: $memberIds, memberNames: $memberNames, memberAvatars: $memberAvatars, unreadCount: $unreadCount, lastMessage: $lastMessage, lastMessageSent: $lastMessageSent)';
}


}

/// @nodoc
abstract mixin class $ChatRoomCopyWith<$Res>  {
  factory $ChatRoomCopyWith(ChatRoom value, $Res Function(ChatRoom) _then) = _$ChatRoomCopyWithImpl;
@useResult
$Res call({
 String id, List<String> memberIds, Map<String, String> memberNames, Map<String, String?> memberAvatars, Map<String, int> unreadCount, String? lastMessage, DateTime? lastMessageSent
});




}
/// @nodoc
class _$ChatRoomCopyWithImpl<$Res>
    implements $ChatRoomCopyWith<$Res> {
  _$ChatRoomCopyWithImpl(this._self, this._then);

  final ChatRoom _self;
  final $Res Function(ChatRoom) _then;

/// Create a copy of ChatRoom
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? memberIds = null,Object? memberNames = null,Object? memberAvatars = null,Object? unreadCount = null,Object? lastMessage = freezed,Object? lastMessageSent = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,memberIds: null == memberIds ? _self.memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as List<String>,memberNames: null == memberNames ? _self.memberNames : memberNames // ignore: cast_nullable_to_non_nullable
as Map<String, String>,memberAvatars: null == memberAvatars ? _self.memberAvatars : memberAvatars // ignore: cast_nullable_to_non_nullable
as Map<String, String?>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as Map<String, int>,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,lastMessageSent: freezed == lastMessageSent ? _self.lastMessageSent : lastMessageSent // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatRoom].
extension ChatRoomPatterns on ChatRoom {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatRoom value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatRoom() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatRoom value)  $default,){
final _that = this;
switch (_that) {
case _ChatRoom():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatRoom value)?  $default,){
final _that = this;
switch (_that) {
case _ChatRoom() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<String> memberIds,  Map<String, String> memberNames,  Map<String, String?> memberAvatars,  Map<String, int> unreadCount,  String? lastMessage,  DateTime? lastMessageSent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatRoom() when $default != null:
return $default(_that.id,_that.memberIds,_that.memberNames,_that.memberAvatars,_that.unreadCount,_that.lastMessage,_that.lastMessageSent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<String> memberIds,  Map<String, String> memberNames,  Map<String, String?> memberAvatars,  Map<String, int> unreadCount,  String? lastMessage,  DateTime? lastMessageSent)  $default,) {final _that = this;
switch (_that) {
case _ChatRoom():
return $default(_that.id,_that.memberIds,_that.memberNames,_that.memberAvatars,_that.unreadCount,_that.lastMessage,_that.lastMessageSent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<String> memberIds,  Map<String, String> memberNames,  Map<String, String?> memberAvatars,  Map<String, int> unreadCount,  String? lastMessage,  DateTime? lastMessageSent)?  $default,) {final _that = this;
switch (_that) {
case _ChatRoom() when $default != null:
return $default(_that.id,_that.memberIds,_that.memberNames,_that.memberAvatars,_that.unreadCount,_that.lastMessage,_that.lastMessageSent);case _:
  return null;

}
}

}

/// @nodoc

@TimestampConverter()
class _ChatRoom implements ChatRoom {
  const _ChatRoom({required this.id, required final  List<String> memberIds, required final  Map<String, String> memberNames, required final  Map<String, String?> memberAvatars, required final  Map<String, int> unreadCount, this.lastMessage, this.lastMessageSent}): _memberIds = memberIds,_memberNames = memberNames,_memberAvatars = memberAvatars,_unreadCount = unreadCount;
  

@override final  String id;
 final  List<String> _memberIds;
@override List<String> get memberIds {
  if (_memberIds is EqualUnmodifiableListView) return _memberIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_memberIds);
}

 final  Map<String, String> _memberNames;
@override Map<String, String> get memberNames {
  if (_memberNames is EqualUnmodifiableMapView) return _memberNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_memberNames);
}

 final  Map<String, String?> _memberAvatars;
@override Map<String, String?> get memberAvatars {
  if (_memberAvatars is EqualUnmodifiableMapView) return _memberAvatars;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_memberAvatars);
}

 final  Map<String, int> _unreadCount;
@override Map<String, int> get unreadCount {
  if (_unreadCount is EqualUnmodifiableMapView) return _unreadCount;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_unreadCount);
}

@override final  String? lastMessage;
@override final  DateTime? lastMessageSent;

/// Create a copy of ChatRoom
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatRoomCopyWith<_ChatRoom> get copyWith => __$ChatRoomCopyWithImpl<_ChatRoom>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatRoom&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._memberIds, _memberIds)&&const DeepCollectionEquality().equals(other._memberNames, _memberNames)&&const DeepCollectionEquality().equals(other._memberAvatars, _memberAvatars)&&const DeepCollectionEquality().equals(other._unreadCount, _unreadCount)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageSent, lastMessageSent) || other.lastMessageSent == lastMessageSent));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_memberIds),const DeepCollectionEquality().hash(_memberNames),const DeepCollectionEquality().hash(_memberAvatars),const DeepCollectionEquality().hash(_unreadCount),lastMessage,lastMessageSent);

@override
String toString() {
  return 'ChatRoom(id: $id, memberIds: $memberIds, memberNames: $memberNames, memberAvatars: $memberAvatars, unreadCount: $unreadCount, lastMessage: $lastMessage, lastMessageSent: $lastMessageSent)';
}


}

/// @nodoc
abstract mixin class _$ChatRoomCopyWith<$Res> implements $ChatRoomCopyWith<$Res> {
  factory _$ChatRoomCopyWith(_ChatRoom value, $Res Function(_ChatRoom) _then) = __$ChatRoomCopyWithImpl;
@override @useResult
$Res call({
 String id, List<String> memberIds, Map<String, String> memberNames, Map<String, String?> memberAvatars, Map<String, int> unreadCount, String? lastMessage, DateTime? lastMessageSent
});




}
/// @nodoc
class __$ChatRoomCopyWithImpl<$Res>
    implements _$ChatRoomCopyWith<$Res> {
  __$ChatRoomCopyWithImpl(this._self, this._then);

  final _ChatRoom _self;
  final $Res Function(_ChatRoom) _then;

/// Create a copy of ChatRoom
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? memberIds = null,Object? memberNames = null,Object? memberAvatars = null,Object? unreadCount = null,Object? lastMessage = freezed,Object? lastMessageSent = freezed,}) {
  return _then(_ChatRoom(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,memberIds: null == memberIds ? _self._memberIds : memberIds // ignore: cast_nullable_to_non_nullable
as List<String>,memberNames: null == memberNames ? _self._memberNames : memberNames // ignore: cast_nullable_to_non_nullable
as Map<String, String>,memberAvatars: null == memberAvatars ? _self._memberAvatars : memberAvatars // ignore: cast_nullable_to_non_nullable
as Map<String, String?>,unreadCount: null == unreadCount ? _self._unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as Map<String, int>,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,lastMessageSent: freezed == lastMessageSent ? _self.lastMessageSent : lastMessageSent // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
