// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_invoice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReturnInvoiceModel {

 String get id; String get clientId; String get clientName; String? get originalInvoiceId;// الفاتورة الأصلية
 String? get originalInvoiceNumber; List<ReturnInvoiceItem> get items; double get subtotal; double get totalAmount; double get refundAmount;// المبلغ المسترد
 String get notes; ReturnReason get returnReason; DateTime get createdAt; ReturnInvoiceStatus get status; DateTime? get updatedAt; String? get returnInvoiceNumber; double? get taxAmount; double? get discountAmount; String? get processedBy;
/// Create a copy of ReturnInvoiceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReturnInvoiceModelCopyWith<ReturnInvoiceModel> get copyWith => _$ReturnInvoiceModelCopyWithImpl<ReturnInvoiceModel>(this as ReturnInvoiceModel, _$identity);

  /// Serializes this ReturnInvoiceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReturnInvoiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.originalInvoiceId, originalInvoiceId) || other.originalInvoiceId == originalInvoiceId)&&(identical(other.originalInvoiceNumber, originalInvoiceNumber) || other.originalInvoiceNumber == originalInvoiceNumber)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.refundAmount, refundAmount) || other.refundAmount == refundAmount)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.returnReason, returnReason) || other.returnReason == returnReason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.returnInvoiceNumber, returnInvoiceNumber) || other.returnInvoiceNumber == returnInvoiceNumber)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.processedBy, processedBy) || other.processedBy == processedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,clientName,originalInvoiceId,originalInvoiceNumber,const DeepCollectionEquality().hash(items),subtotal,totalAmount,refundAmount,notes,returnReason,createdAt,status,updatedAt,returnInvoiceNumber,taxAmount,discountAmount,processedBy);

@override
String toString() {
  return 'ReturnInvoiceModel(id: $id, clientId: $clientId, clientName: $clientName, originalInvoiceId: $originalInvoiceId, originalInvoiceNumber: $originalInvoiceNumber, items: $items, subtotal: $subtotal, totalAmount: $totalAmount, refundAmount: $refundAmount, notes: $notes, returnReason: $returnReason, createdAt: $createdAt, status: $status, updatedAt: $updatedAt, returnInvoiceNumber: $returnInvoiceNumber, taxAmount: $taxAmount, discountAmount: $discountAmount, processedBy: $processedBy)';
}


}

