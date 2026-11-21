// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Client {

 String get id; String get name; String get phone; String? get email; String? get address; String? get taxNumber; ClientType? get type; String? get managerName; String? get commercialRegistryImagePath; String? get residenceImagePath; OrderType get selectedOrderType; double get balance; bool get isActive; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Client
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientCopyWith<Client> get copyWith => _$ClientCopyWithImpl<Client>(this as Client, _$identity);

  /// Serializes this Client to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Client&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.taxNumber, taxNumber) || other.taxNumber == taxNumber)&&(identical(other.type, type) || other.type == type)&&(identical(other.managerName, managerName) || other.managerName == managerName)&&(identical(other.commercialRegistryImagePath, commercialRegistryImagePath) || other.commercialRegistryImagePath == commercialRegistryImagePath)&&(identical(other.residenceImagePath, residenceImagePath) || other.residenceImagePath == residenceImagePath)&&(identical(other.selectedOrderType, selectedOrderType) || other.selectedOrderType == selectedOrderType)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,email,address,taxNumber,type,managerName,commercialRegistryImagePath,residenceImagePath,selectedOrderType,balance,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'Client(id: $id, name: $name, phone: $phone, email: $email, address: $address, taxNumber: $taxNumber, type: $type, managerName: $managerName, commercialRegistryImagePath: $commercialRegistryImagePath, residenceImagePath: $residenceImagePath, selectedOrderType: $selectedOrderType, balance: $balance, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ClientCopyWith<$Res>  {
  factory $ClientCopyWith(Client value, $Res Function(Client) _then) = _$ClientCopyWithImpl;
