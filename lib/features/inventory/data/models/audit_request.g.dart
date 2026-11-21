// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuditRequest _$AuditRequestFromJson(Map<String, dynamic> json) =>
    _AuditRequest(
      items: (json['items'] as List<dynamic>)
          .map((e) => AuditItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
      auditDate: json['auditDate'] == null
          ? null
          : DateTime.parse(json['auditDate'] as String),
    );

Map<String, dynamic> _$AuditRequestToJson(_AuditRequest instance) =>
    <String, dynamic>{
      'items': instance.items,
      'notes': instance.notes,
      'auditDate': instance.auditDate?.toIso8601String(),
    };

_AuditItem _$AuditItemFromJson(Map<String, dynamic> json) => _AuditItem(
  itemId: json['itemId'] as String,
  auditQuantity: (json['auditQuantity'] as num).toDouble(),
);

Map<String, dynamic> _$AuditItemToJson(_AuditItem instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'auditQuantity': instance.auditQuantity,
    };
