import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jawlati/core/models/payment_method.dart';
import 'package:jawlati/features/clients/data/models/client_model.dart';

import '../../data/model/invoice_item/invoice_item.dart';
import '../../data/model/item/item_model.dart';

part 'invoice_state.freezed.dart';

@freezed
class InvoiceState<T> with _$InvoiceState<T> {
  const factory InvoiceState.initial() = _Initial;

  const factory InvoiceState.loading() = _Loading;

  const factory InvoiceState.loaded({
    required String currentTime,
    required String currentDate,
    required List<InvoiceItem> invoiceItems,
    required double subtotal,
    required double totalAmount,
    required double paidAmount,
    required double remainingAmount,
    required String notes,
    Client? selectedClient,
    List<ItemModel>? filteredItems,
    List<Client>? filteredClients,
    AppPaymentMethod? selectedPaymentMethod,
    @Default([]) List<AppPaymentMethod> availableMethods,
  }) = Loaded;

  const factory InvoiceState.error(String message) = _Error;
}
