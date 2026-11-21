import 'package:freezed_annotation/freezed_annotation.dart';
import '../request_enums.dart';
import '../request_item/request_item.dart';

part 'load_request.freezed.dart';
part 'load_request.g.dart';

@freezed
abstract class LoadRequest with _$LoadRequest {
  const factory LoadRequest({
    required String id,
    required String requestNumber,
    required DateTime date,
    required RequestStatus status,
    required List<RequestItem> items,
    @Default('') String notes,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? approvedBy,
    DateTime? approvedAt,
    String? rejectionReason,
  }) = _LoadRequest;

  factory LoadRequest.fromJson(Map<String, dynamic> json) =>
      _$LoadRequestFromJson(json);
}
