// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_return_invoices_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ViewReturnInvoicesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewReturnInvoicesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ViewReturnInvoicesState()';
}


}

/// @nodoc
class $ViewReturnInvoicesStateCopyWith<$Res>  {
$ViewReturnInvoicesStateCopyWith(ViewReturnInvoicesState _, $Res Function(ViewReturnInvoicesState) __);
}


/// Adds pattern-matching-related methods to [ViewReturnInvoicesState].
extension ViewReturnInvoicesStatePatterns on ViewReturnInvoicesState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ReturnInvoiceModel> returnInvoices,  List<ReturnInvoiceModel>? filteredInvoices,  String searchQuery,  ReturnInvoiceFilter selectedFilter,  ReturnInvoiceSortBy sortBy,  bool isAscending)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.returnInvoices,_that.filteredInvoices,_that.searchQuery,_that.selectedFilter,_that.sortBy,_that.isAscending);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ReturnInvoiceModel> returnInvoices,  List<ReturnInvoiceModel>? filteredInvoices,  String searchQuery,  ReturnInvoiceFilter selectedFilter,  ReturnInvoiceSortBy sortBy,  bool isAscending)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.returnInvoices,_that.filteredInvoices,_that.searchQuery,_that.selectedFilter,_that.sortBy,_that.isAscending);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ReturnInvoiceModel> returnInvoices,  List<ReturnInvoiceModel>? filteredInvoices,  String searchQuery,  ReturnInvoiceFilter selectedFilter,  ReturnInvoiceSortBy sortBy,  bool isAscending)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.returnInvoices,_that.filteredInvoices,_that.searchQuery,_that.selectedFilter,_that.sortBy,_that.isAscending);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ViewReturnInvoicesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ViewReturnInvoicesState.initial()';
}


}




/// @nodoc


class _Loading implements ViewReturnInvoicesState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ViewReturnInvoicesState.loading()';
}


}




/// @nodoc


class _Loaded implements ViewReturnInvoicesState {
  const _Loaded({required final  List<ReturnInvoiceModel> returnInvoices, final  List<ReturnInvoiceModel>? filteredInvoices, required this.searchQuery, required this.selectedFilter, required this.sortBy, required this.isAscending}): _returnInvoices = returnInvoices,_filteredInvoices = filteredInvoices;
  

 final  List<ReturnInvoiceModel> _returnInvoices;
 List<ReturnInvoiceModel> get returnInvoices {
  if (_returnInvoices is EqualUnmodifiableListView) return _returnInvoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_returnInvoices);
}

 final  List<ReturnInvoiceModel>? _filteredInvoices;
 List<ReturnInvoiceModel>? get filteredInvoices {
  final value = _filteredInvoices;
  if (value == null) return null;
  if (_filteredInvoices is EqualUnmodifiableListView) return _filteredInvoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  String searchQuery;
 final  ReturnInvoiceFilter selectedFilter;
 final  ReturnInvoiceSortBy sortBy;
 final  bool isAscending;

/// Create a copy of ViewReturnInvoicesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._returnInvoices, _returnInvoices)&&const DeepCollectionEquality().equals(other._filteredInvoices, _filteredInvoices)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.isAscending, isAscending) || other.isAscending == isAscending));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_returnInvoices),const DeepCollectionEquality().hash(_filteredInvoices),searchQuery,selectedFilter,sortBy,isAscending);

@override
String toString() {
  return 'ViewReturnInvoicesState.loaded(returnInvoices: $returnInvoices, filteredInvoices: $filteredInvoices, searchQuery: $searchQuery, selectedFilter: $selectedFilter, sortBy: $sortBy, isAscending: $isAscending)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ViewReturnInvoicesStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<ReturnInvoiceModel> returnInvoices, List<ReturnInvoiceModel>? filteredInvoices, String searchQuery, ReturnInvoiceFilter selectedFilter, ReturnInvoiceSortBy sortBy, bool isAscending
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ViewReturnInvoicesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? returnInvoices = null,Object? filteredInvoices = freezed,Object? searchQuery = null,Object? selectedFilter = null,Object? sortBy = null,Object? isAscending = null,}) {
  return _then(_Loaded(
returnInvoices: null == returnInvoices ? _self._returnInvoices : returnInvoices // ignore: cast_nullable_to_non_nullable
as List<ReturnInvoiceModel>,filteredInvoices: freezed == filteredInvoices ? _self._filteredInvoices : filteredInvoices // ignore: cast_nullable_to_non_nullable
as List<ReturnInvoiceModel>?,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,selectedFilter: null == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as ReturnInvoiceFilter,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as ReturnInvoiceSortBy,isAscending: null == isAscending ? _self.isAscending : isAscending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Error implements ViewReturnInvoicesState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of ViewReturnInvoicesState
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
  return 'ViewReturnInvoicesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ViewReturnInvoicesStateCopyWith<$Res> {
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

/// Create a copy of ViewReturnInvoicesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
