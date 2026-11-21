// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceModel _$InvoiceModelFromJson(Map<String, dynamic> json) =>
    _InvoiceModel(
      id: json['id'] as String,
      clientId: json['clientId'] as String,
      clientName: json['clientName'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => InvoiceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      paidAmount: (json['paidAmount'] as num).toDouble(),
      remainingAmount: (json['remainingAmount'] as num).toDouble(),
      notes: json['notes'] as String,
      paymentMethod: const PaymentMethodConverter().fromJson(
        json['paymentMethod'] as Map<String, dynamic>,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      status:
          $enumDecodeNullable(_$InvoiceStatusEnumMap, json['status']) ??
          InvoiceStatus.draft,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      invoiceNumber: json['invoiceNumber'] as String?,
      taxAmount: (json['taxAmount'] as num?)?.toDouble(),
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$InvoiceModelToJson(_InvoiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'clientName': instance.clientName,
      'items': instance.items,
      'subtotal': instance.subtotal,
      'totalAmount': instance.totalAmount,
      'paidAmount': instance.paidAmount,
      'remainingAmount': instance.remainingAmount,
      'notes': instance.notes,
      'paymentMethod': const PaymentMethodConverter().toJson(
        instance.paymentMethod,
      ),
      'createdAt': instance.createdAt.toIso8601String(),
      'status': _$InvoiceStatusEnumMap[instance.status]!,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'invoiceNumber': instance.invoiceNumber,
      'taxAmount': instance.taxAmount,
      'discountAmount': instance.discountAmount,
    };

const _$InvoiceStatusEnumMap = {
  InvoiceStatus.draft: 'draft',
  InvoiceStatus.confirmed: 'confirmed',
  InvoiceStatus.paid: 'paid',
  InvoiceStatus.cancelled: 'cancelled',
  InvoiceStatus.partial: 'partial',
};
