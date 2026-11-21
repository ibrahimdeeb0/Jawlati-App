// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SalesRequestState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesRequestState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SalesRequestState()';
}


}

/// @nodoc
class $SalesRequestStateCopyWith<$Res>  {
$SalesRequestStateCopyWith(SalesRequestState _, $Res Function(SalesRequestState) __);
}


/// Adds pattern-matching-related methods to [SalesRequestState].
extension SalesRequestStatePatterns on SalesRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( _Error value)?  error,TResult Function( _SubmissionInProgress value)?  submissionInProgress,TResult Function( _SubmissionSuccess value)?  submissionSuccess,TResult Function( _SubmissionFailure value)?  submissionFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _SubmissionInProgress() when submissionInProgress != null:
return submissionInProgress(_that);case _SubmissionSuccess() when submissionSuccess != null:
return submissionSuccess(_that);case _SubmissionFailure() when submissionFailure != null:
return submissionFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( _Error value)  error,required TResult Function( _SubmissionInProgress value)  submissionInProgress,required TResult Function( _SubmissionSuccess value)  submissionSuccess,required TResult Function( _SubmissionFailure value)  submissionFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case Loaded():
return loaded(_that);case _Error():
return error(_that);case _SubmissionInProgress():
return submissionInProgress(_that);case _SubmissionSuccess():
return submissionSuccess(_that);case _SubmissionFailure():
return submissionFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( _Error value)?  error,TResult? Function( _SubmissionInProgress value)?  submissionInProgress,TResult? Function( _SubmissionSuccess value)?  submissionSuccess,TResult? Function( _SubmissionFailure value)?  submissionFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _SubmissionInProgress() when submissionInProgress != null:
return submissionInProgress(_that);case _SubmissionSuccess() when submissionSuccess != null:
return submissionSuccess(_that);case _SubmissionFailure() when submissionFailure != null:
return submissionFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DateTime date,  List<RequestItem> items,  double subtotal,  double discount,  double totalAmount,  String notes,  List<Client>? filteredClients,  Client? selectedClient,  List<ItemModel>? filteredItems,  ItemModel? selectedItem)?  loaded,TResult Function( String message)?  error,TResult Function()?  submissionInProgress,TResult Function()?  submissionSuccess,TResult Function( String error)?  submissionFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.date,_that.items,_that.subtotal,_that.discount,_that.totalAmount,_that.notes,_that.filteredClients,_that.selectedClient,_that.filteredItems,_that.selectedItem);case _Error() when error != null:
return error(_that.message);case _SubmissionInProgress() when submissionInProgress != null:
return submissionInProgress();case _SubmissionSuccess() when submissionSuccess != null:
return submissionSuccess();case _SubmissionFailure() when submissionFailure != null:
return submissionFailure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DateTime date,  List<RequestItem> items,  double subtotal,  double discount,  double totalAmount,  String notes,  List<Client>? filteredClients,  Client? selectedClient,  List<ItemModel>? filteredItems,  ItemModel? selectedItem)  loaded,required TResult Function( String message)  error,required TResult Function()  submissionInProgress,required TResult Function()  submissionSuccess,required TResult Function( String error)  submissionFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case Loaded():
return loaded(_that.date,_that.items,_that.subtotal,_that.discount,_that.totalAmount,_that.notes,_that.filteredClients,_that.selectedClient,_that.filteredItems,_that.selectedItem);case _Error():
return error(_that.message);case _SubmissionInProgress():
return submissionInProgress();case _SubmissionSuccess():
return submissionSuccess();case _SubmissionFailure():
return submissionFailure(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DateTime date,  List<RequestItem> items,  double subtotal,  double discount,  double totalAmount,  String notes,  List<Client>? filteredClients,  Client? selectedClient,  List<ItemModel>? filteredItems,  ItemModel? selectedItem)?  loaded,TResult? Function( String message)?  error,TResult? Function()?  submissionInProgress,TResult? Function()?  submissionSuccess,TResult? Function( String error)?  submissionFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.date,_that.items,_that.subtotal,_that.discount,_that.totalAmount,_that.notes,_that.filteredClients,_that.selectedClient,_that.filteredItems,_that.selectedItem);case _Error() when error != null:
return error(_that.message);case _SubmissionInProgress() when submissionInProgress != null:
return submissionInProgress();case _SubmissionSuccess() when submissionSuccess != null:
return submissionSuccess();case _SubmissionFailure() when submissionFailure != null:
return submissionFailure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SalesRequestState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SalesRequestState.initial()';
}


}




/// @nodoc


class _Loading implements SalesRequestState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SalesRequestState.loading()';
}


}




/// @nodoc


class Loaded implements SalesRequestState {
  const Loaded({required this.date, final  List<RequestItem> items = const [], this.subtotal = 0.0, this.discount = 0.0, this.totalAmount = 0.0, this.notes = '', final  List<Client>? filteredClients, this.selectedClient, final  List<ItemModel>? filteredItems, this.selectedItem}): _items = items,_filteredClients = filteredClients,_filteredItems = filteredItems;
  

