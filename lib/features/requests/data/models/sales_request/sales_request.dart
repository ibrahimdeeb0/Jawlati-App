import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jawlati/features/clients/data/models/client_model.dart';
import '../request_enums.dart';
import '../request_item/request_item.dart';

part 'sales_request.freezed.dart';
part 'sales_request.g.dart';

@freezed
abstract class SalesRequest with _$SalesRequest {
  const factory SalesRequest({
    required String id,
    required String requestNumber,
    required DateTime date,
    required RequestStatus status,
    required Client client,
    required List<RequestItem> items,
    required double subtotal,
    required double discount,
    required double totalAmount,
    @Default('') String notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? approvedBy,
    DateTime? approvedAt,
    String? rejectionReason,
  }) = _SalesRequest;

  factory SalesRequest.fromJson(Map<String, dynamic> json) =>
      _$SalesRequestFromJson(json);
}
