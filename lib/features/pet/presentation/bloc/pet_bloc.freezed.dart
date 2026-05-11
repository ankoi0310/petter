// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PetEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetEvent()';
}


}

/// @nodoc
class $PetEventCopyWith<$Res>  {
$PetEventCopyWith(PetEvent _, $Res Function(PetEvent) __);
}


/// Adds pattern-matching-related methods to [PetEvent].
extension PetEventPatterns on PetEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetPets value)?  getPets,TResult Function( _GetUserPets value)?  getUserPets,TResult Function( _GetPet value)?  getPet,TResult Function( _CreatePet value)?  createPet,TResult Function( _UpdatePet value)?  updatePet,TResult Function( _DeletePet value)?  deletePet,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetPets() when getPets != null:
return getPets(_that);case _GetUserPets() when getUserPets != null:
return getUserPets(_that);case _GetPet() when getPet != null:
return getPet(_that);case _CreatePet() when createPet != null:
return createPet(_that);case _UpdatePet() when updatePet != null:
return updatePet(_that);case _DeletePet() when deletePet != null:
return deletePet(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetPets value)  getPets,required TResult Function( _GetUserPets value)  getUserPets,required TResult Function( _GetPet value)  getPet,required TResult Function( _CreatePet value)  createPet,required TResult Function( _UpdatePet value)  updatePet,required TResult Function( _DeletePet value)  deletePet,}){
final _that = this;
switch (_that) {
case _GetPets():
return getPets(_that);case _GetUserPets():
return getUserPets(_that);case _GetPet():
return getPet(_that);case _CreatePet():
return createPet(_that);case _UpdatePet():
return updatePet(_that);case _DeletePet():
return deletePet(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetPets value)?  getPets,TResult? Function( _GetUserPets value)?  getUserPets,TResult? Function( _GetPet value)?  getPet,TResult? Function( _CreatePet value)?  createPet,TResult? Function( _UpdatePet value)?  updatePet,TResult? Function( _DeletePet value)?  deletePet,}){
final _that = this;
switch (_that) {
case _GetPets() when getPets != null:
return getPets(_that);case _GetUserPets() when getUserPets != null:
return getUserPets(_that);case _GetPet() when getPet != null:
return getPet(_that);case _CreatePet() when createPet != null:
return createPet(_that);case _UpdatePet() when updatePet != null:
return updatePet(_that);case _DeletePet() when deletePet != null:
return deletePet(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( PetFilterParams params,  bool isSearch)?  getPets,TResult Function()?  getUserPets,TResult Function( String id)?  getPet,TResult Function( CreatePetParams params)?  createPet,TResult Function( UpdatePetParams params)?  updatePet,TResult Function( String id)?  deletePet,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetPets() when getPets != null:
return getPets(_that.params,_that.isSearch);case _GetUserPets() when getUserPets != null:
return getUserPets();case _GetPet() when getPet != null:
return getPet(_that.id);case _CreatePet() when createPet != null:
return createPet(_that.params);case _UpdatePet() when updatePet != null:
return updatePet(_that.params);case _DeletePet() when deletePet != null:
return deletePet(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( PetFilterParams params,  bool isSearch)  getPets,required TResult Function()  getUserPets,required TResult Function( String id)  getPet,required TResult Function( CreatePetParams params)  createPet,required TResult Function( UpdatePetParams params)  updatePet,required TResult Function( String id)  deletePet,}) {final _that = this;
switch (_that) {
case _GetPets():
return getPets(_that.params,_that.isSearch);case _GetUserPets():
return getUserPets();case _GetPet():
return getPet(_that.id);case _CreatePet():
return createPet(_that.params);case _UpdatePet():
return updatePet(_that.params);case _DeletePet():
return deletePet(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( PetFilterParams params,  bool isSearch)?  getPets,TResult? Function()?  getUserPets,TResult? Function( String id)?  getPet,TResult? Function( CreatePetParams params)?  createPet,TResult? Function( UpdatePetParams params)?  updatePet,TResult? Function( String id)?  deletePet,}) {final _that = this;
switch (_that) {
case _GetPets() when getPets != null:
return getPets(_that.params,_that.isSearch);case _GetUserPets() when getUserPets != null:
return getUserPets();case _GetPet() when getPet != null:
return getPet(_that.id);case _CreatePet() when createPet != null:
return createPet(_that.params);case _UpdatePet() when updatePet != null:
return updatePet(_that.params);case _DeletePet() when deletePet != null:
return deletePet(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _GetPets implements PetEvent {
  const _GetPets({required this.params, this.isSearch = false});
  

 final  PetFilterParams params;
@JsonKey() final  bool isSearch;

/// Create a copy of PetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPetsCopyWith<_GetPets> get copyWith => __$GetPetsCopyWithImpl<_GetPets>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPets&&(identical(other.params, params) || other.params == params)&&(identical(other.isSearch, isSearch) || other.isSearch == isSearch));
}


@override
int get hashCode => Object.hash(runtimeType,params,isSearch);

@override
String toString() {
  return 'PetEvent.getPets(params: $params, isSearch: $isSearch)';
}


}

/// @nodoc
abstract mixin class _$GetPetsCopyWith<$Res> implements $PetEventCopyWith<$Res> {
  factory _$GetPetsCopyWith(_GetPets value, $Res Function(_GetPets) _then) = __$GetPetsCopyWithImpl;
@useResult
$Res call({
 PetFilterParams params, bool isSearch
});


$PetFilterParamsCopyWith<$Res> get params;

}
/// @nodoc
class __$GetPetsCopyWithImpl<$Res>
    implements _$GetPetsCopyWith<$Res> {
  __$GetPetsCopyWithImpl(this._self, this._then);

  final _GetPets _self;
  final $Res Function(_GetPets) _then;

/// Create a copy of PetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,Object? isSearch = null,}) {
  return _then(_GetPets(
params: null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as PetFilterParams,isSearch: null == isSearch ? _self.isSearch : isSearch // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PetEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetFilterParamsCopyWith<$Res> get params {
  
  return $PetFilterParamsCopyWith<$Res>(_self.params, (value) {
    return _then(_self.copyWith(params: value));
  });
}
}

/// @nodoc


class _GetUserPets implements PetEvent {
  const _GetUserPets();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetUserPets);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetEvent.getUserPets()';
}


}




/// @nodoc


class _GetPet implements PetEvent {
  const _GetPet(this.id);
  

 final  String id;

/// Create a copy of PetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPetCopyWith<_GetPet> get copyWith => __$GetPetCopyWithImpl<_GetPet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPet&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'PetEvent.getPet(id: $id)';
}


}

/// @nodoc
abstract mixin class _$GetPetCopyWith<$Res> implements $PetEventCopyWith<$Res> {
  factory _$GetPetCopyWith(_GetPet value, $Res Function(_GetPet) _then) = __$GetPetCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$GetPetCopyWithImpl<$Res>
    implements _$GetPetCopyWith<$Res> {
  __$GetPetCopyWithImpl(this._self, this._then);

  final _GetPet _self;
  final $Res Function(_GetPet) _then;

/// Create a copy of PetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_GetPet(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CreatePet implements PetEvent {
  const _CreatePet(this.params);
  

 final  CreatePetParams params;

/// Create a copy of PetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePetCopyWith<_CreatePet> get copyWith => __$CreatePetCopyWithImpl<_CreatePet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePet&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'PetEvent.createPet(params: $params)';
}


}

/// @nodoc
abstract mixin class _$CreatePetCopyWith<$Res> implements $PetEventCopyWith<$Res> {
  factory _$CreatePetCopyWith(_CreatePet value, $Res Function(_CreatePet) _then) = __$CreatePetCopyWithImpl;
@useResult
$Res call({
 CreatePetParams params
});




}
/// @nodoc
class __$CreatePetCopyWithImpl<$Res>
    implements _$CreatePetCopyWith<$Res> {
  __$CreatePetCopyWithImpl(this._self, this._then);

  final _CreatePet _self;
  final $Res Function(_CreatePet) _then;

/// Create a copy of PetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(_CreatePet(
null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as CreatePetParams,
  ));
}


}

