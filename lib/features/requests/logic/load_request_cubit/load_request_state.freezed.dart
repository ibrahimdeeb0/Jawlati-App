// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoadRequestState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadRequestState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadRequestState()';
}


}

/// @nodoc
class $LoadRequestStateCopyWith<$Res>  {
$LoadRequestStateCopyWith(LoadRequestState _, $Res Function(LoadRequestState) __);
}


/// Adds pattern-matching-related methods to [LoadRequestState].
extension LoadRequestStatePatterns on LoadRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( _Error value)?  error,TResult Function( _SubmissionInProgress value)?  submissionInProgress,TResult Function( _SubmissionSuccess value)?  submissionSuccess,TResult Function( _SubmissionFailure value)?  submissionFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( _Error value)  error,required TResult Function( _SubmissionInProgress value)  submissionInProgress,required TResult Function( _SubmissionSuccess value)  submissionSuccess,required TResult Function( _SubmissionFailure value)  submissionFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( _Error value)?  error,TResult? Function( _SubmissionInProgress value)?  submissionInProgress,TResult? Function( _SubmissionSuccess value)?  submissionSuccess,TResult? Function( _SubmissionFailure value)?  submissionFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DateTime date,  List<RequestItem> requestItems,  String notes,  List<ItemModel>? filteredItems)?  loaded,TResult Function( String message)?  error,TResult Function()?  submissionInProgress,TResult Function()?  submissionSuccess,TResult Function( String error)?  submissionFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.date,_that.requestItems,_that.notes,_that.filteredItems);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DateTime date,  List<RequestItem> requestItems,  String notes,  List<ItemModel>? filteredItems)  loaded,required TResult Function( String message)  error,required TResult Function()  submissionInProgress,required TResult Function()  submissionSuccess,required TResult Function( String error)  submissionFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.date,_that.requestItems,_that.notes,_that.filteredItems);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DateTime date,  List<RequestItem> requestItems,  String notes,  List<ItemModel>? filteredItems)?  loaded,TResult? Function( String message)?  error,TResult? Function()?  submissionInProgress,TResult? Function()?  submissionSuccess,TResult? Function( String error)?  submissionFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.date,_that.requestItems,_that.notes,_that.filteredItems);case _Error() when error != null:
return error(_that.message);case _SubmissionInProgress() when submissionInProgress != null:
return submissionInProgress();case _SubmissionSuccess() when submissionSuccess != null:
return submissionSuccess();case _SubmissionFailure() when submissionFailure != null:
return submissionFailure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LoadRequestState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadRequestState.initial()';
}


}




/// @nodoc


class Loading implements LoadRequestState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadRequestState.loading()';
}


}




/// @nodoc


class Loaded implements LoadRequestState {
  const Loaded({required this.date, required final  List<RequestItem> requestItems, this.notes = '', final  List<ItemModel>? filteredItems}): _requestItems = requestItems,_filteredItems = filteredItems;
  

 final  DateTime date;
 final  List<RequestItem> _requestItems;
 List<RequestItem> get requestItems {
  if (_requestItems is EqualUnmodifiableListView) return _requestItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requestItems);
}

@JsonKey() final  String notes;
 final  List<ItemModel>? _filteredItems;
 List<ItemModel>? get filteredItems {
  final value = _filteredItems;
  if (value == null) return null;
  if (_filteredItems is EqualUnmodifiableListView) return _filteredItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of LoadRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._requestItems, _requestItems)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._filteredItems, _filteredItems));
}


@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_requestItems),notes,const DeepCollectionEquality().hash(_filteredItems));

@override
String toString() {
  return 'LoadRequestState.loaded(date: $date, requestItems: $requestItems, notes: $notes, filteredItems: $filteredItems)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $LoadRequestStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 DateTime date, List<RequestItem> requestItems, String notes, List<ItemModel>? filteredItems
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of LoadRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = null,Object? requestItems = null,Object? notes = null,Object? filteredItems = freezed,}) {
  return _then(Loaded(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,requestItems: null == requestItems ? _self._requestItems : requestItems // ignore: cast_nullable_to_non_nullable
as List<RequestItem>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,filteredItems: freezed == filteredItems ? _self._filteredItems : filteredItems // ignore: cast_nullable_to_non_nullable
as List<ItemModel>?,
  ));
}


}

/// @nodoc


class _Error implements LoadRequestState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of LoadRequestState
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
  return 'LoadRequestState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $LoadRequestStateCopyWith<$Res> {
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

/// Create a copy of LoadRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SubmissionInProgress implements LoadRequestState {
  const _SubmissionInProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmissionInProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadRequestState.submissionInProgress()';
}


}




/// @nodoc


class _SubmissionSuccess implements LoadRequestState {
  const _SubmissionSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmissionSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoadRequestState.submissionSuccess()';
}


}




/// @nodoc


class _SubmissionFailure implements LoadRequestState {
  const _SubmissionFailure(this.error);
  

 final  String error;

/// Create a copy of LoadRequestState
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
  return 'LoadRequestState.submissionFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$SubmissionFailureCopyWith<$Res> implements $LoadRequestStateCopyWith<$Res> {
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

/// Create a copy of LoadRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_SubmissionFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
