// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoiceModel {

 String get id; String get clientId; String get clientName; List<InvoiceItem> get items; double get subtotal; double get totalAmount; double get paidAmount; double get remainingAmount; String get notes;@PaymentMethodConverter() AppPaymentMethod get paymentMethod; DateTime get createdAt; InvoiceStatus get status; DateTime? get updatedAt; String? get invoiceNumber; double? get taxAmount; double? get discountAmount;
/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceModelCopyWith<InvoiceModel> get copyWith => _$InvoiceModelCopyWithImpl<InvoiceModel>(this as InvoiceModel, _$identity);

  /// Serializes this InvoiceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.remainingAmount, remainingAmount) || other.remainingAmount == remainingAmount)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,clientName,const DeepCollectionEquality().hash(items),subtotal,totalAmount,paidAmount,remainingAmount,notes,paymentMethod,createdAt,status,updatedAt,invoiceNumber,taxAmount,discountAmount);

@override
String toString() {
  return 'InvoiceModel(id: $id, clientId: $clientId, clientName: $clientName, items: $items, subtotal: $subtotal, totalAmount: $totalAmount, paidAmount: $paidAmount, remainingAmount: $remainingAmount, notes: $notes, paymentMethod: $paymentMethod, createdAt: $createdAt, status: $status, updatedAt: $updatedAt, invoiceNumber: $invoiceNumber, taxAmount: $taxAmount, discountAmount: $discountAmount)';
}


}

/// @nodoc
abstract mixin class $InvoiceModelCopyWith<$Res>  {
  factory $InvoiceModelCopyWith(InvoiceModel value, $Res Function(InvoiceModel) _then) = _$InvoiceModelCopyWithImpl;
@useResult
$Res call({
 String id, String clientId, String clientName, List<InvoiceItem> items, double subtotal, double totalAmount, double paidAmount, double remainingAmount, String notes,@PaymentMethodConverter() AppPaymentMethod paymentMethod, DateTime createdAt, InvoiceStatus status, DateTime? updatedAt, String? invoiceNumber, double? taxAmount, double? discountAmount
});




}
/// @nodoc
class _$InvoiceModelCopyWithImpl<$Res>
    implements $InvoiceModelCopyWith<$Res> {
  _$InvoiceModelCopyWithImpl(this._self, this._then);

  final InvoiceModel _self;
  final $Res Function(InvoiceModel) _then;

/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientId = null,Object? clientName = null,Object? items = null,Object? subtotal = null,Object? totalAmount = null,Object? paidAmount = null,Object? remainingAmount = null,Object? notes = null,Object? paymentMethod = null,Object? createdAt = null,Object? status = null,Object? updatedAt = freezed,Object? invoiceNumber = freezed,Object? taxAmount = freezed,Object? discountAmount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<InvoiceItem>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,remainingAmount: null == remainingAmount ? _self.remainingAmount : remainingAmount // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as AppPaymentMethod,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InvoiceStatus,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,invoiceNumber: freezed == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceModel].
extension InvoiceModelPatterns on InvoiceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceModel value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceModel value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientId,  String clientName,  List<InvoiceItem> items,  double subtotal,  double totalAmount,  double paidAmount,  double remainingAmount,  String notes, @PaymentMethodConverter()  AppPaymentMethod paymentMethod,  DateTime createdAt,  InvoiceStatus status,  DateTime? updatedAt,  String? invoiceNumber,  double? taxAmount,  double? discountAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceModel() when $default != null:
return $default(_that.id,_that.clientId,_that.clientName,_that.items,_that.subtotal,_that.totalAmount,_that.paidAmount,_that.remainingAmount,_that.notes,_that.paymentMethod,_that.createdAt,_that.status,_that.updatedAt,_that.invoiceNumber,_that.taxAmount,_that.discountAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientId,  String clientName,  List<InvoiceItem> items,  double subtotal,  double totalAmount,  double paidAmount,  double remainingAmount,  String notes, @PaymentMethodConverter()  AppPaymentMethod paymentMethod,  DateTime createdAt,  InvoiceStatus status,  DateTime? updatedAt,  String? invoiceNumber,  double? taxAmount,  double? discountAmount)  $default,) {final _that = this;
switch (_that) {
case _InvoiceModel():
return $default(_that.id,_that.clientId,_that.clientName,_that.items,_that.subtotal,_that.totalAmount,_that.paidAmount,_that.remainingAmount,_that.notes,_that.paymentMethod,_that.createdAt,_that.status,_that.updatedAt,_that.invoiceNumber,_that.taxAmount,_that.discountAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientId,  String clientName,  List<InvoiceItem> items,  double subtotal,  double totalAmount,  double paidAmount,  double remainingAmount,  String notes, @PaymentMethodConverter()  AppPaymentMethod paymentMethod,  DateTime createdAt,  InvoiceStatus status,  DateTime? updatedAt,  String? invoiceNumber,  double? taxAmount,  double? discountAmount)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceModel() when $default != null:
return $default(_that.id,_that.clientId,_that.clientName,_that.items,_that.subtotal,_that.totalAmount,_that.paidAmount,_that.remainingAmount,_that.notes,_that.paymentMethod,_that.createdAt,_that.status,_that.updatedAt,_that.invoiceNumber,_that.taxAmount,_that.discountAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceModel implements InvoiceModel {
  const _InvoiceModel({required this.id, required this.clientId, required this.clientName, required final  List<InvoiceItem> items, required this.subtotal, required this.totalAmount, required this.paidAmount, required this.remainingAmount, required this.notes, @PaymentMethodConverter() required this.paymentMethod, required this.createdAt, this.status = InvoiceStatus.draft, this.updatedAt, this.invoiceNumber, this.taxAmount, this.discountAmount}): _items = items;
  factory _InvoiceModel.fromJson(Map<String, dynamic> json) => _$InvoiceModelFromJson(json);

@override final  String id;
@override final  String clientId;
@override final  String clientName;
 final  List<InvoiceItem> _items;
@override List<InvoiceItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  double subtotal;
@override final  double totalAmount;
@override final  double paidAmount;
@override final  double remainingAmount;
@override final  String notes;
@override@PaymentMethodConverter() final  AppPaymentMethod paymentMethod;
@override final  DateTime createdAt;
@override@JsonKey() final  InvoiceStatus status;
@override final  DateTime? updatedAt;
@override final  String? invoiceNumber;
@override final  double? taxAmount;
@override final  double? discountAmount;

/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceModelCopyWith<_InvoiceModel> get copyWith => __$InvoiceModelCopyWithImpl<_InvoiceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.remainingAmount, remainingAmount) || other.remainingAmount == remainingAmount)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,clientName,const DeepCollectionEquality().hash(_items),subtotal,totalAmount,paidAmount,remainingAmount,notes,paymentMethod,createdAt,status,updatedAt,invoiceNumber,taxAmount,discountAmount);

@override
String toString() {
  return 'InvoiceModel(id: $id, clientId: $clientId, clientName: $clientName, items: $items, subtotal: $subtotal, totalAmount: $totalAmount, paidAmount: $paidAmount, remainingAmount: $remainingAmount, notes: $notes, paymentMethod: $paymentMethod, createdAt: $createdAt, status: $status, updatedAt: $updatedAt, invoiceNumber: $invoiceNumber, taxAmount: $taxAmount, discountAmount: $discountAmount)';
}


}

