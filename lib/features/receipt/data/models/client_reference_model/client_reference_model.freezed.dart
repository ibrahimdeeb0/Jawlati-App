// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_reference_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientReference {

 String get id; String get name; String get phone; String? get email; String? get address; double get balance;
/// Create a copy of ClientReference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientReferenceCopyWith<ClientReference> get copyWith => _$ClientReferenceCopyWithImpl<ClientReference>(this as ClientReference, _$identity);

  /// Serializes this ClientReference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientReference&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,email,address,balance);

@override
String toString() {
  return 'ClientReference(id: $id, name: $name, phone: $phone, email: $email, address: $address, balance: $balance)';
}


}

/// @nodoc
abstract mixin class $ClientReferenceCopyWith<$Res>  {
  factory $ClientReferenceCopyWith(ClientReference value, $Res Function(ClientReference) _then) = _$ClientReferenceCopyWithImpl;
@useResult
$Res call({
 String id, String name, String phone, String? email, String? address, double balance
});




}
/// @nodoc
class _$ClientReferenceCopyWithImpl<$Res>
    implements $ClientReferenceCopyWith<$Res> {
  _$ClientReferenceCopyWithImpl(this._self, this._then);

  final ClientReference _self;
  final $Res Function(ClientReference) _then;

/// Create a copy of ClientReference
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? email = freezed,Object? address = freezed,Object? balance = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientReference].
extension ClientReferencePatterns on ClientReference {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientReference value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientReference() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientReference value)  $default,){
final _that = this;
switch (_that) {
case _ClientReference():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientReference value)?  $default,){
final _that = this;
switch (_that) {
case _ClientReference() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String phone,  String? email,  String? address,  double balance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientReference() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email,_that.address,_that.balance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String phone,  String? email,  String? address,  double balance)  $default,) {final _that = this;
switch (_that) {
case _ClientReference():
return $default(_that.id,_that.name,_that.phone,_that.email,_that.address,_that.balance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String phone,  String? email,  String? address,  double balance)?  $default,) {final _that = this;
switch (_that) {
case _ClientReference() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email,_that.address,_that.balance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientReference implements ClientReference {
  const _ClientReference({required this.id, required this.name, required this.phone, this.email, this.address, this.balance = 0.0});
  factory _ClientReference.fromJson(Map<String, dynamic> json) => _$ClientReferenceFromJson(json);

@override final  String id;
@override final  String name;
@override final  String phone;
@override final  String? email;
@override final  String? address;
@override@JsonKey() final  double balance;

/// Create a copy of ClientReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientReferenceCopyWith<_ClientReference> get copyWith => __$ClientReferenceCopyWithImpl<_ClientReference>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientReferenceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientReference&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,email,address,balance);

@override
String toString() {
  return 'ClientReference(id: $id, name: $name, phone: $phone, email: $email, address: $address, balance: $balance)';
}


}

/// @nodoc
abstract mixin class _$ClientReferenceCopyWith<$Res> implements $ClientReferenceCopyWith<$Res> {
  factory _$ClientReferenceCopyWith(_ClientReference value, $Res Function(_ClientReference) _then) = __$ClientReferenceCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String phone, String? email, String? address, double balance
});




}
/// @nodoc
class __$ClientReferenceCopyWithImpl<$Res>
    implements _$ClientReferenceCopyWith<$Res> {
  __$ClientReferenceCopyWithImpl(this._self, this._then);

  final _ClientReference _self;
  final $Res Function(_ClientReference) _then;

/// Create a copy of ClientReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? email = freezed,Object? address = freezed,Object? balance = null,}) {
  return _then(_ClientReference(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
