import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/helpers/app_logger.dart';


import '../../data/model/invoice/invoice_model.dart';
import '../../data/repo/invoice_repository.dart';
import 'invoice_details_state.dart';

class InvoiceDetailsCubit extends Cubit<InvoiceDetailsState> {
  final InvoiceRepository _repository;
  final AppLogger _logger = AppLogger();

  InvoiceDetailsCubit(this._repository) : super(const InvoiceDetailsState.initial());

  InvoiceModel? _currentInvoice;

  Future<void> loadInvoiceDetails(String invoiceId) async {
    try {
      emit(const InvoiceDetailsState.loading());
      _logger.info('Loading invoice details for ID: $invoiceId');

      // محاكاة تحميل تفاصيل الفاتورة
      await Future.delayed(const Duration(milliseconds: 500));
      
      // في التطبيق الحقيقي، ستحصل على الفاتورة من الـ Repository
      final invoice = await _getInvoiceById(invoiceId);
      
      if (invoice != null) {
        _currentInvoice = invoice;
        emit(InvoiceDetailsState.loaded(invoice));
        _logger.info('Invoice details loaded successfully');
      } else {
        emit(const InvoiceDetailsState.error('الفاتورة غير موجودة'));
      }
      
    } catch (e) {
      _logger.error('Failed to load invoice details: $e');
      emit(InvoiceDetailsState.error('فشل في تحميل تفاصيل الفاتورة: ${e.toString()}'));
    }
  }

  Future<void> refreshInvoice() async {
    if (_currentInvoice != null) {
      await loadInvoiceDetails(_currentInvoice!.id);
    }
  }

  Future<InvoiceModel?> _getInvoiceById(String invoiceId) async {
    // محاكاة البيانات - في التطبيق الحقيقي ستأتي من الـ Repository
    final mockInvoices = await _repository.getInvoices();
    
    try {
      return mockInvoices.firstWhere((invoice) => invoice.id == invoiceId);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> close() {
    _logger.info('InvoiceDetailsCubit closed');
    return super.close();
  }
}