/// @nodoc
abstract mixin class _$InvoiceModelCopyWith<$Res> implements $InvoiceModelCopyWith<$Res> {
  factory _$InvoiceModelCopyWith(_InvoiceModel value, $Res Function(_InvoiceModel) _then) = __$InvoiceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientId, String clientName, List<InvoiceItem> items, double subtotal, double totalAmount, double paidAmount, double remainingAmount, String notes,@PaymentMethodConverter() AppPaymentMethod paymentMethod, DateTime createdAt, InvoiceStatus status, DateTime? updatedAt, String? invoiceNumber, double? taxAmount, double? discountAmount
});




}
/// @nodoc
class __$InvoiceModelCopyWithImpl<$Res>
    implements _$InvoiceModelCopyWith<$Res> {
  __$InvoiceModelCopyWithImpl(this._self, this._then);

  final _InvoiceModel _self;
  final $Res Function(_InvoiceModel) _then;

/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? clientName = null,Object? items = null,Object? subtotal = null,Object? totalAmount = null,Object? paidAmount = null,Object? remainingAmount = null,Object? notes = null,Object? paymentMethod = null,Object? createdAt = null,Object? status = null,Object? updatedAt = freezed,Object? invoiceNumber = freezed,Object? taxAmount = freezed,Object? discountAmount = freezed,}) {
  return _then(_InvoiceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<InvoiceItem>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,remainingAmount: null == remainingAmount ? _self.remainingAmount : remainingAmount // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as AppPaymentMethod,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InvoiceStatus,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,invoiceNumber: freezed == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
