import 'package:jawlati/core/helpers/app_logger.dart';
import 'package:jawlati/features/clients/data/models/client_model.dart';

import '../models/receipt_voucher_model/receipt_voucher_model.dart';
import '../models/receipt_enums.dart';
import 'package:intl/intl.dart';

abstract class ReceiptRepository {
  Future<List<Client>> getAllClients();
  Future<void> saveReceipt(ReceiptVoucherModel receipt);
  Future<List<ReceiptVoucherModel>> getReceipts();
  Future<ReceiptVoucherModel?> getReceiptById(String id);
  Future<void> deleteReceipt(String id);
  Future<void> updateReceipt(ReceiptVoucherModel receipt);
}

class ReceiptRepositoryImpl implements ReceiptRepository {
  
  @override
  Future<List<Client>> getAllClients() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return [
      const Client(
        id: '1',
        name: 'سوبرماركت سلمى وسر',
        phone: '0795551234',
        address: 'نابلس - البلدة القديمة',
        balance: 2450.0,
      ),
      const Client(
        id: '2',
        name: 'سوبرماركت بس تست',
        phone: '0785559876',
        address: 'رام الله - المنارة',
        balance: 1200.50,
      ),
      const Client(
        id: '3',
        name: 'مخازن الخير التجارية',
        phone: '0599887766',
        address: 'الخليل - الشارع الرئيسي',
        balance: 3200.75,
      ),
      const Client(
        id: '4',
        name: 'الوكالة التجارية',
        phone: '0567123456',
        address: 'جنين - المركز',
        balance: 850.25,
      ),
    ];
  }

  @override
  Future<void> saveReceipt(ReceiptVoucherModel receipt) async {
    await Future.delayed(const Duration(seconds: 1));
    AppLogger().info('Receipt saved: ${receipt.toJson()}');
  }

  @override
  Future<List<ReceiptVoucherModel>> getReceipts() async {
    await Future.delayed(const Duration(milliseconds: 800));

    return [
      ReceiptVoucherModel(
        id: '1',
        receiptNumber: 'RCP-${DateFormat('yyyyMMdd').format(DateTime.now())}-001',
        client: const Client(
          id: '1',
          name: 'سوبرماركت سلمى وسر',
          phone: '0795551234',
          address: 'نابلس - البلدة القديمة',
          balance: 2450.0,
        ),
        receiptType: ReceiptType.cash,
        amount: 1500.0,
        date: DateTime.now().subtract(const Duration(hours: 2)),
        notes: 'دفعة نقدية من العميل',
        status: ReceiptStatus.confirmed,
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      ReceiptVoucherModel(
        id: '2',
        receiptNumber: 'RCP-${DateFormat('yyyyMMdd').format(DateTime.now().subtract(const Duration(days: 1)))}-002',
        client: const Client(
          id: '2',
          name: 'سوبرماركت بس تست',
          phone: '0785559876',
          address: 'رام الله - المنارة',
          balance: 1200.50,
        ),
        receiptType: ReceiptType.cheque,
        amount: 2500.0,
        date: DateTime.now().subtract(const Duration(days: 1)),
        chequeNumber: '123456789',
        bankName: 'البنك الأهلي',
        chequeMaturityDate: DateTime.now().add(const Duration(days: 30)),
        notes: 'شيك مؤجل لمدة شهر',
        status: ReceiptStatus.confirmed,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      ReceiptVoucherModel(
        id: '3',
        receiptNumber: 'RCP-${DateFormat('yyyyMMdd').format(DateTime.now().subtract(const Duration(days: 2)))}-003',
        client: const Client(
          id: '3',
          name: 'مخازن الخير التجارية',
          phone: '0599887766',
          address: 'الخليل - الشارع الرئيسي',
          balance: 3200.75,
        ),
        receiptType: ReceiptType.bankTransfer,
        amount: 3200.0,
        date: DateTime.now().subtract(const Duration(days: 2)),
        notes: 'تحويل بنكي',
        status: ReceiptStatus.confirmed,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ];
  }

  @override
  Future<ReceiptVoucherModel?> getReceiptById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    final receipts = await getReceipts();
    try {
      return receipts.firstWhere((receipt) => receipt.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> deleteReceipt(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    AppLogger().info('Receipt deleted: $id');
  }

  @override
  Future<void> updateReceipt(ReceiptVoucherModel receipt) async {
    await Future.delayed(const Duration(seconds: 1));
    AppLogger().info('Receipt updated: ${receipt.toJson()}');
  }
}
