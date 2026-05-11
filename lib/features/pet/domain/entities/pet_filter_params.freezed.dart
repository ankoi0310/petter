// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_filter_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PetFilterParams {

 List<String>? get favoriteIds; String? get searchTerm; Species? get species; Gender? get gender; double? get minWeight; double? get maxWeight; int? get limit; int? get minAge; int? get maxAge; bool get showAdopted; String get sortBy; bool get descending;
/// Create a copy of PetFilterParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PetFilterParamsCopyWith<PetFilterParams> get copyWith => _$PetFilterParamsCopyWithImpl<PetFilterParams>(this as PetFilterParams, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PetFilterParams&&const DeepCollectionEquality().equals(other.favoriteIds, favoriteIds)&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.species, species) || other.species == species)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.minWeight, minWeight) || other.minWeight == minWeight)&&(identical(other.maxWeight, maxWeight) || other.maxWeight == maxWeight)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.minAge, minAge) || other.minAge == minAge)&&(identical(other.maxAge, maxAge) || other.maxAge == maxAge)&&(identical(other.showAdopted, showAdopted) || other.showAdopted == showAdopted)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.descending, descending) || other.descending == descending));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(favoriteIds),searchTerm,species,gender,minWeight,maxWeight,limit,minAge,maxAge,showAdopted,sortBy,descending);

@override
String toString() {
  return 'PetFilterParams(favoriteIds: $favoriteIds, searchTerm: $searchTerm, species: $species, gender: $gender, minWeight: $minWeight, maxWeight: $maxWeight, limit: $limit, minAge: $minAge, maxAge: $maxAge, showAdopted: $showAdopted, sortBy: $sortBy, descending: $descending)';
}


}

/// @nodoc
abstract mixin class $PetFilterParamsCopyWith<$Res>  {
  factory $PetFilterParamsCopyWith(PetFilterParams value, $Res Function(PetFilterParams) _then) = _$PetFilterParamsCopyWithImpl;
@useResult
$Res call({
 List<String>? favoriteIds, String? searchTerm, Species? species, Gender? gender, double? minWeight, double? maxWeight, int? limit, int? minAge, int? maxAge, bool showAdopted, String sortBy, bool descending
});




}
/// @nodoc
class _$PetFilterParamsCopyWithImpl<$Res>
    implements $PetFilterParamsCopyWith<$Res> {
  _$PetFilterParamsCopyWithImpl(this._self, this._then);

  final PetFilterParams _self;
  final $Res Function(PetFilterParams) _then;

/// Create a copy of PetFilterParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? favoriteIds = freezed,Object? searchTerm = freezed,Object? species = freezed,Object? gender = freezed,Object? minWeight = freezed,Object? maxWeight = freezed,Object? limit = freezed,Object? minAge = freezed,Object? maxAge = freezed,Object? showAdopted = null,Object? sortBy = null,Object? descending = null,}) {
  return _then(_self.copyWith(
favoriteIds: freezed == favoriteIds ? _self.favoriteIds : favoriteIds // ignore: cast_nullable_to_non_nullable
as List<String>?,searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as Species?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender?,minWeight: freezed == minWeight ? _self.minWeight : minWeight // ignore: cast_nullable_to_non_nullable
as double?,maxWeight: freezed == maxWeight ? _self.maxWeight : maxWeight // ignore: cast_nullable_to_non_nullable
as double?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,minAge: freezed == minAge ? _self.minAge : minAge // ignore: cast_nullable_to_non_nullable
as int?,maxAge: freezed == maxAge ? _self.maxAge : maxAge // ignore: cast_nullable_to_non_nullable
as int?,showAdopted: null == showAdopted ? _self.showAdopted : showAdopted // ignore: cast_nullable_to_non_nullable
as bool,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,descending: null == descending ? _self.descending : descending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PetFilterParams].
extension PetFilterParamsPatterns on PetFilterParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PetFilterParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PetFilterParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PetFilterParams value)  $default,){
final _that = this;
switch (_that) {
case _PetFilterParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PetFilterParams value)?  $default,){
final _that = this;
switch (_that) {
case _PetFilterParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String>? favoriteIds,  String? searchTerm,  Species? species,  Gender? gender,  double? minWeight,  double? maxWeight,  int? limit,  int? minAge,  int? maxAge,  bool showAdopted,  String sortBy,  bool descending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PetFilterParams() when $default != null:
return $default(_that.favoriteIds,_that.searchTerm,_that.species,_that.gender,_that.minWeight,_that.maxWeight,_that.limit,_that.minAge,_that.maxAge,_that.showAdopted,_that.sortBy,_that.descending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String>? favoriteIds,  String? searchTerm,  Species? species,  Gender? gender,  double? minWeight,  double? maxWeight,  int? limit,  int? minAge,  int? maxAge,  bool showAdopted,  String sortBy,  bool descending)  $default,) {final _that = this;
switch (_that) {
case _PetFilterParams():
return $default(_that.favoriteIds,_that.searchTerm,_that.species,_that.gender,_that.minWeight,_that.maxWeight,_that.limit,_that.minAge,_that.maxAge,_that.showAdopted,_that.sortBy,_that.descending);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String>? favoriteIds,  String? searchTerm,  Species? species,  Gender? gender,  double? minWeight,  double? maxWeight,  int? limit,  int? minAge,  int? maxAge,  bool showAdopted,  String sortBy,  bool descending)?  $default,) {final _that = this;
switch (_that) {
case _PetFilterParams() when $default != null:
return $default(_that.favoriteIds,_that.searchTerm,_that.species,_that.gender,_that.minWeight,_that.maxWeight,_that.limit,_that.minAge,_that.maxAge,_that.showAdopted,_that.sortBy,_that.descending);case _:
  return null;

}
}

}

