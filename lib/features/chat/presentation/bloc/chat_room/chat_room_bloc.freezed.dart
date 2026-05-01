// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatRoomEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRoomEvent()';
}


}

/// @nodoc
class $ChatRoomEventCopyWith<$Res>  {
$ChatRoomEventCopyWith(ChatRoomEvent _, $Res Function(ChatRoomEvent) __);
}


/// Adds pattern-matching-related methods to [ChatRoomEvent].
extension ChatRoomEventPatterns on ChatRoomEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SubscriptionRequested value)?  subscriptionRequested,TResult Function( _RoomsReceived value)?  roomsReceived,TResult Function( _RoomCreated value)?  roomCreated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested(_that);case _RoomsReceived() when roomsReceived != null:
return roomsReceived(_that);case _RoomCreated() when roomCreated != null:
return roomCreated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SubscriptionRequested value)  subscriptionRequested,required TResult Function( _RoomsReceived value)  roomsReceived,required TResult Function( _RoomCreated value)  roomCreated,}){
final _that = this;
switch (_that) {
case _SubscriptionRequested():
return subscriptionRequested(_that);case _RoomsReceived():
return roomsReceived(_that);case _RoomCreated():
return roomCreated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SubscriptionRequested value)?  subscriptionRequested,TResult? Function( _RoomsReceived value)?  roomsReceived,TResult? Function( _RoomCreated value)?  roomCreated,}){
final _that = this;
switch (_that) {
case _SubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested(_that);case _RoomsReceived() when roomsReceived != null:
return roomsReceived(_that);case _RoomCreated() when roomCreated != null:
return roomCreated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  subscriptionRequested,TResult Function( Either<Failure, List<ChatRoom>> result)?  roomsReceived,TResult Function( List<String> members)?  roomCreated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested();case _RoomsReceived() when roomsReceived != null:
return roomsReceived(_that.result);case _RoomCreated() when roomCreated != null:
return roomCreated(_that.members);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  subscriptionRequested,required TResult Function( Either<Failure, List<ChatRoom>> result)  roomsReceived,required TResult Function( List<String> members)  roomCreated,}) {final _that = this;
switch (_that) {
case _SubscriptionRequested():
return subscriptionRequested();case _RoomsReceived():
return roomsReceived(_that.result);case _RoomCreated():
return roomCreated(_that.members);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  subscriptionRequested,TResult? Function( Either<Failure, List<ChatRoom>> result)?  roomsReceived,TResult? Function( List<String> members)?  roomCreated,}) {final _that = this;
switch (_that) {
case _SubscriptionRequested() when subscriptionRequested != null:
return subscriptionRequested();case _RoomsReceived() when roomsReceived != null:
return roomsReceived(_that.result);case _RoomCreated() when roomCreated != null:
return roomCreated(_that.members);case _:
  return null;

}
}

}

/// @nodoc


class _SubscriptionRequested implements ChatRoomEvent {
  const _SubscriptionRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRoomEvent.subscriptionRequested()';
}


}




/// @nodoc


class _RoomsReceived implements ChatRoomEvent {
  const _RoomsReceived(this.result);
  

 final  Either<Failure, List<ChatRoom>> result;

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomsReceivedCopyWith<_RoomsReceived> get copyWith => __$RoomsReceivedCopyWithImpl<_RoomsReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomsReceived&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,result);

@override
String toString() {
  return 'ChatRoomEvent.roomsReceived(result: $result)';
}


}

/// @nodoc
abstract mixin class _$RoomsReceivedCopyWith<$Res> implements $ChatRoomEventCopyWith<$Res> {
  factory _$RoomsReceivedCopyWith(_RoomsReceived value, $Res Function(_RoomsReceived) _then) = __$RoomsReceivedCopyWithImpl;
@useResult
$Res call({
 Either<Failure, List<ChatRoom>> result
});




}
/// @nodoc
class __$RoomsReceivedCopyWithImpl<$Res>
    implements _$RoomsReceivedCopyWith<$Res> {
  __$RoomsReceivedCopyWithImpl(this._self, this._then);

  final _RoomsReceived _self;
  final $Res Function(_RoomsReceived) _then;

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = null,}) {
  return _then(_RoomsReceived(
null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as Either<Failure, List<ChatRoom>>,
  ));
}


}

/// @nodoc


class _RoomCreated implements ChatRoomEvent {
  const _RoomCreated(final  List<String> members): _members = members;
  

 final  List<String> _members;
 List<String> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}


/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomCreatedCopyWith<_RoomCreated> get copyWith => __$RoomCreatedCopyWithImpl<_RoomCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomCreated&&const DeepCollectionEquality().equals(other._members, _members));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_members));

