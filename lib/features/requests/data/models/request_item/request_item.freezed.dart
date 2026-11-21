// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestItem {

 String get id; String get itemId; String get name; String get barcode; String get unit; double get price; int get quantity; int get availableQuantity; double get total; String? get description; String? get category; double? get specialPrice;
/// Create a copy of RequestItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestItemCopyWith<RequestItem> get copyWith => _$RequestItemCopyWithImpl<RequestItem>(this as RequestItem, _$identity);

  /// Serializes this RequestItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestItem&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.availableQuantity, availableQuantity) || other.availableQuantity == availableQuantity)&&(identical(other.total, total) || other.total == total)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.specialPrice, specialPrice) || other.specialPrice == specialPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itemId,name,barcode,unit,price,quantity,availableQuantity,total,description,category,specialPrice);

@override
String toString() {
  return 'RequestItem(id: $id, itemId: $itemId, name: $name, barcode: $barcode, unit: $unit, price: $price, quantity: $quantity, availableQuantity: $availableQuantity, total: $total, description: $description, category: $category, specialPrice: $specialPrice)';
}


}

/// @nodoc
abstract mixin class $RequestItemCopyWith<$Res>  {
  factory $RequestItemCopyWith(RequestItem value, $Res Function(RequestItem) _then) = _$RequestItemCopyWithImpl;
@useResult
$Res call({
 String id, String itemId, String name, String barcode, String unit, double price, int quantity, int availableQuantity, double total, String? description, String? category, double? specialPrice
});




}
/// @nodoc
class _$RequestItemCopyWithImpl<$Res>
    implements $RequestItemCopyWith<$Res> {
  _$RequestItemCopyWithImpl(this._self, this._then);

  final RequestItem _self;
  final $Res Function(RequestItem) _then;

/// Create a copy of RequestItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? itemId = null,Object? name = null,Object? barcode = null,Object? unit = null,Object? price = null,Object? quantity = null,Object? availableQuantity = null,Object? total = null,Object? description = freezed,Object? category = freezed,Object? specialPrice = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,availableQuantity: null == availableQuantity ? _self.availableQuantity : availableQuantity // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,specialPrice: freezed == specialPrice ? _self.specialPrice : specialPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestItem].
extension RequestItemPatterns on RequestItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestItem value)  $default,){
final _that = this;
switch (_that) {
case _RequestItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestItem value)?  $default,){
final _that = this;
switch (_that) {
case _RequestItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String itemId,  String name,  String barcode,  String unit,  double price,  int quantity,  int availableQuantity,  double total,  String? description,  String? category,  double? specialPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestItem() when $default != null:
return $default(_that.id,_that.itemId,_that.name,_that.barcode,_that.unit,_that.price,_that.quantity,_that.availableQuantity,_that.total,_that.description,_that.category,_that.specialPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String itemId,  String name,  String barcode,  String unit,  double price,  int quantity,  int availableQuantity,  double total,  String? description,  String? category,  double? specialPrice)  $default,) {final _that = this;
switch (_that) {
case _RequestItem():
return $default(_that.id,_that.itemId,_that.name,_that.barcode,_that.unit,_that.price,_that.quantity,_that.availableQuantity,_that.total,_that.description,_that.category,_that.specialPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String itemId,  String name,  String barcode,  String unit,  double price,  int quantity,  int availableQuantity,  double total,  String? description,  String? category,  double? specialPrice)?  $default,) {final _that = this;
switch (_that) {
case _RequestItem() when $default != null:
return $default(_that.id,_that.itemId,_that.name,_that.barcode,_that.unit,_that.price,_that.quantity,_that.availableQuantity,_that.total,_that.description,_that.category,_that.specialPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestItem implements RequestItem {
  const _RequestItem({required this.id, required this.itemId, required this.name, required this.barcode, required this.unit, required this.price, required this.quantity, required this.availableQuantity, this.total = 0, this.description, this.category, this.specialPrice});
  factory _RequestItem.fromJson(Map<String, dynamic> json) => _$RequestItemFromJson(json);

@override final  String id;
@override final  String itemId;
@override final  String name;
@override final  String barcode;
@override final  String unit;
@override final  double price;
@override final  int quantity;
@override final  int availableQuantity;
@override@JsonKey() final  double total;
@override final  String? description;
@override final  String? category;
@override final  double? specialPrice;

/// Create a copy of RequestItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestItemCopyWith<_RequestItem> get copyWith => __$RequestItemCopyWithImpl<_RequestItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestItem&&(identical(other.id, id) || other.id == id)&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.name, name) || other.name == name)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.availableQuantity, availableQuantity) || other.availableQuantity == availableQuantity)&&(identical(other.total, total) || other.total == total)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.specialPrice, specialPrice) || other.specialPrice == specialPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,itemId,name,barcode,unit,price,quantity,availableQuantity,total,description,category,specialPrice);

@override
String toString() {
  return 'RequestItem(id: $id, itemId: $itemId, name: $name, barcode: $barcode, unit: $unit, price: $price, quantity: $quantity, availableQuantity: $availableQuantity, total: $total, description: $description, category: $category, specialPrice: $specialPrice)';
}


}

/// @nodoc
abstract mixin class _$RequestItemCopyWith<$Res> implements $RequestItemCopyWith<$Res> {
  factory _$RequestItemCopyWith(_RequestItem value, $Res Function(_RequestItem) _then) = __$RequestItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String itemId, String name, String barcode, String unit, double price, int quantity, int availableQuantity, double total, String? description, String? category, double? specialPrice
});




}
/// @nodoc
class __$RequestItemCopyWithImpl<$Res>
    implements _$RequestItemCopyWith<$Res> {
  __$RequestItemCopyWithImpl(this._self, this._then);

  final _RequestItem _self;
  final $Res Function(_RequestItem) _then;

/// Create a copy of RequestItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? itemId = null,Object? name = null,Object? barcode = null,Object? unit = null,Object? price = null,Object? quantity = null,Object? availableQuantity = null,Object? total = null,Object? description = freezed,Object? category = freezed,Object? specialPrice = freezed,}) {
  return _then(_RequestItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,availableQuantity: null == availableQuantity ? _self.availableQuantity : availableQuantity // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,specialPrice: freezed == specialPrice ? _self.specialPrice : specialPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
