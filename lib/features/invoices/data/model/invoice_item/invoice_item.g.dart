// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceItem _$InvoiceItemFromJson(Map<String, dynamic> json) => _InvoiceItem(
  itemId: json['itemId'] as String,
  name: json['name'] as String,
  unit: json['unit'] as String,
  price: (json['price'] as num).toDouble(),
  quantity: (json['quantity'] as num).toInt(),
  stockQuantity: (json['stockQuantity'] as num).toInt(),
  notes: json['notes'] as String?,
  discount: (json['discount'] as num?)?.toDouble(),
  quantityOfBonus: (json['quantityOfBonus'] as num?)?.toInt() ?? 0,
  originalPrice: (json['originalPrice'] as num?)?.toDouble(),
  discountAmount: (json['discountAmount'] as num?)?.toDouble(),
  discountDescription: json['discountDescription'] as String?,
  appliedDiscountType: json['appliedDiscountType'] as String?,
  isDiscountApplied: json['isDiscountApplied'] as bool?,
);

Map<String, dynamic> _$InvoiceItemToJson(_InvoiceItem instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'name': instance.name,
      'unit': instance.unit,
      'price': instance.price,
      'quantity': instance.quantity,
      'stockQuantity': instance.stockQuantity,
      'notes': instance.notes,
      'discount': instance.discount,
      'quantityOfBonus': instance.quantityOfBonus,
      'originalPrice': instance.originalPrice,
      'discountAmount': instance.discountAmount,
      'discountDescription': instance.discountDescription,
      'appliedDiscountType': instance.appliedDiscountType,
      'isDiscountApplied': instance.isDiscountApplied,
    };
