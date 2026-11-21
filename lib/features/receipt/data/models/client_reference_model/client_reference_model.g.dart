// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_reference_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientReference _$ClientReferenceFromJson(Map<String, dynamic> json) =>
    _ClientReference(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      address: json['address'] as String?,
      balance: (json['balance'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$ClientReferenceToJson(_ClientReference instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'balance': instance.balance,
    };
