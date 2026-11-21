import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/helpers/app_logger.dart';

import '../../data/model/enums.dart';
import '../../data/model/invoice/invoice_model.dart';
import '../../data/repo/invoice_repository.dart';
import 'invoices_view_state.dart';

class InvoicesViewCubit extends Cubit<InvoicesViewState> {
  final InvoiceRepository _repository;
  final AppLogger _logger = AppLogger();

  InvoicesViewCubit(this._repository)
      : super(const InvoicesViewState.initial()) {
    loadInvoices();
  }

  List<InvoiceModel> _allInvoices = [];
  String _currentSearchQuery = '';
  InvoiceFilter _currentFilter = InvoiceFilter.all;
  InvoiceSortBy _currentSortBy = InvoiceSortBy.date;

  Future<void> loadInvoices() async {
    try {
      emit(const InvoicesViewState.loading());
      _logger.info('Loading invoices...');

      final invoices = await _repository.getInvoices();
      _allInvoices = invoices;

      _logger.info('Loaded ${invoices.length} invoices');
      _emitLoadedState();
    } catch (e) {
      _logger.error('Failed to load invoices: $e');
      emit(InvoicesViewState.error('فشل في تحميل الفواتير: ${e.toString()}'));
    }
  }

  Future<void> refreshInvoices() async {
    await loadInvoices();
  }

  void searchInvoices(String query) {
    _currentSearchQuery = query;
    _emitLoadedState();
    _logger.info('Searching invoices with query: "$query"');
  }

  void filterInvoices(InvoiceFilter filter) {
    _currentFilter = filter;
    _emitLoadedState();
    _logger.info('Filtering invoices by: $filter');
  }

  void sortInvoices(InvoiceSortBy sortBy) {
    _currentSortBy = sortBy;
    _emitLoadedState();
    _logger.info('Sorting invoices by: $sortBy');
  }

  void _emitLoadedState() {
    final filteredInvoices = _getFilteredAndSortedInvoices();

    emit(InvoicesViewState.loaded(
      invoices: List.from(_allInvoices),
      filteredInvoices: filteredInvoices,
      searchQuery: _currentSearchQuery,
      selectedFilter: _currentFilter,
      sortBy: _currentSortBy,
    ));
  }

  List<InvoiceModel> _getFilteredAndSortedInvoices() {
    var invoices = List<InvoiceModel>.from(_allInvoices);

    // Apply search filter
    if (_currentSearchQuery.isNotEmpty) {
      invoices = invoices.where((invoice) {
        return invoice.clientName
                .toLowerCase()
                .contains(_currentSearchQuery.toLowerCase()) ||
            invoice.invoiceNumber
                    ?.toLowerCase()
                    .contains(_currentSearchQuery.toLowerCase()) ==
                true ||
            invoice.id.contains(_currentSearchQuery);
      }).toList();
    }

    // Apply status filter
    switch (_currentFilter) {
      case InvoiceFilter.all:
        // No additional filtering
        break;
    }

    // Apply sorting
    switch (_currentSortBy) {
      case InvoiceSortBy.date:
        invoices.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case InvoiceSortBy.amount:
        invoices.sort((a, b) => b.totalAmount.compareTo(a.totalAmount));
        break;
      case InvoiceSortBy.client:
        invoices.sort((a, b) => a.clientName.compareTo(b.clientName));
        break;
    }

    return invoices;
  }

  Future<void> deleteInvoice(String invoiceId) async {
    try {
      _logger.info('Deleting invoice: $invoiceId');

      // Remove from local list
      _allInvoices.removeWhere((invoice) => invoice.id == invoiceId);

      // Here you would call repository method to delete from database
      // await _repository.deleteInvoice(invoiceId);

      _emitLoadedState();
      _logger.info('Invoice deleted successfully');
    } catch (e) {
      _logger.error('Failed to delete invoice: $e');
      emit(InvoicesViewState.error('فشل في حذف الفاتورة: ${e.toString()}'));

      // Reload invoices to restore state
      await loadInvoices();
    }
  }

  // Getters for UI
  double get totalAmount =>
      _allInvoices.fold(0, (sum, invoice) => sum + invoice.totalAmount);
  int get totalInvoicesCount => _allInvoices.length;
  int get totalItemsCount => 
      _allInvoices.fold(0, (sum, invoice) => sum + invoice.items.length);

  @override
  Future<void> close() {
    _logger.info('InvoicesViewCubit closed');
    return super.close();
  }
}
