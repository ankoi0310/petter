// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adoption_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdoptionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdoptionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdoptionEvent()';
}


}

/// @nodoc
class $AdoptionEventCopyWith<$Res>  {
$AdoptionEventCopyWith(AdoptionEvent _, $Res Function(AdoptionEvent) __);
}


/// Adds pattern-matching-related methods to [AdoptionEvent].
extension AdoptionEventPatterns on AdoptionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetAdoptionRequests value)?  getAdoptionRequests,TResult Function( _CreateAdoptionRequest value)?  createAdoptionRequest,TResult Function( _UpdateAdoptionRequest value)?  updateAdoptionRequest,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetAdoptionRequests() when getAdoptionRequests != null:
return getAdoptionRequests(_that);case _CreateAdoptionRequest() when createAdoptionRequest != null:
return createAdoptionRequest(_that);case _UpdateAdoptionRequest() when updateAdoptionRequest != null:
return updateAdoptionRequest(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetAdoptionRequests value)  getAdoptionRequests,required TResult Function( _CreateAdoptionRequest value)  createAdoptionRequest,required TResult Function( _UpdateAdoptionRequest value)  updateAdoptionRequest,}){
final _that = this;
switch (_that) {
case _GetAdoptionRequests():
return getAdoptionRequests(_that);case _CreateAdoptionRequest():
return createAdoptionRequest(_that);case _UpdateAdoptionRequest():
return updateAdoptionRequest(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetAdoptionRequests value)?  getAdoptionRequests,TResult? Function( _CreateAdoptionRequest value)?  createAdoptionRequest,TResult? Function( _UpdateAdoptionRequest value)?  updateAdoptionRequest,}){
final _that = this;
switch (_that) {
case _GetAdoptionRequests() when getAdoptionRequests != null:
return getAdoptionRequests(_that);case _CreateAdoptionRequest() when createAdoptionRequest != null:
return createAdoptionRequest(_that);case _UpdateAdoptionRequest() when updateAdoptionRequest != null:
return updateAdoptionRequest(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getAdoptionRequests,TResult Function( CreateAdoptionRequestParams params)?  createAdoptionRequest,TResult Function( UpdateAdoptionRequestParams params)?  updateAdoptionRequest,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetAdoptionRequests() when getAdoptionRequests != null:
return getAdoptionRequests();case _CreateAdoptionRequest() when createAdoptionRequest != null:
return createAdoptionRequest(_that.params);case _UpdateAdoptionRequest() when updateAdoptionRequest != null:
return updateAdoptionRequest(_that.params);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getAdoptionRequests,required TResult Function( CreateAdoptionRequestParams params)  createAdoptionRequest,required TResult Function( UpdateAdoptionRequestParams params)  updateAdoptionRequest,}) {final _that = this;
switch (_that) {
case _GetAdoptionRequests():
return getAdoptionRequests();case _CreateAdoptionRequest():
return createAdoptionRequest(_that.params);case _UpdateAdoptionRequest():
return updateAdoptionRequest(_that.params);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getAdoptionRequests,TResult? Function( CreateAdoptionRequestParams params)?  createAdoptionRequest,TResult? Function( UpdateAdoptionRequestParams params)?  updateAdoptionRequest,}) {final _that = this;
switch (_that) {
case _GetAdoptionRequests() when getAdoptionRequests != null:
return getAdoptionRequests();case _CreateAdoptionRequest() when createAdoptionRequest != null:
return createAdoptionRequest(_that.params);case _UpdateAdoptionRequest() when updateAdoptionRequest != null:
return updateAdoptionRequest(_that.params);case _:
  return null;

}
}

}

/// @nodoc


class _GetAdoptionRequests implements AdoptionEvent {
  const _GetAdoptionRequests();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAdoptionRequests);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdoptionEvent.getAdoptionRequests()';
}


}




/// @nodoc


class _CreateAdoptionRequest implements AdoptionEvent {
  const _CreateAdoptionRequest(this.params);
  

 final  CreateAdoptionRequestParams params;

/// Create a copy of AdoptionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAdoptionRequestCopyWith<_CreateAdoptionRequest> get copyWith => __$CreateAdoptionRequestCopyWithImpl<_CreateAdoptionRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAdoptionRequest&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'AdoptionEvent.createAdoptionRequest(params: $params)';
}


}

