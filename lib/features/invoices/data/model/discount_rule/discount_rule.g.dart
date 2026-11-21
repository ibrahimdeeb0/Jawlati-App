// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiscountRule _$DiscountRuleFromJson(Map<String, dynamic> json) =>
    _DiscountRule(
      discountType: json['discountType'] as String,
      itemNo: json['itemNo'] as String,
      description: json['description'] as String,
      itemNoNewPrice: (json['itemNoNewPrice'] as num?)?.toDouble(),
      itemNoMinQty: (json['itemNoMinQty'] as num?)?.toInt(),
      itemNo2ndItemNo: json['itemNo2ndItemNo'] as String?,
      itemNo2ndQty: (json['itemNo2ndQty'] as num?)?.toInt(),
      linkedItemNo: json['linkedItemNo'] as String?,
      linkedItemNewPrice: (json['linkedItemNewPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DiscountRuleToJson(_DiscountRule instance) =>
    <String, dynamic>{
      'discountType': instance.discountType,
      'itemNo': instance.itemNo,
      'description': instance.description,
      'itemNoNewPrice': instance.itemNoNewPrice,
      'itemNoMinQty': instance.itemNoMinQty,
      'itemNo2ndItemNo': instance.itemNo2ndItemNo,
      'itemNo2ndQty': instance.itemNo2ndQty,
      'linkedItemNo': instance.linkedItemNo,
      'linkedItemNewPrice': instance.linkedItemNewPrice,
    };
