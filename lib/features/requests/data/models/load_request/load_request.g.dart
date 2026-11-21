// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoadRequest _$LoadRequestFromJson(Map<String, dynamic> json) => _LoadRequest(
  id: json['id'] as String,
  requestNumber: json['requestNumber'] as String,
  date: DateTime.parse(json['date'] as String),
  status: $enumDecode(_$RequestStatusEnumMap, json['status']),
  items: (json['items'] as List<dynamic>)
      .map((e) => RequestItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  notes: json['notes'] as String? ?? '',
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  approvedBy: json['approvedBy'] as String?,
  approvedAt: json['approvedAt'] == null
      ? null
      : DateTime.parse(json['approvedAt'] as String),
  rejectionReason: json['rejectionReason'] as String?,
);

Map<String, dynamic> _$LoadRequestToJson(_LoadRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requestNumber': instance.requestNumber,
      'date': instance.date.toIso8601String(),
      'status': _$RequestStatusEnumMap[instance.status]!,
      'items': instance.items,
      'notes': instance.notes,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'approvedBy': instance.approvedBy,
      'approvedAt': instance.approvedAt?.toIso8601String(),
      'rejectionReason': instance.rejectionReason,
    };

const _$RequestStatusEnumMap = {
  RequestStatus.pending: 'pending',
  RequestStatus.approved: 'approved',
  RequestStatus.rejected: 'rejected',
  RequestStatus.delivered: 'delivered',
};
