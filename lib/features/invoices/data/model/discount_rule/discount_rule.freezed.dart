// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiscountRule {

 String get discountType; String get itemNo; String get description;// Type 1 & 2: Direct price override
 double? get itemNoNewPrice;// Type 2, 3 & 4: Minimum quantity condition
 int? get itemNoMinQty;// Type 3: Buy A get B free
 String? get itemNo2ndItemNo; int? get itemNo2ndQty;// Type 4: Linked item discount
 String? get linkedItemNo; double? get linkedItemNewPrice;
/// Create a copy of DiscountRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscountRuleCopyWith<DiscountRule> get copyWith => _$DiscountRuleCopyWithImpl<DiscountRule>(this as DiscountRule, _$identity);

  /// Serializes this DiscountRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscountRule&&(identical(other.discountType, discountType) || other.discountType == discountType)&&(identical(other.itemNo, itemNo) || other.itemNo == itemNo)&&(identical(other.description, description) || other.description == description)&&(identical(other.itemNoNewPrice, itemNoNewPrice) || other.itemNoNewPrice == itemNoNewPrice)&&(identical(other.itemNoMinQty, itemNoMinQty) || other.itemNoMinQty == itemNoMinQty)&&(identical(other.itemNo2ndItemNo, itemNo2ndItemNo) || other.itemNo2ndItemNo == itemNo2ndItemNo)&&(identical(other.itemNo2ndQty, itemNo2ndQty) || other.itemNo2ndQty == itemNo2ndQty)&&(identical(other.linkedItemNo, linkedItemNo) || other.linkedItemNo == linkedItemNo)&&(identical(other.linkedItemNewPrice, linkedItemNewPrice) || other.linkedItemNewPrice == linkedItemNewPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,discountType,itemNo,description,itemNoNewPrice,itemNoMinQty,itemNo2ndItemNo,itemNo2ndQty,linkedItemNo,linkedItemNewPrice);

@override
String toString() {
  return 'DiscountRule(discountType: $discountType, itemNo: $itemNo, description: $description, itemNoNewPrice: $itemNoNewPrice, itemNoMinQty: $itemNoMinQty, itemNo2ndItemNo: $itemNo2ndItemNo, itemNo2ndQty: $itemNo2ndQty, linkedItemNo: $linkedItemNo, linkedItemNewPrice: $linkedItemNewPrice)';
}


}

