// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoiceItem {

 String get itemId; String get name; String get unit; double get price; int get quantity; int get stockQuantity; String? get notes; double? get discount; int get quantityOfBonus;// Discount information
 double? get originalPrice; double? get discountAmount; String? get discountDescription; String? get appliedDiscountType; bool? get isDiscountApplied;
/// Create a copy of InvoiceItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceItemCopyWith<InvoiceItem> get copyWith => _$InvoiceItemCopyWithImpl<InvoiceItem>(this as InvoiceItem, _$identity);

  /// Serializes this InvoiceItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.quantityOfBonus, quantityOfBonus) || other.quantityOfBonus == quantityOfBonus)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.discountDescription, discountDescription) || other.discountDescription == discountDescription)&&(identical(other.appliedDiscountType, appliedDiscountType) || other.appliedDiscountType == appliedDiscountType)&&(identical(other.isDiscountApplied, isDiscountApplied) || other.isDiscountApplied == isDiscountApplied));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,name,unit,price,quantity,stockQuantity,notes,discount,quantityOfBonus,originalPrice,discountAmount,discountDescription,appliedDiscountType,isDiscountApplied);

@override
String toString() {
  return 'InvoiceItem(itemId: $itemId, name: $name, unit: $unit, price: $price, quantity: $quantity, stockQuantity: $stockQuantity, notes: $notes, discount: $discount, quantityOfBonus: $quantityOfBonus, originalPrice: $originalPrice, discountAmount: $discountAmount, discountDescription: $discountDescription, appliedDiscountType: $appliedDiscountType, isDiscountApplied: $isDiscountApplied)';
}


}

