// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReturnInvoiceModel _$ReturnInvoiceModelFromJson(Map<String, dynamic> json) =>
    _ReturnInvoiceModel(
      id: json['id'] as String,
      clientId: json['clientId'] as String,
      clientName: json['clientName'] as String,
      originalInvoiceId: json['originalInvoiceId'] as String?,
      originalInvoiceNumber: json['originalInvoiceNumber'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => ReturnInvoiceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      refundAmount: (json['refundAmount'] as num).toDouble(),
      notes: json['notes'] as String,
      returnReason: $enumDecode(_$ReturnReasonEnumMap, json['returnReason']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      status:
          $enumDecodeNullable(_$ReturnInvoiceStatusEnumMap, json['status']) ??
          ReturnInvoiceStatus.draft,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      returnInvoiceNumber: json['returnInvoiceNumber'] as String?,
      taxAmount: (json['taxAmount'] as num?)?.toDouble(),
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      processedBy: json['processedBy'] as String?,
    );

Map<String, dynamic> _$ReturnInvoiceModelToJson(_ReturnInvoiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'clientName': instance.clientName,
      'originalInvoiceId': instance.originalInvoiceId,
      'originalInvoiceNumber': instance.originalInvoiceNumber,
      'items': instance.items,
      'subtotal': instance.subtotal,
      'totalAmount': instance.totalAmount,
      'refundAmount': instance.refundAmount,
      'notes': instance.notes,
      'returnReason': _$ReturnReasonEnumMap[instance.returnReason]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': _$ReturnInvoiceStatusEnumMap[instance.status]!,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'returnInvoiceNumber': instance.returnInvoiceNumber,
      'taxAmount': instance.taxAmount,
      'discountAmount': instance.discountAmount,
      'processedBy': instance.processedBy,
    };

const _$ReturnReasonEnumMap = {
  ReturnReason.damaged: 'damaged',
  ReturnReason.expired: 'expired',
  ReturnReason.wrongItem: 'wrongItem',
  ReturnReason.customerRequest: 'customerRequest',
  ReturnReason.qualityIssue: 'qualityIssue',
  ReturnReason.overstock: 'overstock',
  ReturnReason.other: 'other',
};

const _$ReturnInvoiceStatusEnumMap = {
  ReturnInvoiceStatus.draft: 'draft',
  ReturnInvoiceStatus.confirmed: 'confirmed',
  ReturnInvoiceStatus.processed: 'processed',
  ReturnInvoiceStatus.cancelled: 'cancelled',
};