/// @nodoc
abstract mixin class _$CreateAdoptionRequestCopyWith<$Res> implements $AdoptionEventCopyWith<$Res> {
  factory _$CreateAdoptionRequestCopyWith(_CreateAdoptionRequest value, $Res Function(_CreateAdoptionRequest) _then) = __$CreateAdoptionRequestCopyWithImpl;
@useResult
$Res call({
 CreateAdoptionRequestParams params
});




}
/// @nodoc
class __$CreateAdoptionRequestCopyWithImpl<$Res>
    implements _$CreateAdoptionRequestCopyWith<$Res> {
  __$CreateAdoptionRequestCopyWithImpl(this._self, this._then);

  final _CreateAdoptionRequest _self;
  final $Res Function(_CreateAdoptionRequest) _then;

/// Create a copy of AdoptionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(_CreateAdoptionRequest(
null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as CreateAdoptionRequestParams,
  ));
}


}

/// @nodoc


class _UpdateAdoptionRequest implements AdoptionEvent {
  const _UpdateAdoptionRequest(this.params);
  

 final  UpdateAdoptionRequestParams params;

/// Create a copy of AdoptionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAdoptionRequestCopyWith<_UpdateAdoptionRequest> get copyWith => __$UpdateAdoptionRequestCopyWithImpl<_UpdateAdoptionRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAdoptionRequest&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'AdoptionEvent.updateAdoptionRequest(params: $params)';
}


}

/// @nodoc
abstract mixin class _$UpdateAdoptionRequestCopyWith<$Res> implements $AdoptionEventCopyWith<$Res> {
  factory _$UpdateAdoptionRequestCopyWith(_UpdateAdoptionRequest value, $Res Function(_UpdateAdoptionRequest) _then) = __$UpdateAdoptionRequestCopyWithImpl;
@useResult
$Res call({
 UpdateAdoptionRequestParams params
});




}
/// @nodoc
class __$UpdateAdoptionRequestCopyWithImpl<$Res>
    implements _$UpdateAdoptionRequestCopyWith<$Res> {
  __$UpdateAdoptionRequestCopyWithImpl(this._self, this._then);

  final _UpdateAdoptionRequest _self;
  final $Res Function(_UpdateAdoptionRequest) _then;

/// Create a copy of AdoptionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(_UpdateAdoptionRequest(
null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as UpdateAdoptionRequestParams,
  ));
}


}

/// @nodoc
mixin _$AdoptionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdoptionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdoptionState()';
}


}

/// @nodoc
class $AdoptionStateCopyWith<$Res>  {
$AdoptionStateCopyWith(AdoptionState _, $Res Function(AdoptionState) __);
}


/// Adds pattern-matching-related methods to [AdoptionState].
extension AdoptionStatePatterns on AdoptionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<AdoptionRequest> adoptionRequests)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.adoptionRequests);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<AdoptionRequest> adoptionRequests)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.adoptionRequests);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<AdoptionRequest> adoptionRequests)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.adoptionRequests);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AdoptionState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdoptionState.initial()';
}


}




/// @nodoc


class _Loading implements AdoptionState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdoptionState.loading()';
}


}




/// @nodoc


class _Loaded implements AdoptionState {
  const _Loaded(final  List<AdoptionRequest> adoptionRequests): _adoptionRequests = adoptionRequests;
  

 final  List<AdoptionRequest> _adoptionRequests;
 List<AdoptionRequest> get adoptionRequests {
  if (_adoptionRequests is EqualUnmodifiableListView) return _adoptionRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_adoptionRequests);
}


/// Create a copy of AdoptionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._adoptionRequests, _adoptionRequests));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_adoptionRequests));

@override
String toString() {
  return 'AdoptionState.loaded(adoptionRequests: $adoptionRequests)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $AdoptionStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<AdoptionRequest> adoptionRequests
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of AdoptionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? adoptionRequests = null,}) {
  return _then(_Loaded(
null == adoptionRequests ? _self._adoptionRequests : adoptionRequests // ignore: cast_nullable_to_non_nullable
as List<AdoptionRequest>,
  ));
}


}

/// @nodoc


class _Error implements AdoptionState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of AdoptionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AdoptionState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $AdoptionStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of AdoptionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