/// @nodoc


class _PetFilterParams implements PetFilterParams {
  const _PetFilterParams({final  List<String>? favoriteIds, this.searchTerm, this.species, this.gender, this.minWeight, this.maxWeight, this.limit, this.minAge, this.maxAge, this.showAdopted = true, this.sortBy = 'createdAt', this.descending = true}): _favoriteIds = favoriteIds;
  

 final  List<String>? _favoriteIds;
@override List<String>? get favoriteIds {
  final value = _favoriteIds;
  if (value == null) return null;
  if (_favoriteIds is EqualUnmodifiableListView) return _favoriteIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? searchTerm;
@override final  Species? species;
@override final  Gender? gender;
@override final  double? minWeight;
@override final  double? maxWeight;
@override final  int? limit;
@override final  int? minAge;
@override final  int? maxAge;
@override@JsonKey() final  bool showAdopted;
@override@JsonKey() final  String sortBy;
@override@JsonKey() final  bool descending;

/// Create a copy of PetFilterParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PetFilterParamsCopyWith<_PetFilterParams> get copyWith => __$PetFilterParamsCopyWithImpl<_PetFilterParams>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PetFilterParams&&const DeepCollectionEquality().equals(other._favoriteIds, _favoriteIds)&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.species, species) || other.species == species)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.minWeight, minWeight) || other.minWeight == minWeight)&&(identical(other.maxWeight, maxWeight) || other.maxWeight == maxWeight)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.minAge, minAge) || other.minAge == minAge)&&(identical(other.maxAge, maxAge) || other.maxAge == maxAge)&&(identical(other.showAdopted, showAdopted) || other.showAdopted == showAdopted)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.descending, descending) || other.descending == descending));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_favoriteIds),searchTerm,species,gender,minWeight,maxWeight,limit,minAge,maxAge,showAdopted,sortBy,descending);

@override
String toString() {
  return 'PetFilterParams(favoriteIds: $favoriteIds, searchTerm: $searchTerm, species: $species, gender: $gender, minWeight: $minWeight, maxWeight: $maxWeight, limit: $limit, minAge: $minAge, maxAge: $maxAge, showAdopted: $showAdopted, sortBy: $sortBy, descending: $descending)';
}


}

/// @nodoc
abstract mixin class _$PetFilterParamsCopyWith<$Res> implements $PetFilterParamsCopyWith<$Res> {
  factory _$PetFilterParamsCopyWith(_PetFilterParams value, $Res Function(_PetFilterParams) _then) = __$PetFilterParamsCopyWithImpl;
@override @useResult
$Res call({
 List<String>? favoriteIds, String? searchTerm, Species? species, Gender? gender, double? minWeight, double? maxWeight, int? limit, int? minAge, int? maxAge, bool showAdopted, String sortBy, bool descending
});




}
/// @nodoc
class __$PetFilterParamsCopyWithImpl<$Res>
    implements _$PetFilterParamsCopyWith<$Res> {
  __$PetFilterParamsCopyWithImpl(this._self, this._then);

  final _PetFilterParams _self;
  final $Res Function(_PetFilterParams) _then;

/// Create a copy of PetFilterParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? favoriteIds = freezed,Object? searchTerm = freezed,Object? species = freezed,Object? gender = freezed,Object? minWeight = freezed,Object? maxWeight = freezed,Object? limit = freezed,Object? minAge = freezed,Object? maxAge = freezed,Object? showAdopted = null,Object? sortBy = null,Object? descending = null,}) {
  return _then(_PetFilterParams(
favoriteIds: freezed == favoriteIds ? _self._favoriteIds : favoriteIds // ignore: cast_nullable_to_non_nullable
as List<String>?,searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,species: freezed == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as Species?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender?,minWeight: freezed == minWeight ? _self.minWeight : minWeight // ignore: cast_nullable_to_non_nullable
as double?,maxWeight: freezed == maxWeight ? _self.maxWeight : maxWeight // ignore: cast_nullable_to_non_nullable
as double?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,minAge: freezed == minAge ? _self.minAge : minAge // ignore: cast_nullable_to_non_nullable
as int?,maxAge: freezed == maxAge ? _self.maxAge : maxAge // ignore: cast_nullable_to_non_nullable
as int?,showAdopted: null == showAdopted ? _self.showAdopted : showAdopted // ignore: cast_nullable_to_non_nullable
as bool,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String,descending: null == descending ? _self.descending : descending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
