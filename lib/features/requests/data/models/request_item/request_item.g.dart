// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RequestItem _$RequestItemFromJson(Map<String, dynamic> json) => _RequestItem(
  id: json['id'] as String,
  itemId: json['itemId'] as String,
  name: json['name'] as String,
  barcode: json['barcode'] as String,
  unit: json['unit'] as String,
  price: (json['price'] as num).toDouble(),
  quantity: (json['quantity'] as num).toInt(),
  availableQuantity: (json['availableQuantity'] as num).toInt(),
  total: (json['total'] as num?)?.toDouble() ?? 0,
  description: json['description'] as String?,
  category: json['category'] as String?,
  specialPrice: (json['specialPrice'] as num?)?.toDouble(),
);

Map<String, dynamic> _$RequestItemToJson(_RequestItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'name': instance.name,
      'barcode': instance.barcode,
      'unit': instance.unit,
      'price': instance.price,
      'quantity': instance.quantity,
      'availableQuantity': instance.availableQuantity,
      'total': instance.total,
      'description': instance.description,
      'category': instance.category,
      'specialPrice': instance.specialPrice,
    };
