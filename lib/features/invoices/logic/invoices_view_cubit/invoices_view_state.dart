import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/enums.dart';
import '../../data/model/invoice/invoice_model.dart';

part 'invoices_view_state.freezed.dart';

@freezed
class InvoicesViewState with _$InvoicesViewState {
  const factory InvoicesViewState.initial() = _Initial;

  const factory InvoicesViewState.loading() = _Loading;

  const factory InvoicesViewState.loaded({
    required List<InvoiceModel> invoices,
    List<InvoiceModel>? filteredInvoices,
    @Default('') String searchQuery,
    @Default(InvoiceFilter.all) InvoiceFilter selectedFilter,
    @Default(InvoiceSortBy.date) InvoiceSortBy sortBy,
  }) = _Loaded;

  const factory InvoicesViewState.error(String message) = _Error;
}
