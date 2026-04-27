// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nav_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NavItem {

 IconData get icon; String get title; String get routeName;
/// Create a copy of NavItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavItemCopyWith<NavItem> get copyWith => _$NavItemCopyWithImpl<NavItem>(this as NavItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavItem&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.title, title) || other.title == title)&&(identical(other.routeName, routeName) || other.routeName == routeName));
}


@override
int get hashCode => Object.hash(runtimeType,icon,title,routeName);

@override
String toString() {
  return 'NavItem(icon: $icon, title: $title, routeName: $routeName)';
}


}

/// @nodoc
abstract mixin class $NavItemCopyWith<$Res>  {
  factory $NavItemCopyWith(NavItem value, $Res Function(NavItem) _then) = _$NavItemCopyWithImpl;
@useResult
$Res call({
 IconData icon, String title, String routeName
});




}
/// @nodoc
class _$NavItemCopyWithImpl<$Res>
    implements $NavItemCopyWith<$Res> {
  _$NavItemCopyWithImpl(this._self, this._then);

  final NavItem _self;
  final $Res Function(NavItem) _then;

/// Create a copy of NavItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? icon = null,Object? title = null,Object? routeName = null,}) {
  return _then(_self.copyWith(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,routeName: null == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NavItem].
extension NavItemPatterns on NavItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavItem value)  $default,){
final _that = this;
switch (_that) {
case _NavItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavItem value)?  $default,){
final _that = this;
switch (_that) {
case _NavItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IconData icon,  String title,  String routeName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavItem() when $default != null:
return $default(_that.icon,_that.title,_that.routeName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IconData icon,  String title,  String routeName)  $default,) {final _that = this;
switch (_that) {
case _NavItem():
return $default(_that.icon,_that.title,_that.routeName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IconData icon,  String title,  String routeName)?  $default,) {final _that = this;
switch (_that) {
case _NavItem() when $default != null:
return $default(_that.icon,_that.title,_that.routeName);case _:
  return null;

}
}

}

/// @nodoc


class _NavItem implements NavItem {
  const _NavItem({required this.icon, required this.title, required this.routeName});
  

@override final  IconData icon;
@override final  String title;
@override final  String routeName;

/// Create a copy of NavItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavItemCopyWith<_NavItem> get copyWith => __$NavItemCopyWithImpl<_NavItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavItem&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.title, title) || other.title == title)&&(identical(other.routeName, routeName) || other.routeName == routeName));
}


@override
int get hashCode => Object.hash(runtimeType,icon,title,routeName);

@override
String toString() {
  return 'NavItem(icon: $icon, title: $title, routeName: $routeName)';
}


}

/// @nodoc
abstract mixin class _$NavItemCopyWith<$Res> implements $NavItemCopyWith<$Res> {
  factory _$NavItemCopyWith(_NavItem value, $Res Function(_NavItem) _then) = __$NavItemCopyWithImpl;
@override @useResult
$Res call({
 IconData icon, String title, String routeName
});




}
/// @nodoc
class __$NavItemCopyWithImpl<$Res>
    implements _$NavItemCopyWith<$Res> {
  __$NavItemCopyWithImpl(this._self, this._then);

  final _NavItem _self;
  final $Res Function(_NavItem) _then;

/// Create a copy of NavItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? icon = null,Object? title = null,Object? routeName = null,}) {
  return _then(_NavItem(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,routeName: null == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
