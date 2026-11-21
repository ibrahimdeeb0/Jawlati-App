// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_voucher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReceiptVoucherModel _$ReceiptVoucherModelFromJson(Map<String, dynamic> json) =>
    _ReceiptVoucherModel(
      id: json['id'] as String,
      receiptNumber: json['receiptNumber'] as String,
      client: Client.fromJson(json['client'] as Map<String, dynamic>),
      receiptType: $enumDecode(_$ReceiptTypeEnumMap, json['receiptType']),
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      notes: json['notes'] as String?,
      chequeNumber: json['chequeNumber'] as String?,
      bankName: json['bankName'] as String?,
      chequeMaturityDate: json['chequeMaturityDate'] == null
          ? null
          : DateTime.parse(json['chequeMaturityDate'] as String),
      status:
          $enumDecodeNullable(_$ReceiptStatusEnumMap, json['status']) ??
          ReceiptStatus.draft,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ReceiptVoucherModelToJson(
  _ReceiptVoucherModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'receiptNumber': instance.receiptNumber,
  'client': instance.client,
  'receiptType': _$ReceiptTypeEnumMap[instance.receiptType]!,
  'amount': instance.amount,
  'date': instance.date.toIso8601String(),
  'notes': instance.notes,
  'chequeNumber': instance.chequeNumber,
  'bankName': instance.bankName,
  'chequeMaturityDate': instance.chequeMaturityDate?.toIso8601String(),
  'status': _$ReceiptStatusEnumMap[instance.status]!,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

const _$ReceiptTypeEnumMap = {
  ReceiptType.cash: 'cash',
  ReceiptType.cheque: 'cheque',
  ReceiptType.bankTransfer: 'bankTransfer',
  ReceiptType.creditCard: 'creditCard',
  ReceiptType.other: 'other',
};

const _$ReceiptStatusEnumMap = {
  ReceiptStatus.draft: 'draft',
  ReceiptStatus.confirmed: 'confirmed',
  ReceiptStatus.cancelled: 'cancelled',
};
