// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_invoice_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReturnInvoiceItem _$ReturnInvoiceItemFromJson(Map<String, dynamic> json) =>
    _ReturnInvoiceItem(
      itemId: json['itemId'] as String,
      name: json['name'] as String,
      unit: json['unit'] as String,
      originalPrice: (json['originalPrice'] as num).toDouble(),
      returnedQuantity: (json['returnedQuantity'] as num).toInt(),
      originalQuantity: (json['originalQuantity'] as num).toInt(),
      returnReason: json['returnReason'] as String?,
      notes: json['notes'] as String?,
      isDamaged: json['isDamaged'] as bool? ?? false,
      expiryDate: json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
    );

Map<String, dynamic> _$ReturnInvoiceItemToJson(_ReturnInvoiceItem instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'name': instance.name,
      'unit': instance.unit,
      'originalPrice': instance.originalPrice,
      'returnedQuantity': instance.returnedQuantity,
      'originalQuantity': instance.originalQuantity,
      'returnReason': instance.returnReason,
      'notes': instance.notes,
      'isDamaged': instance.isDamaged,
      'expiryDate': instance.expiryDate?.toIso8601String(),
    };
