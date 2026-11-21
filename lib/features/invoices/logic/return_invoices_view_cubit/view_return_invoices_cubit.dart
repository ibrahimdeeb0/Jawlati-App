import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/enums.dart';
import '../../data/model/return_invoice_model/return_invoice_model.dart';
import '../../data/repo/return_invoice_repository.dart';
import 'view_return_invoices_state.dart';

class ViewReturnInvoicesCubit extends Cubit<ViewReturnInvoicesState> {
  final ReturnInvoiceRepository _repository;
  
  ViewReturnInvoicesCubit(this._repository) 
      : super(const ViewReturnInvoicesState.initial()) {
    loadReturnInvoices();
  }

  Future<void> loadReturnInvoices() async {
    try {
      emit(const ViewReturnInvoicesState.loading());
      
      final returnInvoices = await _repository.getReturnInvoices();
      
      emit(ViewReturnInvoicesState.loaded(
        returnInvoices: returnInvoices,
        filteredInvoices: returnInvoices,
        searchQuery: '',
        selectedFilter: ReturnInvoiceFilter.all,
        sortBy: ReturnInvoiceSortBy.date,
        isAscending: false, // الأحدث أولاً
      ));
    } catch (e) {
      emit(ViewReturnInvoicesState.error('خطأ في تحميل فواتير المرتجع: ${e.toString()}'));
    }
  }

  void searchReturnInvoices(String query) {
    state.maybeWhen(
      loaded: (returnInvoices, _, __, selectedFilter, sortBy, isAscending) {
        List<ReturnInvoiceModel> filtered = returnInvoices;
        
        // تطبيق البحث
        if (query.isNotEmpty) {
          filtered = returnInvoices.where((invoice) {
            return invoice.clientName.toLowerCase().contains(query.toLowerCase()) ||
                   invoice.returnInvoiceNumber?.toLowerCase().contains(query.toLowerCase()) == true ||
                   invoice.originalInvoiceNumber?.toLowerCase().contains(query.toLowerCase()) == true;
          }).toList();
        }
        
        // تطبيق الفلتر
        filtered = _applyFilter(filtered, selectedFilter);
        
        // تطبيق الترتيب
        filtered = _applySorting(filtered, sortBy, isAscending);
        
        emit(ViewReturnInvoicesState.loaded(
          returnInvoices: returnInvoices,
          filteredInvoices: filtered,
          searchQuery: query,
          selectedFilter: selectedFilter,
          sortBy: sortBy,
          isAscending: isAscending,
        ));
      },
      orElse: () {},
    );
  }

  void filterReturnInvoices(ReturnInvoiceFilter filter) {
    state.maybeWhen(
      loaded: (returnInvoices, _, searchQuery, __, sortBy, isAscending) {
        List<ReturnInvoiceModel> filtered = returnInvoices;
        
        // تطبيق البحث أولاً
        if (searchQuery.isNotEmpty) {
          filtered = returnInvoices.where((invoice) {
            return invoice.clientName.toLowerCase().contains(searchQuery.toLowerCase()) ||
                   invoice.returnInvoiceNumber?.toLowerCase().contains(searchQuery.toLowerCase()) == true ||
                   invoice.originalInvoiceNumber?.toLowerCase().contains(searchQuery.toLowerCase()) == true;
          }).toList();
        }
        
        // تطبيق الفلتر
        filtered = _applyFilter(filtered, filter);
        
        // تطبيق الترتيب
        filtered = _applySorting(filtered, sortBy, isAscending);
        
        emit(ViewReturnInvoicesState.loaded(
          returnInvoices: returnInvoices,
          filteredInvoices: filtered,
          searchQuery: searchQuery,
          selectedFilter: filter,
          sortBy: sortBy,
          isAscending: isAscending,
        ));
      },
      orElse: () {},
    );
  }

  void sortReturnInvoices(ReturnInvoiceSortBy sortBy, {bool? isAscending}) {
    state.maybeWhen(
      loaded: (returnInvoices, filteredInvoices, searchQuery, selectedFilter, currentSortBy, currentIsAscending) {
        final newIsAscending = isAscending ?? (sortBy == currentSortBy ? !currentIsAscending : false);
        final filtered = _applySorting(filteredInvoices ?? returnInvoices, sortBy, newIsAscending);
        
        emit(ViewReturnInvoicesState.loaded(
          returnInvoices: returnInvoices,
          filteredInvoices: filtered,
          searchQuery: searchQuery,
          selectedFilter: selectedFilter,
          sortBy: sortBy,
          isAscending: newIsAscending,
        ));
      },
      orElse: () {},
    );
  }

  Future<void> deleteReturnInvoice(String invoiceId) async {
    try {
      await _repository.deleteReturnInvoice(invoiceId);
      await refreshReturnInvoices();
    } catch (e) {
      emit(ViewReturnInvoicesState.error('خطأ في حذف فاتورة المرتجع: ${e.toString()}'));
    }
  }

  Future<void> refreshReturnInvoices() async {
    await loadReturnInvoices();
  }

  List<ReturnInvoiceModel> _applyFilter(List<ReturnInvoiceModel> invoices, ReturnInvoiceFilter filter) {
    switch (filter) {
      case ReturnInvoiceFilter.all:
        return invoices;
      case ReturnInvoiceFilter.processed:
        return invoices.where((invoice) => invoice.status == ReturnInvoiceStatus.processed).toList();
      case ReturnInvoiceFilter.pending:
        return invoices.where((invoice) => 
          invoice.status == ReturnInvoiceStatus.draft || 
          invoice.status == ReturnInvoiceStatus.confirmed
        ).toList();
      case ReturnInvoiceFilter.cancelled:
        return invoices.where((invoice) => invoice.status == ReturnInvoiceStatus.cancelled).toList();
    }
  }

  List<ReturnInvoiceModel> _applySorting(List<ReturnInvoiceModel> invoices, ReturnInvoiceSortBy sortBy, bool isAscending) {
    final sortedList = List<ReturnInvoiceModel>.from(invoices);
    
    switch (sortBy) {
      case ReturnInvoiceSortBy.date:
        sortedList.sort((a, b) => isAscending 
            ? a.createdAt.compareTo(b.createdAt)
            : b.createdAt.compareTo(a.createdAt));
        break;
      case ReturnInvoiceSortBy.amount:
        sortedList.sort((a, b) => isAscending 
            ? a.refundAmount.compareTo(b.refundAmount)
            : b.refundAmount.compareTo(a.refundAmount));
        break;
      case ReturnInvoiceSortBy.client:
        sortedList.sort((a, b) => isAscending 
            ? a.clientName.compareTo(b.clientName)
            : b.clientName.compareTo(a.clientName));
        break;
    }
    
    return sortedList;
  }
}