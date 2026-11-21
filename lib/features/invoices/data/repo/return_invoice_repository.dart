import 'package:jawlati/core/helpers/app_logger.dart';
import 'package:jawlati/core/models/payment_method.dart';
import '../model/invoice_item/invoice_item.dart';
import '../model/return_invoice_model/return_invoice_model.dart';
import '../model/return_invoice_item/return_invoice_item.dart';
import '../model/invoice/invoice_model.dart';
import '../model/enums.dart';

abstract class ReturnInvoiceRepository {
  Future<List<ReturnInvoiceModel>> getReturnInvoices();
  Future<ReturnInvoiceModel?> getReturnInvoiceById(String id);
  Future<void> saveReturnInvoice(ReturnInvoiceModel returnInvoice);
  Future<void> updateReturnInvoice(ReturnInvoiceModel returnInvoice);
  Future<void> deleteReturnInvoice(String id);
  Future<List<InvoiceModel>> getOriginalInvoicesForReturn();
  Future<InvoiceModel?> getOriginalInvoiceById(String invoiceId);
}

class ReturnInvoiceRepositoryImpl implements ReturnInvoiceRepository {
  @override
  Future<List<ReturnInvoiceModel>> getReturnInvoices() async {
    await Future.delayed(const Duration(milliseconds: 800));

    return [
      ReturnInvoiceModel(
        id: 'RET001',
        clientId: '1',
        clientName: 'سوبرماركت سلمى وسر',
        originalInvoiceId: '1554',
        originalInvoiceNumber: '1554',
        items: [
          ReturnInvoiceItem(
            itemId: '1',
            name: 'هالو بلدا 25غم',
            unit: 'بكيت',
            originalPrice: 0.35,
            returnedQuantity: 2,
            originalQuantity: 4,
            returnReason: 'سلعة تالفة',
            isDamaged: true,
          ),
        ],
        subtotal: 0.70,
        totalAmount: 0.70,
        refundAmount: 0.70,
        notes: 'إرجاع بسبب تلف العبوة',
        returnReason: ReturnReason.damaged,
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
        returnInvoiceNumber: 'RET001',
        status: ReturnInvoiceStatus.processed,
        processedBy: 'أحمد محمد',
      ),
      ReturnInvoiceModel(
        id: 'RET002',
        clientId: '2',
        clientName: 'سوبرماركت بس تست',
        originalInvoiceId: '1553',
        originalInvoiceNumber: '1553',
        items: [
          ReturnInvoiceItem(
            itemId: '2',
            name: 'هالو بلدا 42غم',
            unit: 'بكيت',
            originalPrice: 0.70,
            returnedQuantity: 5,
            originalQuantity: 10,
            returnReason: 'طلب العميل',
          ),
        ],
        subtotal: 3.50,
        totalAmount: 3.50,
        refundAmount: 3.50,
        notes: 'العميل غير راض عن الجودة',
        returnReason: ReturnReason.customerRequest,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        returnInvoiceNumber: 'RET002',
        status: ReturnInvoiceStatus.draft,
      ),
      ReturnInvoiceModel(
        id: 'RET002',
        clientId: '2',
        clientName: 'سوبرماركت بس تست',
        originalInvoiceId: '1553',
        originalInvoiceNumber: '1553',
        items: [
          ReturnInvoiceItem(
            itemId: '2',
            name: 'هالو بلدا 42غم',
            unit: 'بكيت',
            originalPrice: 0.70,
            returnedQuantity: 5,
            originalQuantity: 10,
            returnReason: 'طلب العميل',
          ),
        ],
        subtotal: 3.50,
        totalAmount: 3.50,
        refundAmount: 3.50,
        notes: 'العميل غير راض عن الجودة',
        returnReason: ReturnReason.customerRequest,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        returnInvoiceNumber: 'RET002',
        status: ReturnInvoiceStatus.draft,
      ),
      ReturnInvoiceModel(
        id: 'RET002',
        clientId: '2',
        clientName: 'سوبرماركت بس تست',
        originalInvoiceId: '1553',
        originalInvoiceNumber: '1553',
        items: [
          ReturnInvoiceItem(
            itemId: '2',
            name: 'هالو بلدا 42غم',
            unit: 'بكيت',
            originalPrice: 0.70,
            returnedQuantity: 5,
            originalQuantity: 10,
            returnReason: 'طلب العميل',
          ),
        ],
        subtotal: 3.50,
        totalAmount: 3.50,
        refundAmount: 3.50,
        notes: 'العميل غير راض عن الجودة',
        returnReason: ReturnReason.customerRequest,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        returnInvoiceNumber: 'RET002',
        status: ReturnInvoiceStatus.draft,
      ),
    ];
  }

  @override
  Future<ReturnInvoiceModel?> getReturnInvoiceById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final returnInvoices = await getReturnInvoices();
    try {
      return returnInvoices.firstWhere((invoice) => invoice.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveReturnInvoice(ReturnInvoiceModel returnInvoice) async {
    await Future.delayed(const Duration(seconds: 1));

    AppLogger().info('Return Invoice saved: ${returnInvoice.toJson()}');
  }

  @override
  Future<void> updateReturnInvoice(ReturnInvoiceModel returnInvoice) async {
    await Future.delayed(const Duration(milliseconds: 800));

    AppLogger().info('Return Invoice updated: ${returnInvoice.toJson()}');
  }

  @override
  Future<void> deleteReturnInvoice(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));

    AppLogger().info('Return Invoice deleted: $id');
  }

  @override
  Future<List<InvoiceModel>> getOriginalInvoicesForReturn() async {
    // إرجاع الفواتير التي يمكن إرجاعها (مدفوعة أو جزئية)
    await Future.delayed(const Duration(milliseconds: 600));

    return [
      InvoiceModel(
        id: '1554',
        clientId: '1',
        clientName: 'سوبرماركت سلمى وسر',
        items: [
          InvoiceItem(
            itemId: '1',
            name: 'هالو بلدا 25غم',
            unit: 'بكيت',
            price: 0.35,
            quantity: 4,
            stockQuantity: 200,
          ),
          InvoiceItem(
            itemId: '3',
            name: 'أرز أبو كاس 5كغ',
            unit: 'كيس',
            price: 15.50,
            quantity: 1,
            stockQuantity: 60,
          ),
        ],
        subtotal: 16.9,
        totalAmount: 16.9,
        paidAmount: 16.9,
        remainingAmount: 0.0,
        notes: '',
        paymentMethod: AppPaymentMethod.cash,
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        invoiceNumber: '1554',
        status: InvoiceStatus.paid,
      ),
      InvoiceModel(
        id: '1553',
        clientId: '2',
        clientName: 'سوبرماركت بس تست',
        items: [
          InvoiceItem(
            itemId: '2',
            name: 'هالو بلدا 42غم',
            unit: 'بكيت',
            price: 0.70,
            quantity: 10,
            stockQuantity: 240,
          ),
        ],
        subtotal: 7.0,
        totalAmount: 7.0,
        paidAmount: 3.5,
        remainingAmount: 3.5,
        notes: 'دفعة جزئية',
        paymentMethod: AppPaymentMethod.card,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        invoiceNumber: '1553',
        status: InvoiceStatus.partial,
      ),
    ];
  }

  @override
  Future<InvoiceModel?> getOriginalInvoiceById(String invoiceId) async {
    await Future.delayed(const Duration(milliseconds: 400));

    final invoices = await getOriginalInvoicesForReturn();
    try {
      return invoices.firstWhere((invoice) => invoice.id == invoiceId);
    } catch (e) {
      return null;
    }
  }
}
