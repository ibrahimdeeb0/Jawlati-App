// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_visit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientVisit _$ClientVisitFromJson(Map<String, dynamic> json) => _ClientVisit(
  id: json['id'] as String,
  clientId: json['clientId'] as String,
  clientName: json['clientName'] as String?,
  salesmanId: json['salesmanId'] as String,
  salesmanName: json['salesmanName'] as String?,
  checkInTime: DateTime.parse(json['checkInTime'] as String),
  checkOutTime: json['checkOutTime'] == null
      ? null
      : DateTime.parse(json['checkOutTime'] as String),
  checkInLatitude: (json['checkInLatitude'] as num).toDouble(),
  checkInLongitude: (json['checkInLongitude'] as num).toDouble(),
  checkOutLatitude: (json['checkOutLatitude'] as num?)?.toDouble(),
  checkOutLongitude: (json['checkOutLongitude'] as num?)?.toDouble(),
  checkInAddress: json['checkInAddress'] as String?,
  checkOutAddress: json['checkOutAddress'] as String?,
  notes: json['notes'] as String?,
  status:
      $enumDecodeNullable(_$VisitStatusEnumMap, json['status']) ??
      VisitStatus.checkedIn,
  purpose: json['purpose'] as String?,
  attachments: (json['attachments'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ClientVisitToJson(_ClientVisit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'clientName': instance.clientName,
      'salesmanId': instance.salesmanId,
      'salesmanName': instance.salesmanName,
      'checkInTime': instance.checkInTime.toIso8601String(),
      'checkOutTime': instance.checkOutTime?.toIso8601String(),
      'checkInLatitude': instance.checkInLatitude,
      'checkInLongitude': instance.checkInLongitude,
      'checkOutLatitude': instance.checkOutLatitude,
      'checkOutLongitude': instance.checkOutLongitude,
      'checkInAddress': instance.checkInAddress,
      'checkOutAddress': instance.checkOutAddress,
      'notes': instance.notes,
      'status': _$VisitStatusEnumMap[instance.status]!,
      'purpose': instance.purpose,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$VisitStatusEnumMap = {
  VisitStatus.checkedIn: 'checkedIn',
  VisitStatus.checkedOut: 'checkedOut',
  VisitStatus.cancelled: 'cancelled',
};
