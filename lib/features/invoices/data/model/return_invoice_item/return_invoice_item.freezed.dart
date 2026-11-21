// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_invoice_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReturnInvoiceItem {

 String get itemId; String get name; String get unit; double get originalPrice;// السعر في الفاتورة الأصلية
 int get returnedQuantity;// الكمية المرتجعة
 int get originalQuantity;// الكمية الأصلية
 String? get returnReason;// سبب إرجاع هذا الصنف
 String? get notes; bool get isDamaged;// هل السلعة تالفة؟
 DateTime? get expiryDate;
/// Create a copy of ReturnInvoiceItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReturnInvoiceItemCopyWith<ReturnInvoiceItem> get copyWith => _$ReturnInvoiceItemCopyWithImpl<ReturnInvoiceItem>(this as ReturnInvoiceItem, _$identity);

  /// Serializes this ReturnInvoiceItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReturnInvoiceItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.returnedQuantity, returnedQuantity) || other.returnedQuantity == returnedQuantity)&&(identical(other.originalQuantity, originalQuantity) || other.originalQuantity == originalQuantity)&&(identical(other.returnReason, returnReason) || other.returnReason == returnReason)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isDamaged, isDamaged) || other.isDamaged == isDamaged)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,name,unit,originalPrice,returnedQuantity,originalQuantity,returnReason,notes,isDamaged,expiryDate);

@override
String toString() {
  return 'ReturnInvoiceItem(itemId: $itemId, name: $name, unit: $unit, originalPrice: $originalPrice, returnedQuantity: $returnedQuantity, originalQuantity: $originalQuantity, returnReason: $returnReason, notes: $notes, isDamaged: $isDamaged, expiryDate: $expiryDate)';
}


}

