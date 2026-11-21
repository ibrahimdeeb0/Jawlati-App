// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_return_invoice_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddReturnInvoiceState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddReturnInvoiceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddReturnInvoiceState()';
}


}

/// @nodoc
class $AddReturnInvoiceStateCopyWith<$Res>  {
$AddReturnInvoiceStateCopyWith(AddReturnInvoiceState _, $Res Function(AddReturnInvoiceState) __);
}


/// Adds pattern-matching-related methods to [AddReturnInvoiceState].
extension AddReturnInvoiceStatePatterns on AddReturnInvoiceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String currentTime,  String currentDate,  List<ReturnInvoiceItem> returnItems,  double subtotal,  double totalAmount,  double refundAmount,  String notes,  InvoiceModel? selectedOriginalInvoice,  List<InvoiceModel> availableInvoices,  List<InvoiceModel> filteredInvoices,  ReturnReason returnReason,  ReturnInvoiceStatus status)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.currentTime,_that.currentDate,_that.returnItems,_that.subtotal,_that.totalAmount,_that.refundAmount,_that.notes,_that.selectedOriginalInvoice,_that.availableInvoices,_that.filteredInvoices,_that.returnReason,_that.status);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String currentTime,  String currentDate,  List<ReturnInvoiceItem> returnItems,  double subtotal,  double totalAmount,  double refundAmount,  String notes,  InvoiceModel? selectedOriginalInvoice,  List<InvoiceModel> availableInvoices,  List<InvoiceModel> filteredInvoices,  ReturnReason returnReason,  ReturnInvoiceStatus status)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.currentTime,_that.currentDate,_that.returnItems,_that.subtotal,_that.totalAmount,_that.refundAmount,_that.notes,_that.selectedOriginalInvoice,_that.availableInvoices,_that.filteredInvoices,_that.returnReason,_that.status);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String currentTime,  String currentDate,  List<ReturnInvoiceItem> returnItems,  double subtotal,  double totalAmount,  double refundAmount,  String notes,  InvoiceModel? selectedOriginalInvoice,  List<InvoiceModel> availableInvoices,  List<InvoiceModel> filteredInvoices,  ReturnReason returnReason,  ReturnInvoiceStatus status)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.currentTime,_that.currentDate,_that.returnItems,_that.subtotal,_that.totalAmount,_that.refundAmount,_that.notes,_that.selectedOriginalInvoice,_that.availableInvoices,_that.filteredInvoices,_that.returnReason,_that.status);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AddReturnInvoiceState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddReturnInvoiceState.initial()';
}


}




/// @nodoc


class _Loading implements AddReturnInvoiceState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddReturnInvoiceState.loading()';
}


}




/// @nodoc


class _Loaded implements AddReturnInvoiceState {
  const _Loaded({required this.currentTime, required this.currentDate, required final  List<ReturnInvoiceItem> returnItems, required this.subtotal, required this.totalAmount, required this.refundAmount, required this.notes, this.selectedOriginalInvoice, required final  List<InvoiceModel> availableInvoices, required final  List<InvoiceModel> filteredInvoices, required this.returnReason, required this.status}): _returnItems = returnItems,_availableInvoices = availableInvoices,_filteredInvoices = filteredInvoices;
  

 final  String currentTime;
 final  String currentDate;
 final  List<ReturnInvoiceItem> _returnItems;
 List<ReturnInvoiceItem> get returnItems {
  if (_returnItems is EqualUnmodifiableListView) return _returnItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_returnItems);
}

 final  double subtotal;
 final  double totalAmount;
 final  double refundAmount;
 final  String notes;
 final  InvoiceModel? selectedOriginalInvoice;
 final  List<InvoiceModel> _availableInvoices;
 List<InvoiceModel> get availableInvoices {
  if (_availableInvoices is EqualUnmodifiableListView) return _availableInvoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableInvoices);
}

 final  List<InvoiceModel> _filteredInvoices;
 List<InvoiceModel> get filteredInvoices {
  if (_filteredInvoices is EqualUnmodifiableListView) return _filteredInvoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredInvoices);
}

 final  ReturnReason returnReason;
 final  ReturnInvoiceStatus status;