@useResult
$Res call({
 String id, String name, String phone, String? email, String? address, String? taxNumber, ClientType? type, String? managerName, String? commercialRegistryImagePath, String? residenceImagePath, OrderType selectedOrderType, double balance, bool isActive, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$ClientCopyWithImpl<$Res>
    implements $ClientCopyWith<$Res> {
  _$ClientCopyWithImpl(this._self, this._then);

  final Client _self;
  final $Res Function(Client) _then;

/// Create a copy of Client
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? email = freezed,Object? address = freezed,Object? taxNumber = freezed,Object? type = freezed,Object? managerName = freezed,Object? commercialRegistryImagePath = freezed,Object? residenceImagePath = freezed,Object? selectedOrderType = null,Object? balance = null,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,taxNumber: freezed == taxNumber ? _self.taxNumber : taxNumber // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ClientType?,managerName: freezed == managerName ? _self.managerName : managerName // ignore: cast_nullable_to_non_nullable
as String?,commercialRegistryImagePath: freezed == commercialRegistryImagePath ? _self.commercialRegistryImagePath : commercialRegistryImagePath // ignore: cast_nullable_to_non_nullable
as String?,residenceImagePath: freezed == residenceImagePath ? _self.residenceImagePath : residenceImagePath // ignore: cast_nullable_to_non_nullable
as String?,selectedOrderType: null == selectedOrderType ? _self.selectedOrderType : selectedOrderType // ignore: cast_nullable_to_non_nullable
as OrderType,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Client].
extension ClientPatterns on Client {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Client value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Client() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Client value)  $default,){
final _that = this;
switch (_that) {
case _Client():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Client value)?  $default,){
final _that = this;
switch (_that) {
case _Client() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String phone,  String? email,  String? address,  String? taxNumber,  ClientType? type,  String? managerName,  String? commercialRegistryImagePath,  String? residenceImagePath,  OrderType selectedOrderType,  double balance,  bool isActive,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Client() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email,_that.address,_that.taxNumber,_that.type,_that.managerName,_that.commercialRegistryImagePath,_that.residenceImagePath,_that.selectedOrderType,_that.balance,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String phone,  String? email,  String? address,  String? taxNumber,  ClientType? type,  String? managerName,  String? commercialRegistryImagePath,  String? residenceImagePath,  OrderType selectedOrderType,  double balance,  bool isActive,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Client():
return $default(_that.id,_that.name,_that.phone,_that.email,_that.address,_that.taxNumber,_that.type,_that.managerName,_that.commercialRegistryImagePath,_that.residenceImagePath,_that.selectedOrderType,_that.balance,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String phone,  String? email,  String? address,  String? taxNumber,  ClientType? type,  String? managerName,  String? commercialRegistryImagePath,  String? residenceImagePath,  OrderType selectedOrderType,  double balance,  bool isActive,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Client() when $default != null:
return $default(_that.id,_that.name,_that.phone,_that.email,_that.address,_that.taxNumber,_that.type,_that.managerName,_that.commercialRegistryImagePath,_that.residenceImagePath,_that.selectedOrderType,_that.balance,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Client extends Client {
  const _Client({required this.id, required this.name, required this.phone, this.email, this.address, this.taxNumber, this.type, this.managerName, this.commercialRegistryImagePath, this.residenceImagePath, this.selectedOrderType = OrderType.retail, this.balance = 0.0, this.isActive = true, this.createdAt, this.updatedAt}): super._();
  factory _Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

@override final  String id;
@override final  String name;
@override final  String phone;
@override final  String? email;
@override final  String? address;
@override final  String? taxNumber;
@override final  ClientType? type;
@override final  String? managerName;
@override final  String? commercialRegistryImagePath;
@override final  String? residenceImagePath;
@override@JsonKey() final  OrderType selectedOrderType;
@override@JsonKey() final  double balance;
@override@JsonKey() final  bool isActive;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Client
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientCopyWith<_Client> get copyWith => __$ClientCopyWithImpl<_Client>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Client&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.address, address) || other.address == address)&&(identical(other.taxNumber, taxNumber) || other.taxNumber == taxNumber)&&(identical(other.type, type) || other.type == type)&&(identical(other.managerName, managerName) || other.managerName == managerName)&&(identical(other.commercialRegistryImagePath, commercialRegistryImagePath) || other.commercialRegistryImagePath == commercialRegistryImagePath)&&(identical(other.residenceImagePath, residenceImagePath) || other.residenceImagePath == residenceImagePath)&&(identical(other.selectedOrderType, selectedOrderType) || other.selectedOrderType == selectedOrderType)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phone,email,address,taxNumber,type,managerName,commercialRegistryImagePath,residenceImagePath,selectedOrderType,balance,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'Client(id: $id, name: $name, phone: $phone, email: $email, address: $address, taxNumber: $taxNumber, type: $type, managerName: $managerName, commercialRegistryImagePath: $commercialRegistryImagePath, residenceImagePath: $residenceImagePath, selectedOrderType: $selectedOrderType, balance: $balance, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ClientCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$ClientCopyWith(_Client value, $Res Function(_Client) _then) = __$ClientCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String phone, String? email, String? address, String? taxNumber, ClientType? type, String? managerName, String? commercialRegistryImagePath, String? residenceImagePath, OrderType selectedOrderType, double balance, bool isActive, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$ClientCopyWithImpl<$Res>
    implements _$ClientCopyWith<$Res> {
  __$ClientCopyWithImpl(this._self, this._then);

  final _Client _self;
  final $Res Function(_Client) _then;

/// Create a copy of Client
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phone = null,Object? email = freezed,Object? address = freezed,Object? taxNumber = freezed,Object? type = freezed,Object? managerName = freezed,Object? commercialRegistryImagePath = freezed,Object? residenceImagePath = freezed,Object? selectedOrderType = null,Object? balance = null,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Client(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,taxNumber: freezed == taxNumber ? _self.taxNumber : taxNumber // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ClientType?,managerName: freezed == managerName ? _self.managerName : managerName // ignore: cast_nullable_to_non_nullable
as String?,commercialRegistryImagePath: freezed == commercialRegistryImagePath ? _self.commercialRegistryImagePath : commercialRegistryImagePath // ignore: cast_nullable_to_non_nullable
as String?,residenceImagePath: freezed == residenceImagePath ? _self.residenceImagePath : residenceImagePath // ignore: cast_nullable_to_non_nullable
as String?,selectedOrderType: null == selectedOrderType ? _self.selectedOrderType : selectedOrderType // ignore: cast_nullable_to_non_nullable
as OrderType,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