/// @nodoc
abstract mixin class $ReturnInvoiceItemCopyWith<$Res>  {
  factory $ReturnInvoiceItemCopyWith(ReturnInvoiceItem value, $Res Function(ReturnInvoiceItem) _then) = _$ReturnInvoiceItemCopyWithImpl;
@useResult
$Res call({
 String itemId, String name, String unit, double originalPrice, int returnedQuantity, int originalQuantity, String? returnReason, String? notes, bool isDamaged, DateTime? expiryDate
});




}
/// @nodoc
class _$ReturnInvoiceItemCopyWithImpl<$Res>
    implements $ReturnInvoiceItemCopyWith<$Res> {
  _$ReturnInvoiceItemCopyWithImpl(this._self, this._then);

  final ReturnInvoiceItem _self;
  final $Res Function(ReturnInvoiceItem) _then;

/// Create a copy of ReturnInvoiceItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? name = null,Object? unit = null,Object? originalPrice = null,Object? returnedQuantity = null,Object? originalQuantity = null,Object? returnReason = freezed,Object? notes = freezed,Object? isDamaged = null,Object? expiryDate = freezed,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,originalPrice: null == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double,returnedQuantity: null == returnedQuantity ? _self.returnedQuantity : returnedQuantity // ignore: cast_nullable_to_non_nullable
as int,originalQuantity: null == originalQuantity ? _self.originalQuantity : originalQuantity // ignore: cast_nullable_to_non_nullable
as int,returnReason: freezed == returnReason ? _self.returnReason : returnReason // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isDamaged: null == isDamaged ? _self.isDamaged : isDamaged // ignore: cast_nullable_to_non_nullable
as bool,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReturnInvoiceItem].
extension ReturnInvoiceItemPatterns on ReturnInvoiceItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReturnInvoiceItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReturnInvoiceItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReturnInvoiceItem value)  $default,){
final _that = this;
switch (_that) {
case _ReturnInvoiceItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReturnInvoiceItem value)?  $default,){
final _that = this;
switch (_that) {
case _ReturnInvoiceItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itemId,  String name,  String unit,  double originalPrice,  int returnedQuantity,  int originalQuantity,  String? returnReason,  String? notes,  bool isDamaged,  DateTime? expiryDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReturnInvoiceItem() when $default != null:
return $default(_that.itemId,_that.name,_that.unit,_that.originalPrice,_that.returnedQuantity,_that.originalQuantity,_that.returnReason,_that.notes,_that.isDamaged,_that.expiryDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itemId,  String name,  String unit,  double originalPrice,  int returnedQuantity,  int originalQuantity,  String? returnReason,  String? notes,  bool isDamaged,  DateTime? expiryDate)  $default,) {final _that = this;
switch (_that) {
case _ReturnInvoiceItem():
return $default(_that.itemId,_that.name,_that.unit,_that.originalPrice,_that.returnedQuantity,_that.originalQuantity,_that.returnReason,_that.notes,_that.isDamaged,_that.expiryDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itemId,  String name,  String unit,  double originalPrice,  int returnedQuantity,  int originalQuantity,  String? returnReason,  String? notes,  bool isDamaged,  DateTime? expiryDate)?  $default,) {final _that = this;
switch (_that) {
case _ReturnInvoiceItem() when $default != null:
return $default(_that.itemId,_that.name,_that.unit,_that.originalPrice,_that.returnedQuantity,_that.originalQuantity,_that.returnReason,_that.notes,_that.isDamaged,_that.expiryDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReturnInvoiceItem extends ReturnInvoiceItem {
  const _ReturnInvoiceItem({required this.itemId, required this.name, required this.unit, required this.originalPrice, required this.returnedQuantity, required this.originalQuantity, this.returnReason, this.notes, this.isDamaged = false, this.expiryDate}): super._();
  factory _ReturnInvoiceItem.fromJson(Map<String, dynamic> json) => _$ReturnInvoiceItemFromJson(json);

@override final  String itemId;
@override final  String name;
@override final  String unit;
@override final  double originalPrice;
// السعر في الفاتورة الأصلية
@override final  int returnedQuantity;
// الكمية المرتجعة
@override final  int originalQuantity;
// الكمية الأصلية
@override final  String? returnReason;
// سبب إرجاع هذا الصنف
@override final  String? notes;
@override@JsonKey() final  bool isDamaged;
// هل السلعة تالفة؟
@override final  DateTime? expiryDate;

/// Create a copy of ReturnInvoiceItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReturnInvoiceItemCopyWith<_ReturnInvoiceItem> get copyWith => __$ReturnInvoiceItemCopyWithImpl<_ReturnInvoiceItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReturnInvoiceItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReturnInvoiceItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.returnedQuantity, returnedQuantity) || other.returnedQuantity == returnedQuantity)&&(identical(other.originalQuantity, originalQuantity) || other.originalQuantity == originalQuantity)&&(identical(other.returnReason, returnReason) || other.returnReason == returnReason)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isDamaged, isDamaged) || other.isDamaged == isDamaged)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,name,unit,originalPrice,returnedQuantity,originalQuantity,returnReason,notes,isDamaged,expiryDate);

@override
String toString() {
  return 'ReturnInvoiceItem(itemId: $itemId, name: $name, unit: $unit, originalPrice: $originalPrice, returnedQuantity: $returnedQuantity, originalQuantity: $originalQuantity, returnReason: $returnReason, notes: $notes, isDamaged: $isDamaged, expiryDate: $expiryDate)';
}


}

/// @nodoc
abstract mixin class _$ReturnInvoiceItemCopyWith<$Res> implements $ReturnInvoiceItemCopyWith<$Res> {
  factory _$ReturnInvoiceItemCopyWith(_ReturnInvoiceItem value, $Res Function(_ReturnInvoiceItem) _then) = __$ReturnInvoiceItemCopyWithImpl;
@override @useResult
$Res call({
 String itemId, String name, String unit, double originalPrice, int returnedQuantity, int originalQuantity, String? returnReason, String? notes, bool isDamaged, DateTime? expiryDate
});




}
/// @nodoc
class __$ReturnInvoiceItemCopyWithImpl<$Res>
    implements _$ReturnInvoiceItemCopyWith<$Res> {
  __$ReturnInvoiceItemCopyWithImpl(this._self, this._then);

  final _ReturnInvoiceItem _self;
  final $Res Function(_ReturnInvoiceItem) _then;

/// Create a copy of ReturnInvoiceItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? name = null,Object? unit = null,Object? originalPrice = null,Object? returnedQuantity = null,Object? originalQuantity = null,Object? returnReason = freezed,Object? notes = freezed,Object? isDamaged = null,Object? expiryDate = freezed,}) {
  return _then(_ReturnInvoiceItem(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,originalPrice: null == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double,returnedQuantity: null == returnedQuantity ? _self.returnedQuantity : returnedQuantity // ignore: cast_nullable_to_non_nullable
as int,originalQuantity: null == originalQuantity ? _self.originalQuantity : originalQuantity // ignore: cast_nullable_to_non_nullable
as int,returnReason: freezed == returnReason ? _self.returnReason : returnReason // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isDamaged: null == isDamaged ? _self.isDamaged : isDamaged // ignore: cast_nullable_to_non_nullable
as bool,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
