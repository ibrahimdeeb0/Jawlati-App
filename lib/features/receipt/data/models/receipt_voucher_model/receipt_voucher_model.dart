import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jawlati/features/clients/data/models/client_model.dart';

import '../receipt_enums.dart';

part 'receipt_voucher_model.freezed.dart';
part 'receipt_voucher_model.g.dart';

@freezed
abstract class ReceiptVoucherModel with _$ReceiptVoucherModel {
  const factory ReceiptVoucherModel({
    required String id,
    required String receiptNumber,
    required Client client,
    required ReceiptType receiptType,
    required double amount,
    required DateTime date,
    String? notes,
    String? chequeNumber,
    String? bankName,
    DateTime? chequeMaturityDate,
    @Default(ReceiptStatus.draft) ReceiptStatus status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ReceiptVoucherModel;

  factory ReceiptVoucherModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptVoucherModelFromJson(json);
}
