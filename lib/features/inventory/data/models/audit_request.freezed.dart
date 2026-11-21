// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuditRequest {

 List<AuditItem> get items; String? get notes; DateTime? get auditDate;
/// Create a copy of AuditRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditRequestCopyWith<AuditRequest> get copyWith => _$AuditRequestCopyWithImpl<AuditRequest>(this as AuditRequest, _$identity);

  /// Serializes this AuditRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditRequest&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.auditDate, auditDate) || other.auditDate == auditDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),notes,auditDate);

@override
String toString() {
  return 'AuditRequest(items: $items, notes: $notes, auditDate: $auditDate)';
}


}

/// @nodoc
abstract mixin class $AuditRequestCopyWith<$Res>  {
  factory $AuditRequestCopyWith(AuditRequest value, $Res Function(AuditRequest) _then) = _$AuditRequestCopyWithImpl;
@useResult
$Res call({
 List<AuditItem> items, String? notes, DateTime? auditDate
});




}
/// @nodoc
class _$AuditRequestCopyWithImpl<$Res>
    implements $AuditRequestCopyWith<$Res> {
  _$AuditRequestCopyWithImpl(this._self, this._then);

  final AuditRequest _self;
  final $Res Function(AuditRequest) _then;

/// Create a copy of AuditRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? notes = freezed,Object? auditDate = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<AuditItem>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,auditDate: freezed == auditDate ? _self.auditDate : auditDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuditRequest].
extension AuditRequestPatterns on AuditRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuditRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuditRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuditRequest value)  $default,){
final _that = this;
switch (_that) {
case _AuditRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuditRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AuditRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AuditItem> items,  String? notes,  DateTime? auditDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuditRequest() when $default != null:
return $default(_that.items,_that.notes,_that.auditDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AuditItem> items,  String? notes,  DateTime? auditDate)  $default,) {final _that = this;
switch (_that) {
case _AuditRequest():
return $default(_that.items,_that.notes,_that.auditDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AuditItem> items,  String? notes,  DateTime? auditDate)?  $default,) {final _that = this;
switch (_that) {
case _AuditRequest() when $default != null:
return $default(_that.items,_that.notes,_that.auditDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuditRequest implements AuditRequest {
  const _AuditRequest({required final  List<AuditItem> items, this.notes, this.auditDate}): _items = items;
  factory _AuditRequest.fromJson(Map<String, dynamic> json) => _$AuditRequestFromJson(json);

 final  List<AuditItem> _items;
@override List<AuditItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? notes;
@override final  DateTime? auditDate;

/// Create a copy of AuditRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditRequestCopyWith<_AuditRequest> get copyWith => __$AuditRequestCopyWithImpl<_AuditRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuditRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditRequest&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.auditDate, auditDate) || other.auditDate == auditDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),notes,auditDate);

@override
String toString() {
  return 'AuditRequest(items: $items, notes: $notes, auditDate: $auditDate)';
}


}

/// @nodoc
abstract mixin class _$AuditRequestCopyWith<$Res> implements $AuditRequestCopyWith<$Res> {
  factory _$AuditRequestCopyWith(_AuditRequest value, $Res Function(_AuditRequest) _then) = __$AuditRequestCopyWithImpl;
@override @useResult
$Res call({
 List<AuditItem> items, String? notes, DateTime? auditDate
});




}
/// @nodoc
class __$AuditRequestCopyWithImpl<$Res>
    implements _$AuditRequestCopyWith<$Res> {
  __$AuditRequestCopyWithImpl(this._self, this._then);

  final _AuditRequest _self;
  final $Res Function(_AuditRequest) _then;

/// Create a copy of AuditRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? notes = freezed,Object? auditDate = freezed,}) {
  return _then(_AuditRequest(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<AuditItem>,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,auditDate: freezed == auditDate ? _self.auditDate : auditDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$AuditItem {

 String get itemId; double get auditQuantity;
/// Create a copy of AuditItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuditItemCopyWith<AuditItem> get copyWith => _$AuditItemCopyWithImpl<AuditItem>(this as AuditItem, _$identity);

  /// Serializes this AuditItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuditItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.auditQuantity, auditQuantity) || other.auditQuantity == auditQuantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,auditQuantity);

@override
String toString() {
  return 'AuditItem(itemId: $itemId, auditQuantity: $auditQuantity)';
}


}

/// @nodoc
abstract mixin class $AuditItemCopyWith<$Res>  {
  factory $AuditItemCopyWith(AuditItem value, $Res Function(AuditItem) _then) = _$AuditItemCopyWithImpl;
@useResult
$Res call({
 String itemId, double auditQuantity
});




}
/// @nodoc
class _$AuditItemCopyWithImpl<$Res>
    implements $AuditItemCopyWith<$Res> {
  _$AuditItemCopyWithImpl(this._self, this._then);

  final AuditItem _self;
  final $Res Function(AuditItem) _then;

/// Create a copy of AuditItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? auditQuantity = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,auditQuantity: null == auditQuantity ? _self.auditQuantity : auditQuantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AuditItem].
extension AuditItemPatterns on AuditItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuditItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuditItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuditItem value)  $default,){
final _that = this;
switch (_that) {
case _AuditItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuditItem value)?  $default,){
final _that = this;
switch (_that) {
case _AuditItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itemId,  double auditQuantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuditItem() when $default != null:
return $default(_that.itemId,_that.auditQuantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itemId,  double auditQuantity)  $default,) {final _that = this;
switch (_that) {
case _AuditItem():
return $default(_that.itemId,_that.auditQuantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itemId,  double auditQuantity)?  $default,) {final _that = this;
switch (_that) {
case _AuditItem() when $default != null:
return $default(_that.itemId,_that.auditQuantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuditItem implements AuditItem {
  const _AuditItem({required this.itemId, required this.auditQuantity});
  factory _AuditItem.fromJson(Map<String, dynamic> json) => _$AuditItemFromJson(json);

@override final  String itemId;
@override final  double auditQuantity;

/// Create a copy of AuditItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuditItemCopyWith<_AuditItem> get copyWith => __$AuditItemCopyWithImpl<_AuditItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuditItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuditItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.auditQuantity, auditQuantity) || other.auditQuantity == auditQuantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,auditQuantity);

@override
String toString() {
  return 'AuditItem(itemId: $itemId, auditQuantity: $auditQuantity)';
}


}

/// @nodoc
abstract mixin class _$AuditItemCopyWith<$Res> implements $AuditItemCopyWith<$Res> {
  factory _$AuditItemCopyWith(_AuditItem value, $Res Function(_AuditItem) _then) = __$AuditItemCopyWithImpl;
@override @useResult
$Res call({
 String itemId, double auditQuantity
});




}
/// @nodoc
class __$AuditItemCopyWithImpl<$Res>
    implements _$AuditItemCopyWith<$Res> {
  __$AuditItemCopyWithImpl(this._self, this._then);

  final _AuditItem _self;
  final $Res Function(_AuditItem) _then;

/// Create a copy of AuditItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? auditQuantity = null,}) {
  return _then(_AuditItem(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,auditQuantity: null == auditQuantity ? _self.auditQuantity : auditQuantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
