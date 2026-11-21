import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/helpers/app_logger.dart';

import '../../data/repo/receipt_repository.dart';
import '../../data/models/receipt_voucher_model/receipt_voucher_model.dart';
import '../../data/models/receipt_enums.dart';
import 'view_receipts_state.dart';

class ViewReceiptsCubit extends Cubit<ViewReceiptsState> {
  final ReceiptRepository _repository;

  ViewReceiptsCubit(this._repository)
      : super(const ViewReceiptsState.initial()) {
    loadReceipts();
  }

  final AppLogger _logger = AppLogger();
  List<ReceiptVoucherModel> _allReceipts = [];

  Future<void> loadReceipts() async {
    try {
      emit(const ViewReceiptsState.loading());
      
      _allReceipts = await _repository.getReceipts();
      
      emit(ViewReceiptsState.loaded(
        receipts: _allReceipts,
        filteredReceipts: _allReceipts,
        totalAmount: _calculateTotalAmount(_allReceipts),
        totalCount: _allReceipts.length,
      ));
    } catch (e) {
      _logger.error('Error loading receipts: $e');
      emit(const ViewReceiptsState.error('فشل في تحميل سندات القبض'));
    }
  }

  void applyFilter(ReceiptFilter filter) {
    final currentState = state;
    if (currentState is! Loaded) return;

    List<ReceiptVoucherModel> filtered;
    
    switch (filter) {
      case ReceiptFilter.all:
        filtered = _allReceipts;
        break;
      case ReceiptFilter.confirmed:
        filtered = _allReceipts
            .where((receipt) => receipt.status == ReceiptStatus.confirmed)
            .toList();
        break;
      case ReceiptFilter.draft:
        filtered = _allReceipts
            .where((receipt) => receipt.status == ReceiptStatus.draft)
            .toList();
        break;
      case ReceiptFilter.cancelled:
        filtered = _allReceipts
            .where((receipt) => receipt.status == ReceiptStatus.cancelled)
            .toList();
        break;
    }

    // Apply current search query if exists
    if (currentState.searchQuery.isNotEmpty) {
      filtered = _applySearchFilter(filtered, currentState.searchQuery);
    }

    // Apply current sort
    filtered = _applySorting(filtered, currentState.selectedSort);

    emit(currentState.copyWith(
      filteredReceipts: filtered,
      selectedFilter: filter,
      totalAmount: _calculateTotalAmount(filtered),
      totalCount: filtered.length,
    ));
  }

  void applySorting(ReceiptSortBy sortBy) {
    final currentState = state;
    if (currentState is! Loaded) return;

    final sorted = _applySorting(currentState.filteredReceipts, sortBy);

    emit(currentState.copyWith(
      filteredReceipts: sorted,
      selectedSort: sortBy,
    ));
  }

  void searchReceipts(String query) {
    final currentState = state;
    if (currentState is! Loaded) return;

    List<ReceiptVoucherModel> filtered = _allReceipts;
    
    // Apply current filter
    if (currentState.selectedFilter != ReceiptFilter.all) {
      filtered = _applyStatusFilter(filtered, currentState.selectedFilter);
    }

    // Apply search
    if (query.isNotEmpty) {
      filtered = _applySearchFilter(filtered, query);
    }

    // Apply current sort
    filtered = _applySorting(filtered, currentState.selectedSort);

    emit(currentState.copyWith(
      filteredReceipts: filtered,
      searchQuery: query,
      totalAmount: _calculateTotalAmount(filtered),
      totalCount: filtered.length,
    ));
  }

  List<ReceiptVoucherModel> _applyStatusFilter(
      List<ReceiptVoucherModel> receipts, ReceiptFilter filter) {
    switch (filter) {
      case ReceiptFilter.all:
        return receipts;
      case ReceiptFilter.confirmed:
        return receipts
            .where((receipt) => receipt.status == ReceiptStatus.confirmed)
            .toList();
      case ReceiptFilter.draft:
        return receipts
            .where((receipt) => receipt.status == ReceiptStatus.draft)
            .toList();
      case ReceiptFilter.cancelled:
        return receipts
            .where((receipt) => receipt.status == ReceiptStatus.cancelled)
            .toList();
    }
  }

  List<ReceiptVoucherModel> _applySearchFilter(
      List<ReceiptVoucherModel> receipts, String query) {
    return receipts
        .where((receipt) =>
            receipt.client.name.toLowerCase().contains(query.toLowerCase()) ||
            receipt.receiptNumber.toLowerCase().contains(query.toLowerCase()) ||
            receipt.client.phone.contains(query))
        .toList();
  }

  List<ReceiptVoucherModel> _applySorting(
      List<ReceiptVoucherModel> receipts, ReceiptSortBy sortBy) {
    final sorted = List<ReceiptVoucherModel>.from(receipts);
    
    switch (sortBy) {
      case ReceiptSortBy.date:
        sorted.sort((a, b) => b.date.compareTo(a.date));
        break;
      case ReceiptSortBy.amount:
        sorted.sort((a, b) => b.amount.compareTo(a.amount));
        break;
      case ReceiptSortBy.client:
        sorted.sort((a, b) => a.client.name.compareTo(b.client.name));
        break;
    }
    
    return sorted;
  }

  double _calculateTotalAmount(List<ReceiptVoucherModel> receipts) {
    return receipts.fold(0.0, (sum, receipt) => sum + receipt.amount);
  }

  Future<void> refreshReceipts() async {
    await loadReceipts();
  }

  Future<void> deleteReceipt(String receiptId) async {
    try {      
      await _repository.deleteReceipt(receiptId);
      
      // Remove from local list
      _allReceipts.removeWhere((receipt) => receipt.id == receiptId);
      
      // Refresh the view
      final currentState = state;
      if (currentState is Loaded) {
        searchReceipts(currentState.searchQuery);
      }
      
    } catch (e) {
      _logger.error('Error deleting receipt: $e');
      emit(const ViewReceiptsState.error('فشل في حذف سند القبض'));
    }
  }
}
