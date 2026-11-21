import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/helpers/app_logger.dart';

import '../../data/repo/receipt_repository.dart';
import '../../data/models/receipt_voucher_model/receipt_voucher_model.dart';
import '../../data/models/receipt_enums.dart';
import 'receipt_details_state.dart';

class ReceiptDetailsCubit extends Cubit<ReceiptDetailsState> {
  final ReceiptRepository _repository;

  ReceiptDetailsCubit(this._repository)
      : super(const ReceiptDetailsState.initial());

  final AppLogger _logger = AppLogger();

  Future<void> loadReceiptDetails(String receiptId) async {
    try {
      emit(const ReceiptDetailsState.loading());
      
      final receipt = await _repository.getReceiptById(receiptId);
      
      if (receipt != null) {
        emit(ReceiptDetailsState.loaded(receipt: receipt));
      } else {
        emit(const ReceiptDetailsState.error('سند القبض غير موجود'));
      }
    } catch (e) {
      _logger.error('Error loading receipt details: $e');
      emit(const ReceiptDetailsState.error('فشل في تحميل تفاصيل سند القبض'));
    }
  }

  Future<void> deleteReceipt(String receiptId) async {
    try {
      emit(const ReceiptDetailsState.loading());
      
      await _repository.deleteReceipt(receiptId);
      
      emit(const ReceiptDetailsState.success('تم حذف سند القبض بنجاح'));
    } catch (e) {
      _logger.error('Error deleting receipt: $e');
      emit(const ReceiptDetailsState.error('فشل في حذف سند القبض'));
    }
  }

  Future<void> updateReceiptStatus(ReceiptVoucherModel receipt, 
      {required bool isConfirmed}) async {
    try {
      emit(const ReceiptDetailsState.loading());
      
      final updatedReceipt = receipt.copyWith(
        status: isConfirmed 
            ? ReceiptStatus.confirmed 
            : ReceiptStatus.cancelled,
        updatedAt: DateTime.now(),
      );
      
      await _repository.updateReceipt(updatedReceipt);
      
      emit(ReceiptDetailsState.loaded(receipt: updatedReceipt));
      emit(const ReceiptDetailsState.success('تم تحديث حالة سند القبض'));
    } catch (e) {
      _logger.error('Error updating receipt status: $e');
      emit(const ReceiptDetailsState.error('فشل في تحديث حالة سند القبض'));
      
      // Return to loaded state
      emit(ReceiptDetailsState.loaded(receipt: receipt));
    }
  }

  void printReceipt(ReceiptVoucherModel receipt) {
    // TODO: Implement printing functionality
    _logger.info('Printing receipt: ${receipt.receiptNumber}');
    emit(const ReceiptDetailsState.success('تم إرسال سند القبض للطباعة'));
  }
}
