import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jawlati/core/models/payment_method.dart';
import 'package:jawlati/core/models/payment_method_converter.dart';

import '../enums.dart';
import '../invoice_item/invoice_item.dart';

part 'invoice_model.freezed.dart';
part 'invoice_model.g.dart';

@freezed
abstract class InvoiceModel with _$InvoiceModel {
  const factory InvoiceModel({
    required String id,
    required String clientId,
    required String clientName,
    required List<InvoiceItem> items,
    required double subtotal,
    required double totalAmount,
    required double paidAmount,
    required double remainingAmount,
    required String notes,
    @PaymentMethodConverter() required AppPaymentMethod paymentMethod,
    required DateTime createdAt,
    @Default(InvoiceStatus.draft) InvoiceStatus status,
    DateTime? updatedAt,
    String? invoiceNumber,
    double? taxAmount,
    double? discountAmount,
  }) = _InvoiceModel;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceModelFromJson(json);
}
