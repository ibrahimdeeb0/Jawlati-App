// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoadRequest {

 String get id; String get requestNumber; DateTime get date; RequestStatus get status; List<RequestItem> get items; String get notes; DateTime? get createdAt; DateTime? get updatedAt; String? get approvedBy; DateTime? get approvedAt; String? get rejectionReason;
/// Create a copy of LoadRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadRequestCopyWith<LoadRequest> get copyWith => _$LoadRequestCopyWithImpl<LoadRequest>(this as LoadRequest, _$identity);

  /// Serializes this LoadRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.requestNumber, requestNumber) || other.requestNumber == requestNumber)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requestNumber,date,status,const DeepCollectionEquality().hash(items),notes,createdAt,updatedAt,approvedBy,approvedAt,rejectionReason);

@override
String toString() {
  return 'LoadRequest(id: $id, requestNumber: $requestNumber, date: $date, status: $status, items: $items, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, approvedBy: $approvedBy, approvedAt: $approvedAt, rejectionReason: $rejectionReason)';
}


}

/// @nodoc
abstract mixin class $LoadRequestCopyWith<$Res>  {
  factory $LoadRequestCopyWith(LoadRequest value, $Res Function(LoadRequest) _then) = _$LoadRequestCopyWithImpl;
@useResult
$Res call({
 String id, String requestNumber, DateTime date, RequestStatus status, List<RequestItem> items, String notes, DateTime? createdAt, DateTime? updatedAt, String? approvedBy, DateTime? approvedAt, String? rejectionReason
});




}
/// @nodoc
class _$LoadRequestCopyWithImpl<$Res>
    implements $LoadRequestCopyWith<$Res> {
  _$LoadRequestCopyWithImpl(this._self, this._then);

  final LoadRequest _self;
  final $Res Function(LoadRequest) _then;

/// Create a copy of LoadRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? requestNumber = null,Object? date = null,Object? status = null,Object? items = null,Object? notes = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? approvedBy = freezed,Object? approvedAt = freezed,Object? rejectionReason = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requestNumber: null == requestNumber ? _self.requestNumber : requestNumber // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RequestStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<RequestItem>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoadRequest].
extension LoadRequestPatterns on LoadRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoadRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoadRequest value)  $default,){
final _that = this;
switch (_that) {
case _LoadRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoadRequest value)?  $default,){
final _that = this;
switch (_that) {
case _LoadRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String requestNumber,  DateTime date,  RequestStatus status,  List<RequestItem> items,  String notes,  DateTime? createdAt,  DateTime? updatedAt,  String? approvedBy,  DateTime? approvedAt,  String? rejectionReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadRequest() when $default != null:
return $default(_that.id,_that.requestNumber,_that.date,_that.status,_that.items,_that.notes,_that.createdAt,_that.updatedAt,_that.approvedBy,_that.approvedAt,_that.rejectionReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String requestNumber,  DateTime date,  RequestStatus status,  List<RequestItem> items,  String notes,  DateTime? createdAt,  DateTime? updatedAt,  String? approvedBy,  DateTime? approvedAt,  String? rejectionReason)  $default,) {final _that = this;
switch (_that) {
case _LoadRequest():
return $default(_that.id,_that.requestNumber,_that.date,_that.status,_that.items,_that.notes,_that.createdAt,_that.updatedAt,_that.approvedBy,_that.approvedAt,_that.rejectionReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String requestNumber,  DateTime date,  RequestStatus status,  List<RequestItem> items,  String notes,  DateTime? createdAt,  DateTime? updatedAt,  String? approvedBy,  DateTime? approvedAt,  String? rejectionReason)?  $default,) {final _that = this;
switch (_that) {
case _LoadRequest() when $default != null:
return $default(_that.id,_that.requestNumber,_that.date,_that.status,_that.items,_that.notes,_that.createdAt,_that.updatedAt,_that.approvedBy,_that.approvedAt,_that.rejectionReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoadRequest implements LoadRequest {
  const _LoadRequest({required this.id, required this.requestNumber, required this.date, required this.status, required final  List<RequestItem> items, this.notes = '', this.createdAt, this.updatedAt, this.approvedBy, this.approvedAt, this.rejectionReason}): _items = items;
  factory _LoadRequest.fromJson(Map<String, dynamic> json) => _$LoadRequestFromJson(json);

@override final  String id;
@override final  String requestNumber;
@override final  DateTime date;
@override final  RequestStatus status;
 final  List<RequestItem> _items;
@override List<RequestItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  String notes;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  String? approvedBy;
@override final  DateTime? approvedAt;
@override final  String? rejectionReason;

/// Create a copy of LoadRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadRequestCopyWith<_LoadRequest> get copyWith => __$LoadRequestCopyWithImpl<_LoadRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoadRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.requestNumber, requestNumber) || other.requestNumber == requestNumber)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.approvedAt, approvedAt) || other.approvedAt == approvedAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requestNumber,date,status,const DeepCollectionEquality().hash(_items),notes,createdAt,updatedAt,approvedBy,approvedAt,rejectionReason);

@override
String toString() {
  return 'LoadRequest(id: $id, requestNumber: $requestNumber, date: $date, status: $status, items: $items, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, approvedBy: $approvedBy, approvedAt: $approvedAt, rejectionReason: $rejectionReason)';
}


}

/// @nodoc
abstract mixin class _$LoadRequestCopyWith<$Res> implements $LoadRequestCopyWith<$Res> {
  factory _$LoadRequestCopyWith(_LoadRequest value, $Res Function(_LoadRequest) _then) = __$LoadRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, String requestNumber, DateTime date, RequestStatus status, List<RequestItem> items, String notes, DateTime? createdAt, DateTime? updatedAt, String? approvedBy, DateTime? approvedAt, String? rejectionReason
});




}
/// @nodoc
class __$LoadRequestCopyWithImpl<$Res>
    implements _$LoadRequestCopyWith<$Res> {
  __$LoadRequestCopyWithImpl(this._self, this._then);

  final _LoadRequest _self;
  final $Res Function(_LoadRequest) _then;

/// Create a copy of LoadRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? requestNumber = null,Object? date = null,Object? status = null,Object? items = null,Object? notes = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? approvedBy = freezed,Object? approvedAt = freezed,Object? rejectionReason = freezed,}) {
  return _then(_LoadRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requestNumber: null == requestNumber ? _self.requestNumber : requestNumber // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RequestStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<RequestItem>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,approvedAt: freezed == approvedAt ? _self.approvedAt : approvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
