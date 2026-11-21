import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/enums.dart';
import '../../data/model/return_invoice_model/return_invoice_model.dart';

part 'view_return_invoices_state.freezed.dart';

@freezed
class ViewReturnInvoicesState with _$ViewReturnInvoicesState {
  const factory ViewReturnInvoicesState.initial() = _Initial;

  const factory ViewReturnInvoicesState.loading() = _Loading;

  const factory ViewReturnInvoicesState.loaded({
    required List<ReturnInvoiceModel> returnInvoices,
    List<ReturnInvoiceModel>? filteredInvoices,
    required String searchQuery,
    required ReturnInvoiceFilter selectedFilter,
    required ReturnInvoiceSortBy sortBy,
    required bool isAscending,
  }) = _Loaded;

  const factory ViewReturnInvoicesState.error(String message) = _Error;
}