/// @nodoc
abstract mixin class $ReturnInvoiceModelCopyWith<$Res>  {
  factory $ReturnInvoiceModelCopyWith(ReturnInvoiceModel value, $Res Function(ReturnInvoiceModel) _then) = _$ReturnInvoiceModelCopyWithImpl;
@useResult
$Res call({
 String id, String clientId, String clientName, String? originalInvoiceId, String? originalInvoiceNumber, List<ReturnInvoiceItem> items, double subtotal, double totalAmount, double refundAmount, String notes, ReturnReason returnReason, DateTime createdAt, ReturnInvoiceStatus status, DateTime? updatedAt, String? returnInvoiceNumber, double? taxAmount, double? discountAmount, String? processedBy
});




}
/// @nodoc
class _$ReturnInvoiceModelCopyWithImpl<$Res>
    implements $ReturnInvoiceModelCopyWith<$Res> {
  _$ReturnInvoiceModelCopyWithImpl(this._self, this._then);

  final ReturnInvoiceModel _self;
  final $Res Function(ReturnInvoiceModel) _then;

/// Create a copy of ReturnInvoiceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientId = null,Object? clientName = null,Object? originalInvoiceId = freezed,Object? originalInvoiceNumber = freezed,Object? items = null,Object? subtotal = null,Object? totalAmount = null,Object? refundAmount = null,Object? notes = null,Object? returnReason = null,Object? createdAt = null,Object? status = null,Object? updatedAt = freezed,Object? returnInvoiceNumber = freezed,Object? taxAmount = freezed,Object? discountAmount = freezed,Object? processedBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,originalInvoiceId: freezed == originalInvoiceId ? _self.originalInvoiceId : originalInvoiceId // ignore: cast_nullable_to_non_nullable
as String?,originalInvoiceNumber: freezed == originalInvoiceNumber ? _self.originalInvoiceNumber : originalInvoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ReturnInvoiceItem>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,refundAmount: null == refundAmount ? _self.refundAmount : refundAmount // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,returnReason: null == returnReason ? _self.returnReason : returnReason // ignore: cast_nullable_to_non_nullable
as ReturnReason,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReturnInvoiceStatus,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,returnInvoiceNumber: freezed == returnInvoiceNumber ? _self.returnInvoiceNumber : returnInvoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double?,processedBy: freezed == processedBy ? _self.processedBy : processedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReturnInvoiceModel].
extension ReturnInvoiceModelPatterns on ReturnInvoiceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReturnInvoiceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReturnInvoiceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReturnInvoiceModel value)  $default,){
final _that = this;
switch (_that) {
case _ReturnInvoiceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReturnInvoiceModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReturnInvoiceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientId,  String clientName,  String? originalInvoiceId,  String? originalInvoiceNumber,  List<ReturnInvoiceItem> items,  double subtotal,  double totalAmount,  double refundAmount,  String notes,  ReturnReason returnReason,  DateTime createdAt,  ReturnInvoiceStatus status,  DateTime? updatedAt,  String? returnInvoiceNumber,  double? taxAmount,  double? discountAmount,  String? processedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReturnInvoiceModel() when $default != null:
return $default(_that.id,_that.clientId,_that.clientName,_that.originalInvoiceId,_that.originalInvoiceNumber,_that.items,_that.subtotal,_that.totalAmount,_that.refundAmount,_that.notes,_that.returnReason,_that.createdAt,_that.status,_that.updatedAt,_that.returnInvoiceNumber,_that.taxAmount,_that.discountAmount,_that.processedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientId,  String clientName,  String? originalInvoiceId,  String? originalInvoiceNumber,  List<ReturnInvoiceItem> items,  double subtotal,  double totalAmount,  double refundAmount,  String notes,  ReturnReason returnReason,  DateTime createdAt,  ReturnInvoiceStatus status,  DateTime? updatedAt,  String? returnInvoiceNumber,  double? taxAmount,  double? discountAmount,  String? processedBy)  $default,) {final _that = this;
switch (_that) {
case _ReturnInvoiceModel():
return $default(_that.id,_that.clientId,_that.clientName,_that.originalInvoiceId,_that.originalInvoiceNumber,_that.items,_that.subtotal,_that.totalAmount,_that.refundAmount,_that.notes,_that.returnReason,_that.createdAt,_that.status,_that.updatedAt,_that.returnInvoiceNumber,_that.taxAmount,_that.discountAmount,_that.processedBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientId,  String clientName,  String? originalInvoiceId,  String? originalInvoiceNumber,  List<ReturnInvoiceItem> items,  double subtotal,  double totalAmount,  double refundAmount,  String notes,  ReturnReason returnReason,  DateTime createdAt,  ReturnInvoiceStatus status,  DateTime? updatedAt,  String? returnInvoiceNumber,  double? taxAmount,  double? discountAmount,  String? processedBy)?  $default,) {final _that = this;
switch (_that) {
case _ReturnInvoiceModel() when $default != null:
return $default(_that.id,_that.clientId,_that.clientName,_that.originalInvoiceId,_that.originalInvoiceNumber,_that.items,_that.subtotal,_that.totalAmount,_that.refundAmount,_that.notes,_that.returnReason,_that.createdAt,_that.status,_that.updatedAt,_that.returnInvoiceNumber,_that.taxAmount,_that.discountAmount,_that.processedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReturnInvoiceModel implements ReturnInvoiceModel {
  const _ReturnInvoiceModel({required this.id, required this.clientId, required this.clientName, this.originalInvoiceId, this.originalInvoiceNumber, required final  List<ReturnInvoiceItem> items, required this.subtotal, required this.totalAmount, required this.refundAmount, required this.notes, required this.returnReason, required this.createdAt, this.status = ReturnInvoiceStatus.draft, this.updatedAt, this.returnInvoiceNumber, this.taxAmount, this.discountAmount, this.processedBy}): _items = items;
  factory _ReturnInvoiceModel.fromJson(Map<String, dynamic> json) => _$ReturnInvoiceModelFromJson(json);

@override final  String id;
@override final  String clientId;
@override final  String clientName;
@override final  String? originalInvoiceId;
// الفاتورة الأصلية
@override final  String? originalInvoiceNumber;
 final  List<ReturnInvoiceItem> _items;
@override List<ReturnInvoiceItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  double subtotal;
@override final  double totalAmount;
@override final  double refundAmount;
// المبلغ المسترد
@override final  String notes;
@override final  ReturnReason returnReason;
@override final  DateTime createdAt;
@override@JsonKey() final  ReturnInvoiceStatus status;
@override final  DateTime? updatedAt;
@override final  String? returnInvoiceNumber;
@override final  double? taxAmount;
@override final  double? discountAmount;
@override final  String? processedBy;

/// Create a copy of ReturnInvoiceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReturnInvoiceModelCopyWith<_ReturnInvoiceModel> get copyWith => __$ReturnInvoiceModelCopyWithImpl<_ReturnInvoiceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReturnInvoiceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReturnInvoiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.originalInvoiceId, originalInvoiceId) || other.originalInvoiceId == originalInvoiceId)&&(identical(other.originalInvoiceNumber, originalInvoiceNumber) || other.originalInvoiceNumber == originalInvoiceNumber)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.refundAmount, refundAmount) || other.refundAmount == refundAmount)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.returnReason, returnReason) || other.returnReason == returnReason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.returnInvoiceNumber, returnInvoiceNumber) || other.returnInvoiceNumber == returnInvoiceNumber)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.processedBy, processedBy) || other.processedBy == processedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,clientName,originalInvoiceId,originalInvoiceNumber,const DeepCollectionEquality().hash(_items),subtotal,totalAmount,refundAmount,notes,returnReason,createdAt,status,updatedAt,returnInvoiceNumber,taxAmount,discountAmount,processedBy);

@override
String toString() {
  return 'ReturnInvoiceModel(id: $id, clientId: $clientId, clientName: $clientName, originalInvoiceId: $originalInvoiceId, originalInvoiceNumber: $originalInvoiceNumber, items: $items, subtotal: $subtotal, totalAmount: $totalAmount, refundAmount: $refundAmount, notes: $notes, returnReason: $returnReason, createdAt: $createdAt, status: $status, updatedAt: $updatedAt, returnInvoiceNumber: $returnInvoiceNumber, taxAmount: $taxAmount, discountAmount: $discountAmount, processedBy: $processedBy)';
}


}

/// @nodoc
abstract mixin class _$ReturnInvoiceModelCopyWith<$Res> implements $ReturnInvoiceModelCopyWith<$Res> {
  factory _$ReturnInvoiceModelCopyWith(_ReturnInvoiceModel value, $Res Function(_ReturnInvoiceModel) _then) = __$ReturnInvoiceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientId, String clientName, String? originalInvoiceId, String? originalInvoiceNumber, List<ReturnInvoiceItem> items, double subtotal, double totalAmount, double refundAmount, String notes, ReturnReason returnReason, DateTime createdAt, ReturnInvoiceStatus status, DateTime? updatedAt, String? returnInvoiceNumber, double? taxAmount, double? discountAmount, String? processedBy
});




}
/// @nodoc
class __$ReturnInvoiceModelCopyWithImpl<$Res>
    implements _$ReturnInvoiceModelCopyWith<$Res> {
  __$ReturnInvoiceModelCopyWithImpl(this._self, this._then);

  final _ReturnInvoiceModel _self;
  final $Res Function(_ReturnInvoiceModel) _then;

/// Create a copy of ReturnInvoiceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? clientName = null,Object? originalInvoiceId = freezed,Object? originalInvoiceNumber = freezed,Object? items = null,Object? subtotal = null,Object? totalAmount = null,Object? refundAmount = null,Object? notes = null,Object? returnReason = null,Object? createdAt = null,Object? status = null,Object? updatedAt = freezed,Object? returnInvoiceNumber = freezed,Object? taxAmount = freezed,Object? discountAmount = freezed,Object? processedBy = freezed,}) {
  return _then(_ReturnInvoiceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,originalInvoiceId: freezed == originalInvoiceId ? _self.originalInvoiceId : originalInvoiceId // ignore: cast_nullable_to_non_nullable
as String?,originalInvoiceNumber: freezed == originalInvoiceNumber ? _self.originalInvoiceNumber : originalInvoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ReturnInvoiceItem>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,refundAmount: null == refundAmount ? _self.refundAmount : refundAmount // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,returnReason: null == returnReason ? _self.returnReason : returnReason // ignore: cast_nullable_to_non_nullable
as ReturnReason,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReturnInvoiceStatus,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,returnInvoiceNumber: freezed == returnInvoiceNumber ? _self.returnInvoiceNumber : returnInvoiceNumber // ignore: cast_nullable_to_non_nullable
as String?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double?,processedBy: freezed == processedBy ? _self.processedBy : processedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