@override
String toString() {
  return 'ChatRoomEvent.roomCreated(members: $members)';
}


}

/// @nodoc
abstract mixin class _$RoomCreatedCopyWith<$Res> implements $ChatRoomEventCopyWith<$Res> {
  factory _$RoomCreatedCopyWith(_RoomCreated value, $Res Function(_RoomCreated) _then) = __$RoomCreatedCopyWithImpl;
@useResult
$Res call({
 List<String> members
});




}
/// @nodoc
class __$RoomCreatedCopyWithImpl<$Res>
    implements _$RoomCreatedCopyWith<$Res> {
  __$RoomCreatedCopyWithImpl(this._self, this._then);

  final _RoomCreated _self;
  final $Res Function(_RoomCreated) _then;

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? members = null,}) {
  return _then(_RoomCreated(
null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
mixin _$ChatRoomState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRoomState()';
}


}

/// @nodoc
class $ChatRoomStateCopyWith<$Res>  {
$ChatRoomStateCopyWith(ChatRoomState _, $Res Function(ChatRoomState) __);
}


/// Adds pattern-matching-related methods to [ChatRoomState].
extension ChatRoomStatePatterns on ChatRoomState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _RoomReady value)?  roomReady,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _RoomReady() when roomReady != null:
return roomReady(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _RoomReady value)  roomReady,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _RoomReady():
return roomReady(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _RoomReady value)?  roomReady,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _RoomReady() when roomReady != null:
return roomReady(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ChatRoom> rooms)?  loaded,TResult Function( ChatRoom room)?  roomReady,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.rooms);case _RoomReady() when roomReady != null:
return roomReady(_that.room);case _Failure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ChatRoom> rooms)  loaded,required TResult Function( ChatRoom room)  roomReady,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.rooms);case _RoomReady():
return roomReady(_that.room);case _Failure():
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ChatRoom> rooms)?  loaded,TResult? Function( ChatRoom room)?  roomReady,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.rooms);case _RoomReady() when roomReady != null:
return roomReady(_that.room);case _Failure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ChatRoomState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRoomState.initial()';
}


}




/// @nodoc


class _Loading implements ChatRoomState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRoomState.loading()';
}


}




/// @nodoc


class _Loaded implements ChatRoomState {
  const _Loaded(final  List<ChatRoom> rooms): _rooms = rooms;
  

 final  List<ChatRoom> _rooms;
 List<ChatRoom> get rooms {
  if (_rooms is EqualUnmodifiableListView) return _rooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rooms);
}


/// Create a copy of ChatRoomState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._rooms, _rooms));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_rooms));

@override
String toString() {
  return 'ChatRoomState.loaded(rooms: $rooms)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ChatRoomStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<ChatRoom> rooms
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ChatRoomState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rooms = null,}) {
  return _then(_Loaded(
null == rooms ? _self._rooms : rooms // ignore: cast_nullable_to_non_nullable
as List<ChatRoom>,
  ));
}


}

/// @nodoc


class _RoomReady implements ChatRoomState {
  const _RoomReady(this.room);
  

 final  ChatRoom room;

/// Create a copy of ChatRoomState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomReadyCopyWith<_RoomReady> get copyWith => __$RoomReadyCopyWithImpl<_RoomReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomReady&&(identical(other.room, room) || other.room == room));
}


@override
int get hashCode => Object.hash(runtimeType,room);

@override
String toString() {
  return 'ChatRoomState.roomReady(room: $room)';
}


}

/// @nodoc
abstract mixin class _$RoomReadyCopyWith<$Res> implements $ChatRoomStateCopyWith<$Res> {
  factory _$RoomReadyCopyWith(_RoomReady value, $Res Function(_RoomReady) _then) = __$RoomReadyCopyWithImpl;
@useResult
$Res call({
 ChatRoom room
});


$ChatRoomCopyWith<$Res> get room;

}
/// @nodoc
class __$RoomReadyCopyWithImpl<$Res>
    implements _$RoomReadyCopyWith<$Res> {
  __$RoomReadyCopyWithImpl(this._self, this._then);

  final _RoomReady _self;
  final $Res Function(_RoomReady) _then;

/// Create a copy of ChatRoomState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? room = null,}) {
  return _then(_RoomReady(
null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as ChatRoom,
  ));
}

/// Create a copy of ChatRoomState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatRoomCopyWith<$Res> get room {
  
  return $ChatRoomCopyWith<$Res>(_self.room, (value) {
    return _then(_self.copyWith(room: value));
  });
}
}

/// @nodoc


class _Failure implements ChatRoomState {
  const _Failure(this.failure);
  

 final  Failure failure;

/// Create a copy of ChatRoomState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ChatRoomState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $ChatRoomStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of ChatRoomState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Failure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of ChatRoomState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
