// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_voucher_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReceiptVoucherModel {

 String get id; String get receiptNumber; Client get client; ReceiptType get receiptType; double get amount; DateTime get date; String? get notes; String? get chequeNumber; String? get bankName; DateTime? get chequeMaturityDate; ReceiptStatus get status; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of ReceiptVoucherModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiptVoucherModelCopyWith<ReceiptVoucherModel> get copyWith => _$ReceiptVoucherModelCopyWithImpl<ReceiptVoucherModel>(this as ReceiptVoucherModel, _$identity);

  /// Serializes this ReceiptVoucherModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiptVoucherModel&&(identical(other.id, id) || other.id == id)&&(identical(other.receiptNumber, receiptNumber) || other.receiptNumber == receiptNumber)&&(identical(other.client, client) || other.client == client)&&(identical(other.receiptType, receiptType) || other.receiptType == receiptType)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.chequeNumber, chequeNumber) || other.chequeNumber == chequeNumber)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.chequeMaturityDate, chequeMaturityDate) || other.chequeMaturityDate == chequeMaturityDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,receiptNumber,client,receiptType,amount,date,notes,chequeNumber,bankName,chequeMaturityDate,status,createdAt,updatedAt);

@override
String toString() {
  return 'ReceiptVoucherModel(id: $id, receiptNumber: $receiptNumber, client: $client, receiptType: $receiptType, amount: $amount, date: $date, notes: $notes, chequeNumber: $chequeNumber, bankName: $bankName, chequeMaturityDate: $chequeMaturityDate, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ReceiptVoucherModelCopyWith<$Res>  {
  factory $ReceiptVoucherModelCopyWith(ReceiptVoucherModel value, $Res Function(ReceiptVoucherModel) _then) = _$ReceiptVoucherModelCopyWithImpl;
@useResult
$Res call({
 String id, String receiptNumber, Client client, ReceiptType receiptType, double amount, DateTime date, String? notes, String? chequeNumber, String? bankName, DateTime? chequeMaturityDate, ReceiptStatus status, DateTime? createdAt, DateTime? updatedAt
});


$ClientCopyWith<$Res> get client;

}
/// @nodoc
class _$ReceiptVoucherModelCopyWithImpl<$Res>
    implements $ReceiptVoucherModelCopyWith<$Res> {
  _$ReceiptVoucherModelCopyWithImpl(this._self, this._then);

  final ReceiptVoucherModel _self;
  final $Res Function(ReceiptVoucherModel) _then;

/// Create a copy of ReceiptVoucherModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? receiptNumber = null,Object? client = null,Object? receiptType = null,Object? amount = null,Object? date = null,Object? notes = freezed,Object? chequeNumber = freezed,Object? bankName = freezed,Object? chequeMaturityDate = freezed,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,receiptNumber: null == receiptNumber ? _self.receiptNumber : receiptNumber // ignore: cast_nullable_to_non_nullable
as String,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as Client,receiptType: null == receiptType ? _self.receiptType : receiptType // ignore: cast_nullable_to_non_nullable
as ReceiptType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,chequeNumber: freezed == chequeNumber ? _self.chequeNumber : chequeNumber // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,chequeMaturityDate: freezed == chequeMaturityDate ? _self.chequeMaturityDate : chequeMaturityDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReceiptStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ReceiptVoucherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientCopyWith<$Res> get client {
  
  return $ClientCopyWith<$Res>(_self.client, (value) {
    return _then(_self.copyWith(client: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReceiptVoucherModel].
extension ReceiptVoucherModelPatterns on ReceiptVoucherModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReceiptVoucherModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReceiptVoucherModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReceiptVoucherModel value)  $default,){
final _that = this;
switch (_that) {
case _ReceiptVoucherModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReceiptVoucherModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReceiptVoucherModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String receiptNumber,  Client client,  ReceiptType receiptType,  double amount,  DateTime date,  String? notes,  String? chequeNumber,  String? bankName,  DateTime? chequeMaturityDate,  ReceiptStatus status,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReceiptVoucherModel() when $default != null:
return $default(_that.id,_that.receiptNumber,_that.client,_that.receiptType,_that.amount,_that.date,_that.notes,_that.chequeNumber,_that.bankName,_that.chequeMaturityDate,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String receiptNumber,  Client client,  ReceiptType receiptType,  double amount,  DateTime date,  String? notes,  String? chequeNumber,  String? bankName,  DateTime? chequeMaturityDate,  ReceiptStatus status,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ReceiptVoucherModel():
return $default(_that.id,_that.receiptNumber,_that.client,_that.receiptType,_that.amount,_that.date,_that.notes,_that.chequeNumber,_that.bankName,_that.chequeMaturityDate,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String receiptNumber,  Client client,  ReceiptType receiptType,  double amount,  DateTime date,  String? notes,  String? chequeNumber,  String? bankName,  DateTime? chequeMaturityDate,  ReceiptStatus status,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ReceiptVoucherModel() when $default != null:
return $default(_that.id,_that.receiptNumber,_that.client,_that.receiptType,_that.amount,_that.date,_that.notes,_that.chequeNumber,_that.bankName,_that.chequeMaturityDate,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReceiptVoucherModel implements ReceiptVoucherModel {
  const _ReceiptVoucherModel({required this.id, required this.receiptNumber, required this.client, required this.receiptType, required this.amount, required this.date, this.notes, this.chequeNumber, this.bankName, this.chequeMaturityDate, this.status = ReceiptStatus.draft, this.createdAt, this.updatedAt});
  factory _ReceiptVoucherModel.fromJson(Map<String, dynamic> json) => _$ReceiptVoucherModelFromJson(json);

@override final  String id;
@override final  String receiptNumber;
@override final  Client client;
@override final  ReceiptType receiptType;
@override final  double amount;
@override final  DateTime date;
@override final  String? notes;
@override final  String? chequeNumber;
@override final  String? bankName;
@override final  DateTime? chequeMaturityDate;
@override@JsonKey() final  ReceiptStatus status;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of ReceiptVoucherModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiptVoucherModelCopyWith<_ReceiptVoucherModel> get copyWith => __$ReceiptVoucherModelCopyWithImpl<_ReceiptVoucherModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceiptVoucherModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceiptVoucherModel&&(identical(other.id, id) || other.id == id)&&(identical(other.receiptNumber, receiptNumber) || other.receiptNumber == receiptNumber)&&(identical(other.client, client) || other.client == client)&&(identical(other.receiptType, receiptType) || other.receiptType == receiptType)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.chequeNumber, chequeNumber) || other.chequeNumber == chequeNumber)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.chequeMaturityDate, chequeMaturityDate) || other.chequeMaturityDate == chequeMaturityDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,receiptNumber,client,receiptType,amount,date,notes,chequeNumber,bankName,chequeMaturityDate,status,createdAt,updatedAt);

@override
String toString() {
  return 'ReceiptVoucherModel(id: $id, receiptNumber: $receiptNumber, client: $client, receiptType: $receiptType, amount: $amount, date: $date, notes: $notes, chequeNumber: $chequeNumber, bankName: $bankName, chequeMaturityDate: $chequeMaturityDate, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ReceiptVoucherModelCopyWith<$Res> implements $ReceiptVoucherModelCopyWith<$Res> {
  factory _$ReceiptVoucherModelCopyWith(_ReceiptVoucherModel value, $Res Function(_ReceiptVoucherModel) _then) = __$ReceiptVoucherModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String receiptNumber, Client client, ReceiptType receiptType, double amount, DateTime date, String? notes, String? chequeNumber, String? bankName, DateTime? chequeMaturityDate, ReceiptStatus status, DateTime? createdAt, DateTime? updatedAt
});


@override $ClientCopyWith<$Res> get client;

}
/// @nodoc
class __$ReceiptVoucherModelCopyWithImpl<$Res>
    implements _$ReceiptVoucherModelCopyWith<$Res> {
  __$ReceiptVoucherModelCopyWithImpl(this._self, this._then);

  final _ReceiptVoucherModel _self;
  final $Res Function(_ReceiptVoucherModel) _then;

/// Create a copy of ReceiptVoucherModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? receiptNumber = null,Object? client = null,Object? receiptType = null,Object? amount = null,Object? date = null,Object? notes = freezed,Object? chequeNumber = freezed,Object? bankName = freezed,Object? chequeMaturityDate = freezed,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ReceiptVoucherModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,receiptNumber: null == receiptNumber ? _self.receiptNumber : receiptNumber // ignore: cast_nullable_to_non_nullable
as String,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as Client,receiptType: null == receiptType ? _self.receiptType : receiptType // ignore: cast_nullable_to_non_nullable
as ReceiptType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,chequeNumber: freezed == chequeNumber ? _self.chequeNumber : chequeNumber // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,chequeMaturityDate: freezed == chequeMaturityDate ? _self.chequeMaturityDate : chequeMaturityDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReceiptStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ReceiptVoucherModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientCopyWith<$Res> get client {
  
  return $ClientCopyWith<$Res>(_self.client, (value) {
    return _then(_self.copyWith(client: value));
  });
}
}

// dart format on
