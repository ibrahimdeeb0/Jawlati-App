// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InvoiceState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InvoiceState<$T>()';
}


}

/// @nodoc
class $InvoiceStateCopyWith<T,$Res>  {
$InvoiceStateCopyWith(InvoiceState<T> _, $Res Function(InvoiceState<T>) __);
}


/// Adds pattern-matching-related methods to [InvoiceState].
extension InvoiceStatePatterns<T> on InvoiceState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<T> value)?  initial,TResult Function( _Loading<T> value)?  loading,TResult Function( Loaded<T> value)?  loaded,TResult Function( _Error<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<T> value)  initial,required TResult Function( _Loading<T> value)  loading,required TResult Function( Loaded<T> value)  loaded,required TResult Function( _Error<T> value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case Loaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<T> value)?  initial,TResult? Function( _Loading<T> value)?  loading,TResult? Function( Loaded<T> value)?  loaded,TResult? Function( _Error<T> value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String currentTime,  String currentDate,  List<InvoiceItem> invoiceItems,  double subtotal,  double totalAmount,  double paidAmount,  double remainingAmount,  String notes,  Client? selectedClient,  List<ItemModel>? filteredItems,  List<Client>? filteredClients,  AppPaymentMethod? selectedPaymentMethod,  List<AppPaymentMethod> availableMethods)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.currentTime,_that.currentDate,_that.invoiceItems,_that.subtotal,_that.totalAmount,_that.paidAmount,_that.remainingAmount,_that.notes,_that.selectedClient,_that.filteredItems,_that.filteredClients,_that.selectedPaymentMethod,_that.availableMethods);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String currentTime,  String currentDate,  List<InvoiceItem> invoiceItems,  double subtotal,  double totalAmount,  double paidAmount,  double remainingAmount,  String notes,  Client? selectedClient,  List<ItemModel>? filteredItems,  List<Client>? filteredClients,  AppPaymentMethod? selectedPaymentMethod,  List<AppPaymentMethod> availableMethods)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case Loaded():
return loaded(_that.currentTime,_that.currentDate,_that.invoiceItems,_that.subtotal,_that.totalAmount,_that.paidAmount,_that.remainingAmount,_that.notes,_that.selectedClient,_that.filteredItems,_that.filteredClients,_that.selectedPaymentMethod,_that.availableMethods);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String currentTime,  String currentDate,  List<InvoiceItem> invoiceItems,  double subtotal,  double totalAmount,  double paidAmount,  double remainingAmount,  String notes,  Client? selectedClient,  List<ItemModel>? filteredItems,  List<Client>? filteredClients,  AppPaymentMethod? selectedPaymentMethod,  List<AppPaymentMethod> availableMethods)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.currentTime,_that.currentDate,_that.invoiceItems,_that.subtotal,_that.totalAmount,_that.paidAmount,_that.remainingAmount,_that.notes,_that.selectedClient,_that.filteredItems,_that.filteredClients,_that.selectedPaymentMethod,_that.availableMethods);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial<T> implements InvoiceState<T> {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InvoiceState<$T>.initial()';
}


}




/// @nodoc


class _Loading<T> implements InvoiceState<T> {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InvoiceState<$T>.loading()';
}


}




/// @nodoc


class Loaded<T> implements InvoiceState<T> {
  const Loaded({required this.currentTime, required this.currentDate, required final  List<InvoiceItem> invoiceItems, required this.subtotal, required this.totalAmount, required this.paidAmount, required this.remainingAmount, required this.notes, this.selectedClient, final  List<ItemModel>? filteredItems, final  List<Client>? filteredClients, this.selectedPaymentMethod, final  List<AppPaymentMethod> availableMethods = const []}): _invoiceItems = invoiceItems,_filteredItems = filteredItems,_filteredClients = filteredClients,_availableMethods = availableMethods;
  

 final  String currentTime;
 final  String currentDate;
 final  List<InvoiceItem> _invoiceItems;
 List<InvoiceItem> get invoiceItems {
  if (_invoiceItems is EqualUnmodifiableListView) return _invoiceItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoiceItems);
}

 final  double subtotal;
 final  double totalAmount;
 final  double paidAmount;
 final  double remainingAmount;
 final  String notes;
 final  Client? selectedClient;
 final  List<ItemModel>? _filteredItems;
 List<ItemModel>? get filteredItems {
  final value = _filteredItems;
  if (value == null) return null;
  if (_filteredItems is EqualUnmodifiableListView) return _filteredItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Client>? _filteredClients;
 List<Client>? get filteredClients {
  final value = _filteredClients;
  if (value == null) return null;
  if (_filteredClients is EqualUnmodifiableListView) return _filteredClients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  AppPaymentMethod? selectedPaymentMethod;
 final  List<AppPaymentMethod> _availableMethods;
@JsonKey() List<AppPaymentMethod> get availableMethods {
  if (_availableMethods is EqualUnmodifiableListView) return _availableMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableMethods);
}


/// Create a copy of InvoiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<T, Loaded<T>> get copyWith => _$LoadedCopyWithImpl<T, Loaded<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded<T>&&(identical(other.currentTime, currentTime) || other.currentTime == currentTime)&&(identical(other.currentDate, currentDate) || other.currentDate == currentDate)&&const DeepCollectionEquality().equals(other._invoiceItems, _invoiceItems)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paidAmount, paidAmount) || other.paidAmount == paidAmount)&&(identical(other.remainingAmount, remainingAmount) || other.remainingAmount == remainingAmount)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.selectedClient, selectedClient) || other.selectedClient == selectedClient)&&const DeepCollectionEquality().equals(other._filteredItems, _filteredItems)&&const DeepCollectionEquality().equals(other._filteredClients, _filteredClients)&&(identical(other.selectedPaymentMethod, selectedPaymentMethod) || other.selectedPaymentMethod == selectedPaymentMethod)&&const DeepCollectionEquality().equals(other._availableMethods, _availableMethods));
}