/// @nodoc


class _UpdatePet implements PetEvent {
  const _UpdatePet(this.params);
  

 final  UpdatePetParams params;

/// Create a copy of PetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePetCopyWith<_UpdatePet> get copyWith => __$UpdatePetCopyWithImpl<_UpdatePet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePet&&(identical(other.params, params) || other.params == params));
}


@override
int get hashCode => Object.hash(runtimeType,params);

@override
String toString() {
  return 'PetEvent.updatePet(params: $params)';
}


}

/// @nodoc
abstract mixin class _$UpdatePetCopyWith<$Res> implements $PetEventCopyWith<$Res> {
  factory _$UpdatePetCopyWith(_UpdatePet value, $Res Function(_UpdatePet) _then) = __$UpdatePetCopyWithImpl;
@useResult
$Res call({
 UpdatePetParams params
});




}
/// @nodoc
class __$UpdatePetCopyWithImpl<$Res>
    implements _$UpdatePetCopyWith<$Res> {
  __$UpdatePetCopyWithImpl(this._self, this._then);

  final _UpdatePet _self;
  final $Res Function(_UpdatePet) _then;

/// Create a copy of PetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? params = null,}) {
  return _then(_UpdatePet(
null == params ? _self.params : params // ignore: cast_nullable_to_non_nullable
as UpdatePetParams,
  ));
}


}

