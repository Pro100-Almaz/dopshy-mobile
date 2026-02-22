// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileUiModel {

 UserProfile? get profile; bool get isLoading; String? get error;
/// Create a copy of ProfileUiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileUiModelCopyWith<ProfileUiModel> get copyWith => _$ProfileUiModelCopyWithImpl<ProfileUiModel>(this as ProfileUiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileUiModel&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,profile,isLoading,error);

@override
String toString() {
  return 'ProfileUiModel(profile: $profile, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ProfileUiModelCopyWith<$Res>  {
  factory $ProfileUiModelCopyWith(ProfileUiModel value, $Res Function(ProfileUiModel) _then) = _$ProfileUiModelCopyWithImpl;
@useResult
$Res call({
 UserProfile? profile, bool isLoading, String? error
});


$UserProfileCopyWith<$Res>? get profile;

}
/// @nodoc
class _$ProfileUiModelCopyWithImpl<$Res>
    implements $ProfileUiModelCopyWith<$Res> {
  _$ProfileUiModelCopyWithImpl(this._self, this._then);

  final ProfileUiModel _self;
  final $Res Function(ProfileUiModel) _then;

/// Create a copy of ProfileUiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ProfileUiModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileUiModel].
extension ProfileUiModelPatterns on ProfileUiModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileUiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileUiModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileUiModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileUiModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileUiModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileUiModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserProfile? profile,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileUiModel() when $default != null:
return $default(_that.profile,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserProfile? profile,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ProfileUiModel():
return $default(_that.profile,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserProfile? profile,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ProfileUiModel() when $default != null:
return $default(_that.profile,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileUiModel implements ProfileUiModel {
  const _ProfileUiModel({this.profile, this.isLoading = false, this.error});
  

@override final  UserProfile? profile;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of ProfileUiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileUiModelCopyWith<_ProfileUiModel> get copyWith => __$ProfileUiModelCopyWithImpl<_ProfileUiModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileUiModel&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,profile,isLoading,error);

@override
String toString() {
  return 'ProfileUiModel(profile: $profile, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ProfileUiModelCopyWith<$Res> implements $ProfileUiModelCopyWith<$Res> {
  factory _$ProfileUiModelCopyWith(_ProfileUiModel value, $Res Function(_ProfileUiModel) _then) = __$ProfileUiModelCopyWithImpl;
@override @useResult
$Res call({
 UserProfile? profile, bool isLoading, String? error
});


@override $UserProfileCopyWith<$Res>? get profile;

}
/// @nodoc
class __$ProfileUiModelCopyWithImpl<$Res>
    implements _$ProfileUiModelCopyWith<$Res> {
  __$ProfileUiModelCopyWithImpl(this._self, this._then);

  final _ProfileUiModel _self;
  final $Res Function(_ProfileUiModel) _then;

/// Create a copy of ProfileUiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ProfileUiModel(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProfileUiModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

// dart format on
