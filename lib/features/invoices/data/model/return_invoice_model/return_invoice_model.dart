import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums.dart';
import '../return_invoice_item/return_invoice_item.dart';

part 'return_invoice_model.freezed.dart';
part 'return_invoice_model.g.dart';

@freezed
abstract class ReturnInvoiceModel with _$ReturnInvoiceModel {
  const factory ReturnInvoiceModel({
    required String id,
    required String clientId,
    required String clientName,
    String? originalInvoiceId, // الفاتورة الأصلية
    String? originalInvoiceNumber,
    required List<ReturnInvoiceItem> items,
    required double subtotal,
    required double totalAmount,
    required double refundAmount, // المبلغ المسترد
    required String notes,
    required ReturnReason returnReason,
    required DateTime createdAt,
    @Default(ReturnInvoiceStatus.draft) ReturnInvoiceStatus status,
    DateTime? updatedAt,
    String? returnInvoiceNumber,
    double? taxAmount,
    double? discountAmount,
    String? processedBy, // من تولى المعالجة
  }) = _ReturnInvoiceModel;

  factory ReturnInvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnInvoiceModelFromJson(json);
}
