// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_receipt_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddReceiptState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddReceiptState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddReceiptState()';
}


}

/// @nodoc
class $AddReceiptStateCopyWith<$Res>  {
$AddReceiptStateCopyWith(AddReceiptState _, $Res Function(AddReceiptState) __);
}


/// Adds pattern-matching-related methods to [AddReceiptState].
extension AddReceiptStatePatterns on AddReceiptState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( _Success value)?  success,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case _Success() when success != null:
return success(_that);case Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( _Success value)  success,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case _Success():
return success(_that);case Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( _Success value)?  success,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case _Success() when success != null:
return success(_that);case Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String currentTime,  String currentDate,  double amount,  String notes,  Client? selectedClient,  List<Client>? filteredClients,  ReceiptType receiptType,  String? chequeNumber,  String? bankName,  DateTime? chequeMaturityDate)?  loaded,TResult Function( String message)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.currentTime,_that.currentDate,_that.amount,_that.notes,_that.selectedClient,_that.filteredClients,_that.receiptType,_that.chequeNumber,_that.bankName,_that.chequeMaturityDate);case _Success() when success != null:
return success(_that.message);case Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String currentTime,  String currentDate,  double amount,  String notes,  Client? selectedClient,  List<Client>? filteredClients,  ReceiptType receiptType,  String? chequeNumber,  String? bankName,  DateTime? chequeMaturityDate)  loaded,required TResult Function( String message)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.currentTime,_that.currentDate,_that.amount,_that.notes,_that.selectedClient,_that.filteredClients,_that.receiptType,_that.chequeNumber,_that.bankName,_that.chequeMaturityDate);case _Success():
return success(_that.message);case Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String currentTime,  String currentDate,  double amount,  String notes,  Client? selectedClient,  List<Client>? filteredClients,  ReceiptType receiptType,  String? chequeNumber,  String? bankName,  DateTime? chequeMaturityDate)?  loaded,TResult? Function( String message)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.currentTime,_that.currentDate,_that.amount,_that.notes,_that.selectedClient,_that.filteredClients,_that.receiptType,_that.chequeNumber,_that.bankName,_that.chequeMaturityDate);case _Success() when success != null:
return success(_that.message);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AddReceiptState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddReceiptState.initial()';
}


}




/// @nodoc


class Loading implements AddReceiptState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AddReceiptState.loading()';
}


}




/// @nodoc


class Loaded implements AddReceiptState {
  const Loaded({required this.currentTime, required this.currentDate, required this.amount, required this.notes, this.selectedClient, final  List<Client>? filteredClients, this.receiptType = ReceiptType.cash, this.chequeNumber, this.bankName, this.chequeMaturityDate}): _filteredClients = filteredClients;
  

 final  String currentTime;
 final  String currentDate;
 final  double amount;
 final  String notes;
 final  Client? selectedClient;
 final  List<Client>? _filteredClients;
 List<Client>? get filteredClients {
  final value = _filteredClients;
  if (value == null) return null;
  if (_filteredClients is EqualUnmodifiableListView) return _filteredClients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@JsonKey() final  ReceiptType receiptType;
 final  String? chequeNumber;
 final  String? bankName;
 final  DateTime? chequeMaturityDate;

/// Create a copy of AddReceiptState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.currentTime, currentTime) || other.currentTime == currentTime)&&(identical(other.currentDate, currentDate) || other.currentDate == currentDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.selectedClient, selectedClient) || other.selectedClient == selectedClient)&&const DeepCollectionEquality().equals(other._filteredClients, _filteredClients)&&(identical(other.receiptType, receiptType) || other.receiptType == receiptType)&&(identical(other.chequeNumber, chequeNumber) || other.chequeNumber == chequeNumber)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.chequeMaturityDate, chequeMaturityDate) || other.chequeMaturityDate == chequeMaturityDate));
}


@override
int get hashCode => Object.hash(runtimeType,currentTime,currentDate,amount,notes,selectedClient,const DeepCollectionEquality().hash(_filteredClients),receiptType,chequeNumber,bankName,chequeMaturityDate);

@override
String toString() {
  return 'AddReceiptState.loaded(currentTime: $currentTime, currentDate: $currentDate, amount: $amount, notes: $notes, selectedClient: $selectedClient, filteredClients: $filteredClients, receiptType: $receiptType, chequeNumber: $chequeNumber, bankName: $bankName, chequeMaturityDate: $chequeMaturityDate)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $AddReceiptStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 String currentTime, String currentDate, double amount, String notes, Client? selectedClient, List<Client>? filteredClients, ReceiptType receiptType, String? chequeNumber, String? bankName, DateTime? chequeMaturityDate
});


$ClientCopyWith<$Res>? get selectedClient;

}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of AddReceiptState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentTime = null,Object? currentDate = null,Object? amount = null,Object? notes = null,Object? selectedClient = freezed,Object? filteredClients = freezed,Object? receiptType = null,Object? chequeNumber = freezed,Object? bankName = freezed,Object? chequeMaturityDate = freezed,}) {
  return _then(Loaded(
currentTime: null == currentTime ? _self.currentTime : currentTime // ignore: cast_nullable_to_non_nullable
as String,currentDate: null == currentDate ? _self.currentDate : currentDate // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,selectedClient: freezed == selectedClient ? _self.selectedClient : selectedClient // ignore: cast_nullable_to_non_nullable
as Client?,filteredClients: freezed == filteredClients ? _self._filteredClients : filteredClients // ignore: cast_nullable_to_non_nullable
as List<Client>?,receiptType: null == receiptType ? _self.receiptType : receiptType // ignore: cast_nullable_to_non_nullable
as ReceiptType,chequeNumber: freezed == chequeNumber ? _self.chequeNumber : chequeNumber // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,chequeMaturityDate: freezed == chequeMaturityDate ? _self.chequeMaturityDate : chequeMaturityDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of AddReceiptState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientCopyWith<$Res>? get selectedClient {
    if (_self.selectedClient == null) {
    return null;
  }

  return $ClientCopyWith<$Res>(_self.selectedClient!, (value) {
    return _then(_self.copyWith(selectedClient: value));
  });
}
}

/// @nodoc


class _Success implements AddReceiptState {
  const _Success(this.message);
  

 final  String message;

/// Create a copy of AddReceiptState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AddReceiptState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $AddReceiptStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of AddReceiptState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Success(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Error implements AddReceiptState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of AddReceiptState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AddReceiptState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $AddReceiptStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of AddReceiptState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