/// @nodoc


class _DeletePet implements PetEvent {
  const _DeletePet(this.id);
  

 final  String id;

/// Create a copy of PetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeletePetCopyWith<_DeletePet> get copyWith => __$DeletePetCopyWithImpl<_DeletePet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeletePet&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'PetEvent.deletePet(id: $id)';
}


}

/// @nodoc
abstract mixin class _$DeletePetCopyWith<$Res> implements $PetEventCopyWith<$Res> {
  factory _$DeletePetCopyWith(_DeletePet value, $Res Function(_DeletePet) _then) = __$DeletePetCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$DeletePetCopyWithImpl<$Res>
    implements _$DeletePetCopyWith<$Res> {
  __$DeletePetCopyWithImpl(this._self, this._then);

  final _DeletePet _self;
  final $Res Function(_DeletePet) _then;

/// Create a copy of PetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_DeletePet(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PetState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetState()';
}


}

/// @nodoc
class $PetStateCopyWith<$Res>  {
$PetStateCopyWith(PetState _, $Res Function(PetState) __);
}


/// Adds pattern-matching-related methods to [PetState].
extension PetStatePatterns on PetState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Creating value)?  creating,TResult Function( _CreatePetSuccess value)?  createPetSuccess,TResult Function( _Updating value)?  updating,TResult Function( _UpdatePetSuccess value)?  updatePetSuccess,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Creating() when creating != null:
return creating(_that);case _CreatePetSuccess() when createPetSuccess != null:
return createPetSuccess(_that);case _Updating() when updating != null:
return updating(_that);case _UpdatePetSuccess() when updatePetSuccess != null:
return updatePetSuccess(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Creating value)  creating,required TResult Function( _CreatePetSuccess value)  createPetSuccess,required TResult Function( _Updating value)  updating,required TResult Function( _UpdatePetSuccess value)  updatePetSuccess,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Creating():
return creating(_that);case _CreatePetSuccess():
return createPetSuccess(_that);case _Updating():
return updating(_that);case _UpdatePetSuccess():
return updatePetSuccess(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Creating value)?  creating,TResult? Function( _CreatePetSuccess value)?  createPetSuccess,TResult? Function( _Updating value)?  updating,TResult? Function( _UpdatePetSuccess value)?  updatePetSuccess,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Creating() when creating != null:
return creating(_that);case _CreatePetSuccess() when createPetSuccess != null:
return createPetSuccess(_that);case _Updating() when updating != null:
return updating(_that);case _UpdatePetSuccess() when updatePetSuccess != null:
return updatePetSuccess(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Pet> homePets,  List<Pet> searchPets,  List<Pet> userPets,  Pet? pet)?  loaded,TResult Function()?  creating,TResult Function()?  createPetSuccess,TResult Function()?  updating,TResult Function()?  updatePetSuccess,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.homePets,_that.searchPets,_that.userPets,_that.pet);case _Creating() when creating != null:
return creating();case _CreatePetSuccess() when createPetSuccess != null:
return createPetSuccess();case _Updating() when updating != null:
return updating();case _UpdatePetSuccess() when updatePetSuccess != null:
return updatePetSuccess();case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Pet> homePets,  List<Pet> searchPets,  List<Pet> userPets,  Pet? pet)  loaded,required TResult Function()  creating,required TResult Function()  createPetSuccess,required TResult Function()  updating,required TResult Function()  updatePetSuccess,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.homePets,_that.searchPets,_that.userPets,_that.pet);case _Creating():
return creating();case _CreatePetSuccess():
return createPetSuccess();case _Updating():
return updating();case _UpdatePetSuccess():
return updatePetSuccess();case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Pet> homePets,  List<Pet> searchPets,  List<Pet> userPets,  Pet? pet)?  loaded,TResult? Function()?  creating,TResult? Function()?  createPetSuccess,TResult? Function()?  updating,TResult? Function()?  updatePetSuccess,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.homePets,_that.searchPets,_that.userPets,_that.pet);case _Creating() when creating != null:
return creating();case _CreatePetSuccess() when createPetSuccess != null:
return createPetSuccess();case _Updating() when updating != null:
return updating();case _UpdatePetSuccess() when updatePetSuccess != null:
return updatePetSuccess();case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements PetState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetState.initial()';
}


}