/// Create a copy of AddReturnInvoiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.currentTime, currentTime) || other.currentTime == currentTime)&&(identical(other.currentDate, currentDate) || other.currentDate == currentDate)&&const DeepCollectionEquality().equals(other._returnItems, _returnItems)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.refundAmount, refundAmount) || other.refundAmount == refundAmount)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.selectedOriginalInvoice, selectedOriginalInvoice) || other.selectedOriginalInvoice == selectedOriginalInvoice)&&const DeepCollectionEquality().equals(other._availableInvoices, _availableInvoices)&&const DeepCollectionEquality().equals(other._filteredInvoices, _filteredInvoices)&&(identical(other.returnReason, returnReason) || other.returnReason == returnReason)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,currentTime,currentDate,const DeepCollectionEquality().hash(_returnItems),subtotal,totalAmount,refundAmount,notes,selectedOriginalInvoice,const DeepCollectionEquality().hash(_availableInvoices),const DeepCollectionEquality().hash(_filteredInvoices),returnReason,status);

@override
String toString() {
  return 'AddReturnInvoiceState.loaded(currentTime: $currentTime, currentDate: $currentDate, returnItems: $returnItems, subtotal: $subtotal, totalAmount: $totalAmount, refundAmount: $refundAmount, notes: $notes, selectedOriginalInvoice: $selectedOriginalInvoice, availableInvoices: $availableInvoices, filteredInvoices: $filteredInvoices, returnReason: $returnReason, status: $status)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $AddReturnInvoiceStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 String currentTime, String currentDate, List<ReturnInvoiceItem> returnItems, double subtotal, double totalAmount, double refundAmount, String notes, InvoiceModel? selectedOriginalInvoice, List<InvoiceModel> availableInvoices, List<InvoiceModel> filteredInvoices, ReturnReason returnReason, ReturnInvoiceStatus status
});


$InvoiceModelCopyWith<$Res>? get selectedOriginalInvoice;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of AddReturnInvoiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentTime = null,Object? currentDate = null,Object? returnItems = null,Object? subtotal = null,Object? totalAmount = null,Object? refundAmount = null,Object? notes = null,Object? selectedOriginalInvoice = freezed,Object? availableInvoices = null,Object? filteredInvoices = null,Object? returnReason = null,Object? status = null,}) {
  return _then(_Loaded(
currentTime: null == currentTime ? _self.currentTime : currentTime // ignore: cast_nullable_to_non_nullable
as String,currentDate: null == currentDate ? _self.currentDate : currentDate // ignore: cast_nullable_to_non_nullable
as String,returnItems: null == returnItems ? _self._returnItems : returnItems // ignore: cast_nullable_to_non_nullable
as List<ReturnInvoiceItem>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,refundAmount: null == refundAmount ? _self.refundAmount : refundAmount // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,selectedOriginalInvoice: freezed == selectedOriginalInvoice ? _self.selectedOriginalInvoice : selectedOriginalInvoice // ignore: cast_nullable_to_non_nullable
as InvoiceModel?,availableInvoices: null == availableInvoices ? _self._availableInvoices : availableInvoices // ignore: cast_nullable_to_non_nullable
as List<InvoiceModel>,filteredInvoices: null == filteredInvoices ? _self._filteredInvoices : filteredInvoices // ignore: cast_nullable_to_non_nullable
as List<InvoiceModel>,returnReason: null == returnReason ? _self.returnReason : returnReason // ignore: cast_nullable_to_non_nullable
as ReturnReason,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReturnInvoiceStatus,
  ));
}

/// Create a copy of AddReturnInvoiceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InvoiceModelCopyWith<$Res>? get selectedOriginalInvoice {
    if (_self.selectedOriginalInvoice == null) {
    return null;
  }

  return $InvoiceModelCopyWith<$Res>(_self.selectedOriginalInvoice!, (value) {
    return _then(_self.copyWith(selectedOriginalInvoice: value));
  });
}
}

/// @nodoc


class _Error implements AddReturnInvoiceState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of AddReturnInvoiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AddReturnInvoiceState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $AddReturnInvoiceStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of AddReturnInvoiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
