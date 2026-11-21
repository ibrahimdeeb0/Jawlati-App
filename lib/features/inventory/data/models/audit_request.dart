import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_request.freezed.dart';
part 'audit_request.g.dart';

@freezed
abstract class AuditRequest with _$AuditRequest {
  const factory AuditRequest({
    required List<AuditItem> items,
    String? notes,
    DateTime? auditDate,
  }) = _AuditRequest;

  factory AuditRequest.fromJson(Map<String, dynamic> json) =>
      _$AuditRequestFromJson(json);
}

@freezed
abstract class AuditItem with _$AuditItem {
  const factory AuditItem({
    required String itemId,
    required double auditQuantity,
  }) = _AuditItem;

  factory AuditItem.fromJson(Map<String, dynamic> json) =>
      _$AuditItemFromJson(json);
}