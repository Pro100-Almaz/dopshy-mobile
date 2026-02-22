// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScanRecord {

@HiveField(0) String get id;@HiveField(1) String get userId;@HiveField(2) String get buildingId;@HiveField(3) String get buildingName;@HiveField(4) DateTime get timestamp;@HiveField(5) ScanType get type;
/// Create a copy of ScanRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanRecordCopyWith<ScanRecord> get copyWith => _$ScanRecordCopyWithImpl<ScanRecord>(this as ScanRecord, _$identity);

  /// Serializes this ScanRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.buildingName, buildingName) || other.buildingName == buildingName)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,buildingId,buildingName,timestamp,type);

@override
String toString() {
  return 'ScanRecord(id: $id, userId: $userId, buildingId: $buildingId, buildingName: $buildingName, timestamp: $timestamp, type: $type)';
}


}

/// @nodoc
abstract mixin class $ScanRecordCopyWith<$Res>  {
  factory $ScanRecordCopyWith(ScanRecord value, $Res Function(ScanRecord) _then) = _$ScanRecordCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String userId,@HiveField(2) String buildingId,@HiveField(3) String buildingName,@HiveField(4) DateTime timestamp,@HiveField(5) ScanType type
});




}
/// @nodoc
class _$ScanRecordCopyWithImpl<$Res>
    implements $ScanRecordCopyWith<$Res> {
  _$ScanRecordCopyWithImpl(this._self, this._then);

  final ScanRecord _self;
  final $Res Function(ScanRecord) _then;

/// Create a copy of ScanRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? buildingId = null,Object? buildingName = null,Object? timestamp = null,Object? type = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String,buildingName: null == buildingName ? _self.buildingName : buildingName // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ScanType,
  ));
}

}


/// Adds pattern-matching-related methods to [ScanRecord].
extension ScanRecordPatterns on ScanRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScanRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScanRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScanRecord value)  $default,){
final _that = this;
switch (_that) {
case _ScanRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScanRecord value)?  $default,){
final _that = this;
switch (_that) {
case _ScanRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String userId, @HiveField(2)  String buildingId, @HiveField(3)  String buildingName, @HiveField(4)  DateTime timestamp, @HiveField(5)  ScanType type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScanRecord() when $default != null:
return $default(_that.id,_that.userId,_that.buildingId,_that.buildingName,_that.timestamp,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String userId, @HiveField(2)  String buildingId, @HiveField(3)  String buildingName, @HiveField(4)  DateTime timestamp, @HiveField(5)  ScanType type)  $default,) {final _that = this;
switch (_that) {
case _ScanRecord():
return $default(_that.id,_that.userId,_that.buildingId,_that.buildingName,_that.timestamp,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String id, @HiveField(1)  String userId, @HiveField(2)  String buildingId, @HiveField(3)  String buildingName, @HiveField(4)  DateTime timestamp, @HiveField(5)  ScanType type)?  $default,) {final _that = this;
switch (_that) {
case _ScanRecord() when $default != null:
return $default(_that.id,_that.userId,_that.buildingId,_that.buildingName,_that.timestamp,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScanRecord implements ScanRecord {
  const _ScanRecord({@HiveField(0) required this.id, @HiveField(1) required this.userId, @HiveField(2) required this.buildingId, @HiveField(3) required this.buildingName, @HiveField(4) required this.timestamp, @HiveField(5) required this.type});
  factory _ScanRecord.fromJson(Map<String, dynamic> json) => _$ScanRecordFromJson(json);

@override@HiveField(0) final  String id;
@override@HiveField(1) final  String userId;
@override@HiveField(2) final  String buildingId;
@override@HiveField(3) final  String buildingName;
@override@HiveField(4) final  DateTime timestamp;
@override@HiveField(5) final  ScanType type;

/// Create a copy of ScanRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanRecordCopyWith<_ScanRecord> get copyWith => __$ScanRecordCopyWithImpl<_ScanRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScanRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.buildingName, buildingName) || other.buildingName == buildingName)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,buildingId,buildingName,timestamp,type);

@override
String toString() {
  return 'ScanRecord(id: $id, userId: $userId, buildingId: $buildingId, buildingName: $buildingName, timestamp: $timestamp, type: $type)';
}


}

/// @nodoc
abstract mixin class _$ScanRecordCopyWith<$Res> implements $ScanRecordCopyWith<$Res> {
  factory _$ScanRecordCopyWith(_ScanRecord value, $Res Function(_ScanRecord) _then) = __$ScanRecordCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String userId,@HiveField(2) String buildingId,@HiveField(3) String buildingName,@HiveField(4) DateTime timestamp,@HiveField(5) ScanType type
});




}
/// @nodoc
class __$ScanRecordCopyWithImpl<$Res>
    implements _$ScanRecordCopyWith<$Res> {
  __$ScanRecordCopyWithImpl(this._self, this._then);

  final _ScanRecord _self;
  final $Res Function(_ScanRecord) _then;

/// Create a copy of ScanRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? buildingId = null,Object? buildingName = null,Object? timestamp = null,Object? type = null,}) {
  return _then(_ScanRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String,buildingName: null == buildingName ? _self.buildingName : buildingName // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ScanType,
  ));
}


}

// dart format on