@override
int get hashCode => Object.hash(runtimeType,currentTime,currentDate,const DeepCollectionEquality().hash(_invoiceItems),subtotal,totalAmount,paidAmount,remainingAmount,notes,selectedClient,const DeepCollectionEquality().hash(_filteredItems),const DeepCollectionEquality().hash(_filteredClients),selectedPaymentMethod,const DeepCollectionEquality().hash(_availableMethods));

@override
String toString() {
  return 'InvoiceState<$T>.loaded(currentTime: $currentTime, currentDate: $currentDate, invoiceItems: $invoiceItems, subtotal: $subtotal, totalAmount: $totalAmount, paidAmount: $paidAmount, remainingAmount: $remainingAmount, notes: $notes, selectedClient: $selectedClient, filteredItems: $filteredItems, filteredClients: $filteredClients, selectedPaymentMethod: $selectedPaymentMethod, availableMethods: $availableMethods)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<T,$Res> implements $InvoiceStateCopyWith<T, $Res> {
  factory $LoadedCopyWith(Loaded<T> value, $Res Function(Loaded<T>) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 String currentTime, String currentDate, List<InvoiceItem> invoiceItems, double subtotal, double totalAmount, double paidAmount, double remainingAmount, String notes, Client? selectedClient, List<ItemModel>? filteredItems, List<Client>? filteredClients, AppPaymentMethod? selectedPaymentMethod, List<AppPaymentMethod> availableMethods
});


$ClientCopyWith<$Res>? get selectedClient;

}
/// @nodoc
class _$LoadedCopyWithImpl<T,$Res>
    implements $LoadedCopyWith<T, $Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded<T> _self;
  final $Res Function(Loaded<T>) _then;

/// Create a copy of InvoiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentTime = null,Object? currentDate = null,Object? invoiceItems = null,Object? subtotal = null,Object? totalAmount = null,Object? paidAmount = null,Object? remainingAmount = null,Object? notes = null,Object? selectedClient = freezed,Object? filteredItems = freezed,Object? filteredClients = freezed,Object? selectedPaymentMethod = freezed,Object? availableMethods = null,}) {
  return _then(Loaded<T>(
currentTime: null == currentTime ? _self.currentTime : currentTime // ignore: cast_nullable_to_non_nullable
as String,currentDate: null == currentDate ? _self.currentDate : currentDate // ignore: cast_nullable_to_non_nullable
as String,invoiceItems: null == invoiceItems ? _self._invoiceItems : invoiceItems // ignore: cast_nullable_to_non_nullable
as List<InvoiceItem>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paidAmount: null == paidAmount ? _self.paidAmount : paidAmount // ignore: cast_nullable_to_non_nullable
as double,remainingAmount: null == remainingAmount ? _self.remainingAmount : remainingAmount // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,selectedClient: freezed == selectedClient ? _self.selectedClient : selectedClient // ignore: cast_nullable_to_non_nullable
as Client?,filteredItems: freezed == filteredItems ? _self._filteredItems : filteredItems // ignore: cast_nullable_to_non_nullable
as List<ItemModel>?,filteredClients: freezed == filteredClients ? _self._filteredClients : filteredClients // ignore: cast_nullable_to_non_nullable
as List<Client>?,selectedPaymentMethod: freezed == selectedPaymentMethod ? _self.selectedPaymentMethod : selectedPaymentMethod // ignore: cast_nullable_to_non_nullable
as AppPaymentMethod?,availableMethods: null == availableMethods ? _self._availableMethods : availableMethods // ignore: cast_nullable_to_non_nullable
as List<AppPaymentMethod>,
  ));
}

/// Create a copy of InvoiceState
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


class _Error<T> implements InvoiceState<T> {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of InvoiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<T, _Error<T>> get copyWith => __$ErrorCopyWithImpl<T, _Error<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'InvoiceState<$T>.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<T,$Res> implements $InvoiceStateCopyWith<T, $Res> {
  factory _$ErrorCopyWith(_Error<T> value, $Res Function(_Error<T>) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<T,$Res>
    implements _$ErrorCopyWith<T, $Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error<T> _self;
  final $Res Function(_Error<T>) _then;

/// Create a copy of InvoiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
