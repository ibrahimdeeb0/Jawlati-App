// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InventoryItem _$InventoryItemFromJson(Map<String, dynamic> json) =>
    _InventoryItem(
      id: json['id'] as String,
      name: json['name'] as String,
      unit: json['unit'] as String,
      systemQuantity: (json['systemQuantity'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      auditQuantity: (json['auditQuantity'] as num?)?.toDouble() ?? 0.0,
      barcode: json['barcode'] as String?,
      description: json['description'] as String?,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$InventoryItemToJson(_InventoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unit': instance.unit,
      'systemQuantity': instance.systemQuantity,
      'price': instance.price,
      'auditQuantity': instance.auditQuantity,
      'barcode': instance.barcode,
      'description': instance.description,
      'isActive': instance.isActive,
    };