 final  DateTime date;
 final  List<RequestItem> _items;
@JsonKey() List<RequestItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@JsonKey() final  double subtotal;
@JsonKey() final  double discount;
@JsonKey() final  double totalAmount;
@JsonKey() final  String notes;
 final  List<Client>? _filteredClients;
 List<Client>? get filteredClients {
  final value = _filteredClients;
  if (value == null) return null;
  if (_filteredClients is EqualUnmodifiableListView) return _filteredClients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Client? selectedClient;
 final  List<ItemModel>? _filteredItems;
 List<ItemModel>? get filteredItems {
  final value = _filteredItems;
  if (value == null) return null;
  if (_filteredItems is EqualUnmodifiableListView) return _filteredItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  ItemModel? selectedItem;

/// Create a copy of SalesRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._filteredClients, _filteredClients)&&(identical(other.selectedClient, selectedClient) || other.selectedClient == selectedClient)&&const DeepCollectionEquality().equals(other._filteredItems, _filteredItems)&&(identical(other.selectedItem, selectedItem) || other.selectedItem == selectedItem));
}


@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_items),subtotal,discount,totalAmount,notes,const DeepCollectionEquality().hash(_filteredClients),selectedClient,const DeepCollectionEquality().hash(_filteredItems),selectedItem);

@override
String toString() {
  return 'SalesRequestState.loaded(date: $date, items: $items, subtotal: $subtotal, discount: $discount, totalAmount: $totalAmount, notes: $notes, filteredClients: $filteredClients, selectedClient: $selectedClient, filteredItems: $filteredItems, selectedItem: $selectedItem)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $SalesRequestStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 DateTime date, List<RequestItem> items, double subtotal, double discount, double totalAmount, String notes, List<Client>? filteredClients, Client? selectedClient, List<ItemModel>? filteredItems, ItemModel? selectedItem
});


$ClientCopyWith<$Res>? get selectedClient;$ItemModelCopyWith<$Res>? get selectedItem;

}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of SalesRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = null,Object? items = null,Object? subtotal = null,Object? discount = null,Object? totalAmount = null,Object? notes = null,Object? filteredClients = freezed,Object? selectedClient = freezed,Object? filteredItems = freezed,Object? selectedItem = freezed,}) {
  return _then(Loaded(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<RequestItem>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,filteredClients: freezed == filteredClients ? _self._filteredClients : filteredClients // ignore: cast_nullable_to_non_nullable
as List<Client>?,selectedClient: freezed == selectedClient ? _self.selectedClient : selectedClient // ignore: cast_nullable_to_non_nullable
as Client?,filteredItems: freezed == filteredItems ? _self._filteredItems : filteredItems // ignore: cast_nullable_to_non_nullable
as List<ItemModel>?,selectedItem: freezed == selectedItem ? _self.selectedItem : selectedItem // ignore: cast_nullable_to_non_nullable
as ItemModel?,
  ));
}

/// Create a copy of SalesRequestState
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
}/// Create a copy of SalesRequestState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ItemModelCopyWith<$Res>? get selectedItem {
    if (_self.selectedItem == null) {
    return null;
  }

  return $ItemModelCopyWith<$Res>(_self.selectedItem!, (value) {
    return _then(_self.copyWith(selectedItem: value));
  });
}
}

/// @nodoc


class _Error implements SalesRequestState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of SalesRequestState
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
  return 'SalesRequestState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $SalesRequestStateCopyWith<$Res> {
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

/// Create a copy of SalesRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SubmissionInProgress implements SalesRequestState {
  const _SubmissionInProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmissionInProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SalesRequestState.submissionInProgress()';
}


}




/// @nodoc


class _SubmissionSuccess implements SalesRequestState {
  const _SubmissionSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmissionSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SalesRequestState.submissionSuccess()';
}


}




/// @nodoc


class _SubmissionFailure implements SalesRequestState {
  const _SubmissionFailure(this.error);
  

 final  String error;

/// Create a copy of SalesRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmissionFailureCopyWith<_SubmissionFailure> get copyWith => __$SubmissionFailureCopyWithImpl<_SubmissionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmissionFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SalesRequestState.submissionFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$SubmissionFailureCopyWith<$Res> implements $SalesRequestStateCopyWith<$Res> {
  factory _$SubmissionFailureCopyWith(_SubmissionFailure value, $Res Function(_SubmissionFailure) _then) = __$SubmissionFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$SubmissionFailureCopyWithImpl<$Res>
    implements _$SubmissionFailureCopyWith<$Res> {
  __$SubmissionFailureCopyWithImpl(this._self, this._then);

  final _SubmissionFailure _self;
  final $Res Function(_SubmissionFailure) _then;

/// Create a copy of SalesRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_SubmissionFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