/// @nodoc


class _Loading implements PetState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetState.loading()';
}


}




/// @nodoc


class _Loaded implements PetState {
  const _Loaded({final  List<Pet> homePets = const [], final  List<Pet> searchPets = const [], final  List<Pet> userPets = const [], this.pet}): _homePets = homePets,_searchPets = searchPets,_userPets = userPets;
  

 final  List<Pet> _homePets;
@JsonKey() List<Pet> get homePets {
  if (_homePets is EqualUnmodifiableListView) return _homePets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_homePets);
}

 final  List<Pet> _searchPets;
@JsonKey() List<Pet> get searchPets {
  if (_searchPets is EqualUnmodifiableListView) return _searchPets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchPets);
}

 final  List<Pet> _userPets;
@JsonKey() List<Pet> get userPets {
  if (_userPets is EqualUnmodifiableListView) return _userPets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userPets);
}

 final  Pet? pet;

/// Create a copy of PetState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._homePets, _homePets)&&const DeepCollectionEquality().equals(other._searchPets, _searchPets)&&const DeepCollectionEquality().equals(other._userPets, _userPets)&&(identical(other.pet, pet) || other.pet == pet));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_homePets),const DeepCollectionEquality().hash(_searchPets),const DeepCollectionEquality().hash(_userPets),pet);

@override
String toString() {
  return 'PetState.loaded(homePets: $homePets, searchPets: $searchPets, userPets: $userPets, pet: $pet)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $PetStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<Pet> homePets, List<Pet> searchPets, List<Pet> userPets, Pet? pet
});


$PetCopyWith<$Res>? get pet;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of PetState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? homePets = null,Object? searchPets = null,Object? userPets = null,Object? pet = freezed,}) {
  return _then(_Loaded(
homePets: null == homePets ? _self._homePets : homePets // ignore: cast_nullable_to_non_nullable
as List<Pet>,searchPets: null == searchPets ? _self._searchPets : searchPets // ignore: cast_nullable_to_non_nullable
as List<Pet>,userPets: null == userPets ? _self._userPets : userPets // ignore: cast_nullable_to_non_nullable
as List<Pet>,pet: freezed == pet ? _self.pet : pet // ignore: cast_nullable_to_non_nullable
as Pet?,
  ));
}

/// Create a copy of PetState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetCopyWith<$Res>? get pet {
    if (_self.pet == null) {
    return null;
  }

  return $PetCopyWith<$Res>(_self.pet!, (value) {
    return _then(_self.copyWith(pet: value));
  });
}
}

/// @nodoc


class _Creating implements PetState {
  const _Creating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Creating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetState.creating()';
}


}




/// @nodoc


class _CreatePetSuccess implements PetState {
  const _CreatePetSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePetSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetState.createPetSuccess()';
}


}




/// @nodoc


class _Updating implements PetState {
  const _Updating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetState.updating()';
}


}




/// @nodoc


class _UpdatePetSuccess implements PetState {
  const _UpdatePetSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePetSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PetState.updatePetSuccess()';
}


}




/// @nodoc


class _Error implements PetState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of PetState
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
  return 'PetState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $PetStateCopyWith<$Res> {
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

/// Create a copy of PetState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
