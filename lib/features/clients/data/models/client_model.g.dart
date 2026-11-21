// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Client _$ClientFromJson(Map<String, dynamic> json) => _Client(
  id: json['id'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String?,
  address: json['address'] as String?,
  taxNumber: json['taxNumber'] as String?,
  type: $enumDecodeNullable(_$ClientTypeEnumMap, json['type']),
  managerName: json['managerName'] as String?,
  commercialRegistryImagePath: json['commercialRegistryImagePath'] as String?,
  residenceImagePath: json['residenceImagePath'] as String?,
  selectedOrderType:
      $enumDecodeNullable(_$OrderTypeEnumMap, json['selectedOrderType']) ??
      OrderType.retail,
  balance: (json['balance'] as num?)?.toDouble() ?? 0.0,
  isActive: json['isActive'] as bool? ?? true,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ClientToJson(_Client instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'email': instance.email,
  'address': instance.address,
  'taxNumber': instance.taxNumber,
  'type': _$ClientTypeEnumMap[instance.type],
  'managerName': instance.managerName,
  'commercialRegistryImagePath': instance.commercialRegistryImagePath,
  'residenceImagePath': instance.residenceImagePath,
  'selectedOrderType': _$OrderTypeEnumMap[instance.selectedOrderType]!,
  'balance': instance.balance,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

const _$ClientTypeEnumMap = {
  ClientType.individual: 'individual',
  ClientType.company: 'company',
};

const _$OrderTypeEnumMap = {
  OrderType.retail: 'retail',
  OrderType.wholesale: 'wholesale',
  OrderType.mall: 'mall',
};
