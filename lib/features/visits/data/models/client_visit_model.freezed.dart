// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_visit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientVisit {

 String get id; String get clientId; String? get clientName; String get salesmanId; String? get salesmanName; DateTime get checkInTime; DateTime? get checkOutTime; double get checkInLatitude; double get checkInLongitude; double? get checkOutLatitude; double? get checkOutLongitude; String? get checkInAddress; String? get checkOutAddress; String? get notes; VisitStatus get status; String? get purpose; List<String>? get attachments; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of ClientVisit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientVisitCopyWith<ClientVisit> get copyWith => _$ClientVisitCopyWithImpl<ClientVisit>(this as ClientVisit, _$identity);

  /// Serializes this ClientVisit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientVisit&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.salesmanId, salesmanId) || other.salesmanId == salesmanId)&&(identical(other.salesmanName, salesmanName) || other.salesmanName == salesmanName)&&(identical(other.checkInTime, checkInTime) || other.checkInTime == checkInTime)&&(identical(other.checkOutTime, checkOutTime) || other.checkOutTime == checkOutTime)&&(identical(other.checkInLatitude, checkInLatitude) || other.checkInLatitude == checkInLatitude)&&(identical(other.checkInLongitude, checkInLongitude) || other.checkInLongitude == checkInLongitude)&&(identical(other.checkOutLatitude, checkOutLatitude) || other.checkOutLatitude == checkOutLatitude)&&(identical(other.checkOutLongitude, checkOutLongitude) || other.checkOutLongitude == checkOutLongitude)&&(identical(other.checkInAddress, checkInAddress) || other.checkInAddress == checkInAddress)&&(identical(other.checkOutAddress, checkOutAddress) || other.checkOutAddress == checkOutAddress)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,clientId,clientName,salesmanId,salesmanName,checkInTime,checkOutTime,checkInLatitude,checkInLongitude,checkOutLatitude,checkOutLongitude,checkInAddress,checkOutAddress,notes,status,purpose,const DeepCollectionEquality().hash(attachments),createdAt,updatedAt]);