/// @nodoc
abstract mixin class $DiscountRuleCopyWith<$Res>  {
  factory $DiscountRuleCopyWith(DiscountRule value, $Res Function(DiscountRule) _then) = _$DiscountRuleCopyWithImpl;
@useResult
$Res call({
 String discountType, String itemNo, String description, double? itemNoNewPrice, int? itemNoMinQty, String? itemNo2ndItemNo, int? itemNo2ndQty, String? linkedItemNo, double? linkedItemNewPrice
});




}
/// @nodoc
class _$DiscountRuleCopyWithImpl<$Res>
    implements $DiscountRuleCopyWith<$Res> {
  _$DiscountRuleCopyWithImpl(this._self, this._then);

  final DiscountRule _self;
  final $Res Function(DiscountRule) _then;

/// Create a copy of DiscountRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? discountType = null,Object? itemNo = null,Object? description = null,Object? itemNoNewPrice = freezed,Object? itemNoMinQty = freezed,Object? itemNo2ndItemNo = freezed,Object? itemNo2ndQty = freezed,Object? linkedItemNo = freezed,Object? linkedItemNewPrice = freezed,}) {
  return _then(_self.copyWith(
discountType: null == discountType ? _self.discountType : discountType // ignore: cast_nullable_to_non_nullable
as String,itemNo: null == itemNo ? _self.itemNo : itemNo // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,itemNoNewPrice: freezed == itemNoNewPrice ? _self.itemNoNewPrice : itemNoNewPrice // ignore: cast_nullable_to_non_nullable
as double?,itemNoMinQty: freezed == itemNoMinQty ? _self.itemNoMinQty : itemNoMinQty // ignore: cast_nullable_to_non_nullable
as int?,itemNo2ndItemNo: freezed == itemNo2ndItemNo ? _self.itemNo2ndItemNo : itemNo2ndItemNo // ignore: cast_nullable_to_non_nullable
as String?,itemNo2ndQty: freezed == itemNo2ndQty ? _self.itemNo2ndQty : itemNo2ndQty // ignore: cast_nullable_to_non_nullable
as int?,linkedItemNo: freezed == linkedItemNo ? _self.linkedItemNo : linkedItemNo // ignore: cast_nullable_to_non_nullable
as String?,linkedItemNewPrice: freezed == linkedItemNewPrice ? _self.linkedItemNewPrice : linkedItemNewPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [DiscountRule].
extension DiscountRulePatterns on DiscountRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiscountRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiscountRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiscountRule value)  $default,){
final _that = this;
switch (_that) {
case _DiscountRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiscountRule value)?  $default,){
final _that = this;
switch (_that) {
case _DiscountRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String discountType,  String itemNo,  String description,  double? itemNoNewPrice,  int? itemNoMinQty,  String? itemNo2ndItemNo,  int? itemNo2ndQty,  String? linkedItemNo,  double? linkedItemNewPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiscountRule() when $default != null:
return $default(_that.discountType,_that.itemNo,_that.description,_that.itemNoNewPrice,_that.itemNoMinQty,_that.itemNo2ndItemNo,_that.itemNo2ndQty,_that.linkedItemNo,_that.linkedItemNewPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String discountType,  String itemNo,  String description,  double? itemNoNewPrice,  int? itemNoMinQty,  String? itemNo2ndItemNo,  int? itemNo2ndQty,  String? linkedItemNo,  double? linkedItemNewPrice)  $default,) {final _that = this;
switch (_that) {
case _DiscountRule():
return $default(_that.discountType,_that.itemNo,_that.description,_that.itemNoNewPrice,_that.itemNoMinQty,_that.itemNo2ndItemNo,_that.itemNo2ndQty,_that.linkedItemNo,_that.linkedItemNewPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String discountType,  String itemNo,  String description,  double? itemNoNewPrice,  int? itemNoMinQty,  String? itemNo2ndItemNo,  int? itemNo2ndQty,  String? linkedItemNo,  double? linkedItemNewPrice)?  $default,) {final _that = this;
switch (_that) {
case _DiscountRule() when $default != null:
return $default(_that.discountType,_that.itemNo,_that.description,_that.itemNoNewPrice,_that.itemNoMinQty,_that.itemNo2ndItemNo,_that.itemNo2ndQty,_that.linkedItemNo,_that.linkedItemNewPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiscountRule extends DiscountRule {
  const _DiscountRule({required this.discountType, required this.itemNo, required this.description, this.itemNoNewPrice, this.itemNoMinQty, this.itemNo2ndItemNo, this.itemNo2ndQty, this.linkedItemNo, this.linkedItemNewPrice}): super._();
  factory _DiscountRule.fromJson(Map<String, dynamic> json) => _$DiscountRuleFromJson(json);

@override final  String discountType;
@override final  String itemNo;
@override final  String description;
// Type 1 & 2: Direct price override
@override final  double? itemNoNewPrice;
// Type 2, 3 & 4: Minimum quantity condition
@override final  int? itemNoMinQty;
// Type 3: Buy A get B free
@override final  String? itemNo2ndItemNo;
@override final  int? itemNo2ndQty;
// Type 4: Linked item discount
@override final  String? linkedItemNo;
@override final  double? linkedItemNewPrice;

/// Create a copy of DiscountRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscountRuleCopyWith<_DiscountRule> get copyWith => __$DiscountRuleCopyWithImpl<_DiscountRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiscountRuleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscountRule&&(identical(other.discountType, discountType) || other.discountType == discountType)&&(identical(other.itemNo, itemNo) || other.itemNo == itemNo)&&(identical(other.description, description) || other.description == description)&&(identical(other.itemNoNewPrice, itemNoNewPrice) || other.itemNoNewPrice == itemNoNewPrice)&&(identical(other.itemNoMinQty, itemNoMinQty) || other.itemNoMinQty == itemNoMinQty)&&(identical(other.itemNo2ndItemNo, itemNo2ndItemNo) || other.itemNo2ndItemNo == itemNo2ndItemNo)&&(identical(other.itemNo2ndQty, itemNo2ndQty) || other.itemNo2ndQty == itemNo2ndQty)&&(identical(other.linkedItemNo, linkedItemNo) || other.linkedItemNo == linkedItemNo)&&(identical(other.linkedItemNewPrice, linkedItemNewPrice) || other.linkedItemNewPrice == linkedItemNewPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,discountType,itemNo,description,itemNoNewPrice,itemNoMinQty,itemNo2ndItemNo,itemNo2ndQty,linkedItemNo,linkedItemNewPrice);

@override
String toString() {
  return 'DiscountRule(discountType: $discountType, itemNo: $itemNo, description: $description, itemNoNewPrice: $itemNoNewPrice, itemNoMinQty: $itemNoMinQty, itemNo2ndItemNo: $itemNo2ndItemNo, itemNo2ndQty: $itemNo2ndQty, linkedItemNo: $linkedItemNo, linkedItemNewPrice: $linkedItemNewPrice)';
}


}

/// @nodoc
abstract mixin class _$DiscountRuleCopyWith<$Res> implements $DiscountRuleCopyWith<$Res> {
  factory _$DiscountRuleCopyWith(_DiscountRule value, $Res Function(_DiscountRule) _then) = __$DiscountRuleCopyWithImpl;
@override @useResult
$Res call({
 String discountType, String itemNo, String description, double? itemNoNewPrice, int? itemNoMinQty, String? itemNo2ndItemNo, int? itemNo2ndQty, String? linkedItemNo, double? linkedItemNewPrice
});




}
/// @nodoc
class __$DiscountRuleCopyWithImpl<$Res>
    implements _$DiscountRuleCopyWith<$Res> {
  __$DiscountRuleCopyWithImpl(this._self, this._then);

  final _DiscountRule _self;
  final $Res Function(_DiscountRule) _then;

/// Create a copy of DiscountRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? discountType = null,Object? itemNo = null,Object? description = null,Object? itemNoNewPrice = freezed,Object? itemNoMinQty = freezed,Object? itemNo2ndItemNo = freezed,Object? itemNo2ndQty = freezed,Object? linkedItemNo = freezed,Object? linkedItemNewPrice = freezed,}) {
  return _then(_DiscountRule(
discountType: null == discountType ? _self.discountType : discountType // ignore: cast_nullable_to_non_nullable
as String,itemNo: null == itemNo ? _self.itemNo : itemNo // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,itemNoNewPrice: freezed == itemNoNewPrice ? _self.itemNoNewPrice : itemNoNewPrice // ignore: cast_nullable_to_non_nullable
as double?,itemNoMinQty: freezed == itemNoMinQty ? _self.itemNoMinQty : itemNoMinQty // ignore: cast_nullable_to_non_nullable
as int?,itemNo2ndItemNo: freezed == itemNo2ndItemNo ? _self.itemNo2ndItemNo : itemNo2ndItemNo // ignore: cast_nullable_to_non_nullable
as String?,itemNo2ndQty: freezed == itemNo2ndQty ? _self.itemNo2ndQty : itemNo2ndQty // ignore: cast_nullable_to_non_nullable
as int?,linkedItemNo: freezed == linkedItemNo ? _self.linkedItemNo : linkedItemNo // ignore: cast_nullable_to_non_nullable
as String?,linkedItemNewPrice: freezed == linkedItemNewPrice ? _self.linkedItemNewPrice : linkedItemNewPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