/// @nodoc
abstract mixin class $InvoiceItemCopyWith<$Res>  {
  factory $InvoiceItemCopyWith(InvoiceItem value, $Res Function(InvoiceItem) _then) = _$InvoiceItemCopyWithImpl;
@useResult
$Res call({
 String itemId, String name, String unit, double price, int quantity, int stockQuantity, String? notes, double? discount, int quantityOfBonus, double? originalPrice, double? discountAmount, String? discountDescription, String? appliedDiscountType, bool? isDiscountApplied
});




}
/// @nodoc
class _$InvoiceItemCopyWithImpl<$Res>
    implements $InvoiceItemCopyWith<$Res> {
  _$InvoiceItemCopyWithImpl(this._self, this._then);

  final InvoiceItem _self;
  final $Res Function(InvoiceItem) _then;

/// Create a copy of InvoiceItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? name = null,Object? unit = null,Object? price = null,Object? quantity = null,Object? stockQuantity = null,Object? notes = freezed,Object? discount = freezed,Object? quantityOfBonus = null,Object? originalPrice = freezed,Object? discountAmount = freezed,Object? discountDescription = freezed,Object? appliedDiscountType = freezed,Object? isDiscountApplied = freezed,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,stockQuantity: null == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double?,quantityOfBonus: null == quantityOfBonus ? _self.quantityOfBonus : quantityOfBonus // ignore: cast_nullable_to_non_nullable
as int,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double?,discountDescription: freezed == discountDescription ? _self.discountDescription : discountDescription // ignore: cast_nullable_to_non_nullable
as String?,appliedDiscountType: freezed == appliedDiscountType ? _self.appliedDiscountType : appliedDiscountType // ignore: cast_nullable_to_non_nullable
as String?,isDiscountApplied: freezed == isDiscountApplied ? _self.isDiscountApplied : isDiscountApplied // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceItem].
extension InvoiceItemPatterns on InvoiceItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceItem value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceItem value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itemId,  String name,  String unit,  double price,  int quantity,  int stockQuantity,  String? notes,  double? discount,  int quantityOfBonus,  double? originalPrice,  double? discountAmount,  String? discountDescription,  String? appliedDiscountType,  bool? isDiscountApplied)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceItem() when $default != null:
return $default(_that.itemId,_that.name,_that.unit,_that.price,_that.quantity,_that.stockQuantity,_that.notes,_that.discount,_that.quantityOfBonus,_that.originalPrice,_that.discountAmount,_that.discountDescription,_that.appliedDiscountType,_that.isDiscountApplied);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itemId,  String name,  String unit,  double price,  int quantity,  int stockQuantity,  String? notes,  double? discount,  int quantityOfBonus,  double? originalPrice,  double? discountAmount,  String? discountDescription,  String? appliedDiscountType,  bool? isDiscountApplied)  $default,) {final _that = this;
switch (_that) {
case _InvoiceItem():
return $default(_that.itemId,_that.name,_that.unit,_that.price,_that.quantity,_that.stockQuantity,_that.notes,_that.discount,_that.quantityOfBonus,_that.originalPrice,_that.discountAmount,_that.discountDescription,_that.appliedDiscountType,_that.isDiscountApplied);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itemId,  String name,  String unit,  double price,  int quantity,  int stockQuantity,  String? notes,  double? discount,  int quantityOfBonus,  double? originalPrice,  double? discountAmount,  String? discountDescription,  String? appliedDiscountType,  bool? isDiscountApplied)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceItem() when $default != null:
return $default(_that.itemId,_that.name,_that.unit,_that.price,_that.quantity,_that.stockQuantity,_that.notes,_that.discount,_that.quantityOfBonus,_that.originalPrice,_that.discountAmount,_that.discountDescription,_that.appliedDiscountType,_that.isDiscountApplied);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceItem extends InvoiceItem {
  const _InvoiceItem({required this.itemId, required this.name, required this.unit, required this.price, required this.quantity, required this.stockQuantity, this.notes, this.discount, this.quantityOfBonus = 0, this.originalPrice, this.discountAmount, this.discountDescription, this.appliedDiscountType, this.isDiscountApplied}): super._();
  factory _InvoiceItem.fromJson(Map<String, dynamic> json) => _$InvoiceItemFromJson(json);

@override final  String itemId;
@override final  String name;
@override final  String unit;
@override final  double price;
@override final  int quantity;
@override final  int stockQuantity;
@override final  String? notes;
@override final  double? discount;
@override@JsonKey() final  int quantityOfBonus;
// Discount information
@override final  double? originalPrice;
@override final  double? discountAmount;
@override final  String? discountDescription;
@override final  String? appliedDiscountType;
@override final  bool? isDiscountApplied;

/// Create a copy of InvoiceItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceItemCopyWith<_InvoiceItem> get copyWith => __$InvoiceItemCopyWithImpl<_InvoiceItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.quantityOfBonus, quantityOfBonus) || other.quantityOfBonus == quantityOfBonus)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.discountDescription, discountDescription) || other.discountDescription == discountDescription)&&(identical(other.appliedDiscountType, appliedDiscountType) || other.appliedDiscountType == appliedDiscountType)&&(identical(other.isDiscountApplied, isDiscountApplied) || other.isDiscountApplied == isDiscountApplied));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,name,unit,price,quantity,stockQuantity,notes,discount,quantityOfBonus,originalPrice,discountAmount,discountDescription,appliedDiscountType,isDiscountApplied);

@override
String toString() {
  return 'InvoiceItem(itemId: $itemId, name: $name, unit: $unit, price: $price, quantity: $quantity, stockQuantity: $stockQuantity, notes: $notes, discount: $discount, quantityOfBonus: $quantityOfBonus, originalPrice: $originalPrice, discountAmount: $discountAmount, discountDescription: $discountDescription, appliedDiscountType: $appliedDiscountType, isDiscountApplied: $isDiscountApplied)';
}


}

/// @nodoc
abstract mixin class _$InvoiceItemCopyWith<$Res> implements $InvoiceItemCopyWith<$Res> {
  factory _$InvoiceItemCopyWith(_InvoiceItem value, $Res Function(_InvoiceItem) _then) = __$InvoiceItemCopyWithImpl;
@override @useResult
$Res call({
 String itemId, String name, String unit, double price, int quantity, int stockQuantity, String? notes, double? discount, int quantityOfBonus, double? originalPrice, double? discountAmount, String? discountDescription, String? appliedDiscountType, bool? isDiscountApplied
});




}
/// @nodoc
class __$InvoiceItemCopyWithImpl<$Res>
    implements _$InvoiceItemCopyWith<$Res> {
  __$InvoiceItemCopyWithImpl(this._self, this._then);

  final _InvoiceItem _self;
  final $Res Function(_InvoiceItem) _then;

/// Create a copy of InvoiceItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? name = null,Object? unit = null,Object? price = null,Object? quantity = null,Object? stockQuantity = null,Object? notes = freezed,Object? discount = freezed,Object? quantityOfBonus = null,Object? originalPrice = freezed,Object? discountAmount = freezed,Object? discountDescription = freezed,Object? appliedDiscountType = freezed,Object? isDiscountApplied = freezed,}) {
  return _then(_InvoiceItem(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,stockQuantity: null == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double?,quantityOfBonus: null == quantityOfBonus ? _self.quantityOfBonus : quantityOfBonus // ignore: cast_nullable_to_non_nullable
as int,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double?,discountDescription: freezed == discountDescription ? _self.discountDescription : discountDescription // ignore: cast_nullable_to_non_nullable
as String?,appliedDiscountType: freezed == appliedDiscountType ? _self.appliedDiscountType : appliedDiscountType // ignore: cast_nullable_to_non_nullable
as String?,isDiscountApplied: freezed == isDiscountApplied ? _self.isDiscountApplied : isDiscountApplied // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
