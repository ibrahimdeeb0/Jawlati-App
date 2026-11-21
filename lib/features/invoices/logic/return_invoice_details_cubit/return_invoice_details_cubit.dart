import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/return_invoice_repository.dart';
import 'return_invoice_details_state.dart';

class ReturnInvoiceDetailsCubit extends Cubit<ReturnInvoiceDetailsState> {
  final ReturnInvoiceRepository _repository;
  String? _currentInvoiceId;

  ReturnInvoiceDetailsCubit(this._repository)
      : super(const ReturnInvoiceDetailsState.initial());

  Future<void> loadReturnInvoiceDetails(String invoiceId) async {
    try {
      _currentInvoiceId = invoiceId;
      emit(const ReturnInvoiceDetailsState.loading());

      final returnInvoice = await _repository.getReturnInvoiceById(invoiceId);

      if (returnInvoice != null) {
        emit(ReturnInvoiceDetailsState.loaded(returnInvoice: returnInvoice));
      } else {
        emit(const ReturnInvoiceDetailsState.error(
            'لم يتم العثور على فاتورة المرتجع'));
      }
    } catch (e) {
      emit(ReturnInvoiceDetailsState.error(
          'خطأ في تحميل تفاصيل فاتورة المرتجع: ${e.toString()}'));
    }
  }

  Future<void> refreshReturnInvoice() async {
    if (_currentInvoiceId != null) {
      await loadReturnInvoiceDetails(_currentInvoiceId!);
    }
  }

  Future<void> updateReturnInvoiceStatus(String newStatus) async {
    try {
      state.maybeWhen(
        loaded: (returnInvoice) async {
          emit(const ReturnInvoiceDetailsState.loading());

          // Here you would typically call an API to update the status
          // For now, we'll simulate the update
          await Future.delayed(const Duration(seconds: 1));

          // Reload the invoice after status update
          await refreshReturnInvoice();
        },
        orElse: () {},
      );
    } catch (e) {
      emit(ReturnInvoiceDetailsState.error(
          'خطأ في تحديث حالة فاتورة المرتجع: ${e.toString()}'));
    }
  }

  Future<void> deleteReturnInvoice() async {
    try {
      if (_currentInvoiceId != null) {
        await _repository.deleteReturnInvoice(_currentInvoiceId!);
      }
    } catch (e) {
      emit(ReturnInvoiceDetailsState.error(
          'خطأ في حذف فاتورة المرتجع: ${e.toString()}'));
    }
  }
}
