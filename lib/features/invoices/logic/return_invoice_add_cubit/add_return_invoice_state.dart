import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/return_invoice_item/return_invoice_item.dart';
import '../../data/model/invoice/invoice_model.dart';
import '../../data/model/enums.dart';

part 'add_return_invoice_state.freezed.dart';

@freezed
class AddReturnInvoiceState with _$AddReturnInvoiceState {
  const factory AddReturnInvoiceState.initial() = _Initial;

  const factory AddReturnInvoiceState.loading() = _Loading;

  const factory AddReturnInvoiceState.loaded({
    required String currentTime,
    required String currentDate,
    required List<ReturnInvoiceItem> returnItems,
    required double subtotal,
    required double totalAmount,
    required double refundAmount,
    required String notes,
    InvoiceModel? selectedOriginalInvoice,
    required List<InvoiceModel> availableInvoices,
    required List<InvoiceModel> filteredInvoices,
    required ReturnReason returnReason,
    required ReturnInvoiceStatus status,
  }) = _Loaded;

  const factory AddReturnInvoiceState.error(String message) = _Error;
}