@override
String toString() {
  return 'ClientVisit(id: $id, clientId: $clientId, clientName: $clientName, salesmanId: $salesmanId, salesmanName: $salesmanName, checkInTime: $checkInTime, checkOutTime: $checkOutTime, checkInLatitude: $checkInLatitude, checkInLongitude: $checkInLongitude, checkOutLatitude: $checkOutLatitude, checkOutLongitude: $checkOutLongitude, checkInAddress: $checkInAddress, checkOutAddress: $checkOutAddress, notes: $notes, status: $status, purpose: $purpose, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ClientVisitCopyWith<$Res>  {
  factory $ClientVisitCopyWith(ClientVisit value, $Res Function(ClientVisit) _then) = _$ClientVisitCopyWithImpl;
@useResult
$Res call({
 String id, String clientId, String? clientName, String salesmanId, String? salesmanName, DateTime checkInTime, DateTime? checkOutTime, double checkInLatitude, double checkInLongitude, double? checkOutLatitude, double? checkOutLongitude, String? checkInAddress, String? checkOutAddress, String? notes, VisitStatus status, String? purpose, List<String>? attachments, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$ClientVisitCopyWithImpl<$Res>
    implements $ClientVisitCopyWith<$Res> {
  _$ClientVisitCopyWithImpl(this._self, this._then);

  final ClientVisit _self;
  final $Res Function(ClientVisit) _then;

/// Create a copy of ClientVisit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientId = null,Object? clientName = freezed,Object? salesmanId = null,Object? salesmanName = freezed,Object? checkInTime = null,Object? checkOutTime = freezed,Object? checkInLatitude = null,Object? checkInLongitude = null,Object? checkOutLatitude = freezed,Object? checkOutLongitude = freezed,Object? checkInAddress = freezed,Object? checkOutAddress = freezed,Object? notes = freezed,Object? status = null,Object? purpose = freezed,Object? attachments = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,salesmanId: null == salesmanId ? _self.salesmanId : salesmanId // ignore: cast_nullable_to_non_nullable
as String,salesmanName: freezed == salesmanName ? _self.salesmanName : salesmanName // ignore: cast_nullable_to_non_nullable
as String?,checkInTime: null == checkInTime ? _self.checkInTime : checkInTime // ignore: cast_nullable_to_non_nullable
as DateTime,checkOutTime: freezed == checkOutTime ? _self.checkOutTime : checkOutTime // ignore: cast_nullable_to_non_nullable
as DateTime?,checkInLatitude: null == checkInLatitude ? _self.checkInLatitude : checkInLatitude // ignore: cast_nullable_to_non_nullable
as double,checkInLongitude: null == checkInLongitude ? _self.checkInLongitude : checkInLongitude // ignore: cast_nullable_to_non_nullable
as double,checkOutLatitude: freezed == checkOutLatitude ? _self.checkOutLatitude : checkOutLatitude // ignore: cast_nullable_to_non_nullable
as double?,checkOutLongitude: freezed == checkOutLongitude ? _self.checkOutLongitude : checkOutLongitude // ignore: cast_nullable_to_non_nullable
as double?,checkInAddress: freezed == checkInAddress ? _self.checkInAddress : checkInAddress // ignore: cast_nullable_to_non_nullable
as String?,checkOutAddress: freezed == checkOutAddress ? _self.checkOutAddress : checkOutAddress // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VisitStatus,purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String?,attachments: freezed == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientVisit].
extension ClientVisitPatterns on ClientVisit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientVisit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientVisit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientVisit value)  $default,){
final _that = this;
switch (_that) {
case _ClientVisit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientVisit value)?  $default,){
final _that = this;
switch (_that) {
case _ClientVisit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientId,  String? clientName,  String salesmanId,  String? salesmanName,  DateTime checkInTime,  DateTime? checkOutTime,  double checkInLatitude,  double checkInLongitude,  double? checkOutLatitude,  double? checkOutLongitude,  String? checkInAddress,  String? checkOutAddress,  String? notes,  VisitStatus status,  String? purpose,  List<String>? attachments,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientVisit() when $default != null:
return $default(_that.id,_that.clientId,_that.clientName,_that.salesmanId,_that.salesmanName,_that.checkInTime,_that.checkOutTime,_that.checkInLatitude,_that.checkInLongitude,_that.checkOutLatitude,_that.checkOutLongitude,_that.checkInAddress,_that.checkOutAddress,_that.notes,_that.status,_that.purpose,_that.attachments,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientId,  String? clientName,  String salesmanId,  String? salesmanName,  DateTime checkInTime,  DateTime? checkOutTime,  double checkInLatitude,  double checkInLongitude,  double? checkOutLatitude,  double? checkOutLongitude,  String? checkInAddress,  String? checkOutAddress,  String? notes,  VisitStatus status,  String? purpose,  List<String>? attachments,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ClientVisit():
return $default(_that.id,_that.clientId,_that.clientName,_that.salesmanId,_that.salesmanName,_that.checkInTime,_that.checkOutTime,_that.checkInLatitude,_that.checkInLongitude,_that.checkOutLatitude,_that.checkOutLongitude,_that.checkInAddress,_that.checkOutAddress,_that.notes,_that.status,_that.purpose,_that.attachments,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientId,  String? clientName,  String salesmanId,  String? salesmanName,  DateTime checkInTime,  DateTime? checkOutTime,  double checkInLatitude,  double checkInLongitude,  double? checkOutLatitude,  double? checkOutLongitude,  String? checkInAddress,  String? checkOutAddress,  String? notes,  VisitStatus status,  String? purpose,  List<String>? attachments,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ClientVisit() when $default != null:
return $default(_that.id,_that.clientId,_that.clientName,_that.salesmanId,_that.salesmanName,_that.checkInTime,_that.checkOutTime,_that.checkInLatitude,_that.checkInLongitude,_that.checkOutLatitude,_that.checkOutLongitude,_that.checkInAddress,_that.checkOutAddress,_that.notes,_that.status,_that.purpose,_that.attachments,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientVisit extends ClientVisit {
  const _ClientVisit({required this.id, required this.clientId, this.clientName, required this.salesmanId, this.salesmanName, required this.checkInTime, this.checkOutTime, required this.checkInLatitude, required this.checkInLongitude, this.checkOutLatitude, this.checkOutLongitude, this.checkInAddress, this.checkOutAddress, this.notes, this.status = VisitStatus.checkedIn, this.purpose, final  List<String>? attachments, this.createdAt, this.updatedAt}): _attachments = attachments,super._();
  factory _ClientVisit.fromJson(Map<String, dynamic> json) => _$ClientVisitFromJson(json);

@override final  String id;
@override final  String clientId;
@override final  String? clientName;
@override final  String salesmanId;
@override final  String? salesmanName;
@override final  DateTime checkInTime;
@override final  DateTime? checkOutTime;
@override final  double checkInLatitude;
@override final  double checkInLongitude;
@override final  double? checkOutLatitude;
@override final  double? checkOutLongitude;
@override final  String? checkInAddress;
@override final  String? checkOutAddress;
@override final  String? notes;
@override@JsonKey() final  VisitStatus status;
@override final  String? purpose;
 final  List<String>? _attachments;
@override List<String>? get attachments {
  final value = _attachments;
  if (value == null) return null;
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of ClientVisit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientVisitCopyWith<_ClientVisit> get copyWith => __$ClientVisitCopyWithImpl<_ClientVisit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientVisitToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientVisit&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.salesmanId, salesmanId) || other.salesmanId == salesmanId)&&(identical(other.salesmanName, salesmanName) || other.salesmanName == salesmanName)&&(identical(other.checkInTime, checkInTime) || other.checkInTime == checkInTime)&&(identical(other.checkOutTime, checkOutTime) || other.checkOutTime == checkOutTime)&&(identical(other.checkInLatitude, checkInLatitude) || other.checkInLatitude == checkInLatitude)&&(identical(other.checkInLongitude, checkInLongitude) || other.checkInLongitude == checkInLongitude)&&(identical(other.checkOutLatitude, checkOutLatitude) || other.checkOutLatitude == checkOutLatitude)&&(identical(other.checkOutLongitude, checkOutLongitude) || other.checkOutLongitude == checkOutLongitude)&&(identical(other.checkInAddress, checkInAddress) || other.checkInAddress == checkInAddress)&&(identical(other.checkOutAddress, checkOutAddress) || other.checkOutAddress == checkOutAddress)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.status, status) || other.status == status)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,clientId,clientName,salesmanId,salesmanName,checkInTime,checkOutTime,checkInLatitude,checkInLongitude,checkOutLatitude,checkOutLongitude,checkInAddress,checkOutAddress,notes,status,purpose,const DeepCollectionEquality().hash(_attachments),createdAt,updatedAt]);

@override
String toString() {
  return 'ClientVisit(id: $id, clientId: $clientId, clientName: $clientName, salesmanId: $salesmanId, salesmanName: $salesmanName, checkInTime: $checkInTime, checkOutTime: $checkOutTime, checkInLatitude: $checkInLatitude, checkInLongitude: $checkInLongitude, checkOutLatitude: $checkOutLatitude, checkOutLongitude: $checkOutLongitude, checkInAddress: $checkInAddress, checkOutAddress: $checkOutAddress, notes: $notes, status: $status, purpose: $purpose, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ClientVisitCopyWith<$Res> implements $ClientVisitCopyWith<$Res> {
  factory _$ClientVisitCopyWith(_ClientVisit value, $Res Function(_ClientVisit) _then) = __$ClientVisitCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientId, String? clientName, String salesmanId, String? salesmanName, DateTime checkInTime, DateTime? checkOutTime, double checkInLatitude, double checkInLongitude, double? checkOutLatitude, double? checkOutLongitude, String? checkInAddress, String? checkOutAddress, String? notes, VisitStatus status, String? purpose, List<String>? attachments, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$ClientVisitCopyWithImpl<$Res>
    implements _$ClientVisitCopyWith<$Res> {
  __$ClientVisitCopyWithImpl(this._self, this._then);

  final _ClientVisit _self;
  final $Res Function(_ClientVisit) _then;

/// Create a copy of ClientVisit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? clientName = freezed,Object? salesmanId = null,Object? salesmanName = freezed,Object? checkInTime = null,Object? checkOutTime = freezed,Object? checkInLatitude = null,Object? checkInLongitude = null,Object? checkOutLatitude = freezed,Object? checkOutLongitude = freezed,Object? checkInAddress = freezed,Object? checkOutAddress = freezed,Object? notes = freezed,Object? status = null,Object? purpose = freezed,Object? attachments = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ClientVisit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,salesmanId: null == salesmanId ? _self.salesmanId : salesmanId // ignore: cast_nullable_to_non_nullable
as String,salesmanName: freezed == salesmanName ? _self.salesmanName : salesmanName // ignore: cast_nullable_to_non_nullable
as String?,checkInTime: null == checkInTime ? _self.checkInTime : checkInTime // ignore: cast_nullable_to_non_nullable
as DateTime,checkOutTime: freezed == checkOutTime ? _self.checkOutTime : checkOutTime // ignore: cast_nullable_to_non_nullable
as DateTime?,checkInLatitude: null == checkInLatitude ? _self.checkInLatitude : checkInLatitude // ignore: cast_nullable_to_non_nullable
as double,checkInLongitude: null == checkInLongitude ? _self.checkInLongitude : checkInLongitude // ignore: cast_nullable_to_non_nullable
as double,checkOutLatitude: freezed == checkOutLatitude ? _self.checkOutLatitude : checkOutLatitude // ignore: cast_nullable_to_non_nullable
as double?,checkOutLongitude: freezed == checkOutLongitude ? _self.checkOutLongitude : checkOutLongitude // ignore: cast_nullable_to_non_nullable
as double?,checkInAddress: freezed == checkInAddress ? _self.checkInAddress : checkInAddress // ignore: cast_nullable_to_non_nullable
as String?,checkOutAddress: freezed == checkOutAddress ? _self.checkOutAddress : checkOutAddress // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as VisitStatus,purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String?,attachments: freezed == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
