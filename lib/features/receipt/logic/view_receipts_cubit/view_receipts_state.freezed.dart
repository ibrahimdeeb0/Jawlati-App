// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_receipts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ViewReceiptsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewReceiptsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ViewReceiptsState()';
}


}

/// @nodoc
class $ViewReceiptsStateCopyWith<$Res>  {
$ViewReceiptsStateCopyWith(ViewReceiptsState _, $Res Function(ViewReceiptsState) __);
}


/// Adds pattern-matching-related methods to [ViewReceiptsState].
extension ViewReceiptsStatePatterns on ViewReceiptsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ReceiptVoucherModel> receipts,  List<ReceiptVoucherModel> filteredReceipts,  double totalAmount,  int totalCount,  ReceiptFilter selectedFilter,  ReceiptSortBy selectedSort,  String searchQuery)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.receipts,_that.filteredReceipts,_that.totalAmount,_that.totalCount,_that.selectedFilter,_that.selectedSort,_that.searchQuery);case Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ReceiptVoucherModel> receipts,  List<ReceiptVoucherModel> filteredReceipts,  double totalAmount,  int totalCount,  ReceiptFilter selectedFilter,  ReceiptSortBy selectedSort,  String searchQuery)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.receipts,_that.filteredReceipts,_that.totalAmount,_that.totalCount,_that.selectedFilter,_that.selectedSort,_that.searchQuery);case Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ReceiptVoucherModel> receipts,  List<ReceiptVoucherModel> filteredReceipts,  double totalAmount,  int totalCount,  ReceiptFilter selectedFilter,  ReceiptSortBy selectedSort,  String searchQuery)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.receipts,_that.filteredReceipts,_that.totalAmount,_that.totalCount,_that.selectedFilter,_that.selectedSort,_that.searchQuery);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ViewReceiptsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ViewReceiptsState.initial()';
}


}




/// @nodoc


class Loading implements ViewReceiptsState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ViewReceiptsState.loading()';
}


}




/// @nodoc


class Loaded implements ViewReceiptsState {
  const Loaded({required final  List<ReceiptVoucherModel> receipts, required final  List<ReceiptVoucherModel> filteredReceipts, required this.totalAmount, required this.totalCount, this.selectedFilter = ReceiptFilter.all, this.selectedSort = ReceiptSortBy.date, this.searchQuery = ''}): _receipts = receipts,_filteredReceipts = filteredReceipts;
  

 final  List<ReceiptVoucherModel> _receipts;
 List<ReceiptVoucherModel> get receipts {
  if (_receipts is EqualUnmodifiableListView) return _receipts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_receipts);
}

 final  List<ReceiptVoucherModel> _filteredReceipts;
 List<ReceiptVoucherModel> get filteredReceipts {
  if (_filteredReceipts is EqualUnmodifiableListView) return _filteredReceipts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredReceipts);
}

 final  double totalAmount;
 final  int totalCount;
@JsonKey() final  ReceiptFilter selectedFilter;
@JsonKey() final  ReceiptSortBy selectedSort;
@JsonKey() final  String searchQuery;

/// Create a copy of ViewReceiptsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&const DeepCollectionEquality().equals(other._receipts, _receipts)&&const DeepCollectionEquality().equals(other._filteredReceipts, _filteredReceipts)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&(identical(other.selectedSort, selectedSort) || other.selectedSort == selectedSort)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_receipts),const DeepCollectionEquality().hash(_filteredReceipts),totalAmount,totalCount,selectedFilter,selectedSort,searchQuery);

@override
String toString() {
  return 'ViewReceiptsState.loaded(receipts: $receipts, filteredReceipts: $filteredReceipts, totalAmount: $totalAmount, totalCount: $totalCount, selectedFilter: $selectedFilter, selectedSort: $selectedSort, searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $ViewReceiptsStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 List<ReceiptVoucherModel> receipts, List<ReceiptVoucherModel> filteredReceipts, double totalAmount, int totalCount, ReceiptFilter selectedFilter, ReceiptSortBy selectedSort, String searchQuery
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of ViewReceiptsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? receipts = null,Object? filteredReceipts = null,Object? totalAmount = null,Object? totalCount = null,Object? selectedFilter = null,Object? selectedSort = null,Object? searchQuery = null,}) {
  return _then(Loaded(
receipts: null == receipts ? _self._receipts : receipts // ignore: cast_nullable_to_non_nullable
as List<ReceiptVoucherModel>,filteredReceipts: null == filteredReceipts ? _self._filteredReceipts : filteredReceipts // ignore: cast_nullable_to_non_nullable
as List<ReceiptVoucherModel>,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,selectedFilter: null == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as ReceiptFilter,selectedSort: null == selectedSort ? _self.selectedSort : selectedSort // ignore: cast_nullable_to_non_nullable
as ReceiptSortBy,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Error implements ViewReceiptsState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of ViewReceiptsState
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
  return 'ViewReceiptsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $ViewReceiptsStateCopyWith<$Res> {
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

/// Create a copy of ViewReceiptsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
