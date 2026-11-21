import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jawlati/core/helpers/app_logger.dart';
import 'package:jawlati/core/models/customer_model.dart';
import 'package:jawlati/core/models/payment_method.dart';
import 'package:jawlati/core/networking/api_result.dart';
import 'package:jawlati/features/clients/data/models/client_model.dart';

import '../../data/model/item/item_model.dart';
import '../../data/model/invoice_item/invoice_item.dart';
import '../../data/model/invoice/invoice_model.dart';
import '../../data/repo/invoice_repository.dart';
import 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  final InvoiceRepository _repository;

  InvoiceCubit(this._repository) : super(const InvoiceState.initial()) {
    _initialize();
  }

  Timer? _timer;
  final AppLogger _logger = AppLogger();

  // بيانات الفاتورة (Local State)
  final List<InvoiceItem> _invoiceItems = [];
  Client? _selectedClient;
  double _paidAmount = 0.0;
  String _notes = '';
  // PaymentMethod _paymentMethod = PaymentMethod.cash;
  AppPaymentMethod _selectedPaymentMethod = AppPaymentMethod.cash;
  List<AppPaymentMethod> _availableMethods = [];

  // Cache للبيانات من الـ Repository
  List<ItemModel>? _cachedItems;
  List<Client>? _cachedClients;

  ApiResult<List<CustomerModel>> _cachedCustomers = ApiResult.success([]);

  // Controllers
  final TextEditingController clientSearchController = TextEditingController();
  final TextEditingController itemSearchController = TextEditingController();

  Future<void> _initialize() async {
    await initializeDateFormatting('ar', null);
    await _loadInitialData();
    _startAutoRefresh();
  }

  // fetching customers from repo
  Future<void> fetchCustomers() async {
    try {
      _cachedCustomers = await _repository.getAllCustomers();
    } catch (e) {
      _logger.error('Failed to fetch customers: $e');
    }
  }

  // تحميل البيانات الأولية من الـ Repository
  Future<void> _loadInitialData() async {
    try {
      emit(const InvoiceState.loading());
      _logger.info('Loading initial data from repository...');

      // تحميل البيانات بشكل متوازي
      final futures = await Future.wait([
        _repository.getAllItems(),
        _repository.getAllClients(),
      ]);

      _cachedItems = futures[0] as List<ItemModel>;
      _cachedClients = futures[1] as List<Client>;

      _availableMethods = [
        AppPaymentMethod.cash,
        AppPaymentMethod.card,
        AppPaymentMethod.credit,
        AppPaymentMethod.points,
        AppPaymentMethod.wallet('زين كاش', 'zain_cash'),
      ];

      _emitLoadedState(filteredItems: _cachedItems);
    } catch (e) {
      _logger.error('Failed to load initial data: $e');
      emit(InvoiceState.error('فشل في تحميل البيانات: ${e.toString()}'));
    }
  }

  // إعادة تحميل البيانات
  Future<void> refreshData() async {
    await _loadInitialData();
  }

  void _emitLoadedState({
    List<ItemModel>? filteredItems,
    List<Client>? filteredClients,
  }) {
    final subtotal = _calculateSubtotal();
    final totalAmount = subtotal; // يمكن إضافة ضرائب لاحقاً
    final remainingAmount = totalAmount - _paidAmount;

    filteredItems ??= _cachedItems;
    filteredClients ??= _cachedClients;

    emit(
      InvoiceState.loaded(
        currentTime: _getCurrentTime(),
        currentDate: _getCurrentDate(),
        invoiceItems: List.from(_invoiceItems),
        subtotal: subtotal,
        totalAmount: totalAmount,
        paidAmount: _paidAmount,
        remainingAmount: remainingAmount,
        notes: _notes,
        selectedClient: _selectedClient,
        filteredItems: filteredItems,
        filteredClients: filteredClients,
        availableMethods: _availableMethods,
        selectedPaymentMethod: _selectedPaymentMethod,
      ),
    );
  }

  // إدارة العملاء
  void selectClient(Client client) {
    _selectedClient = client;

    _emitLoadedState();
    // _logger.info('Client selected: ${client.name}');
  }

  void updatePaymentMethod(AppPaymentMethod newMethod) {
    _selectedPaymentMethod = newMethod;
    _emitLoadedState();
    _logger.info('Updated payment method: $newMethod');
  }

  void clearClient() {
    _selectedClient = null;
    _emitLoadedState();
    _logger.info('Client cleared');
  }

  void searchClients(String query) {
    if (_cachedClients == null) {
      _logger.warning('Clients not loaded yet');
      return;
    }

    if (query.isEmpty) {
      _emitLoadedState(filteredClients: _cachedClients);
      return;
    }

    final filtered = _cachedClients!
        .where(
          (client) =>
              client.name.toLowerCase().contains(query.toLowerCase()) ||
              client.phone.contains(query),
        )
        .toList();

    _emitLoadedState(filteredClients: filtered);
    _logger.info('Filtered ${filtered.length} clients for query: "$query"');
  }

  // إدارة المواد
  void searchItems(String query) {
    if (_cachedItems == null) {
      _logger.warning('Items not loaded yet');
      return;
    }

    if (query.isEmpty) {
      _emitLoadedState(filteredItems: _cachedItems);
      return;
    }

    final filtered = _cachedItems!
        .where(
          (item) =>
              item.name.toLowerCase().contains(query.toLowerCase()) ||
              item.barcode.contains(query.toLowerCase()),
        )
        .toList();

    _emitLoadedState(filteredItems: filtered);
    _logger.info('Filtered ${filtered.length} items for query: "$query"');
  }

  void addItemToInvoice(ItemModel item, {int quantity = 1}) async {
    // التحقق من وجود المادة مسبقاً
    final existingIndex = _invoiceItems.indexWhere(
      (invoiceItem) => invoiceItem.itemId == item.id,
    );

    if (existingIndex != -1) {
      // زيادة الكمية إذا كانت موجودة
      final existingItem = _invoiceItems[existingIndex];
      final updatedItem = existingItem.copyWith(
        quantity: existingItem.quantity + quantity,
      );
      
      // Apply discounts to the updated item
      final discountedItem = await _repository.applyDiscountsToItem(
        updatedItem,
        _invoiceItems,
      );
      
      _invoiceItems[existingIndex] = discountedItem;
      _logger.info(
        'Updated item quantity: ${item.name} (${discountedItem.quantity})',
      );
    } else {
      // إضافة مادة جديدة
      var newItem = InvoiceItem(
        itemId: item.id,
        name: item.name,
        unit: item.unit,
        price: item.price,
        quantity: quantity,
        stockQuantity: item.stockQuantity,
      );
      
      // Apply discounts to the new item
      newItem = await _repository.applyDiscountsToItem(
        newItem,
        _invoiceItems,
      );
      
      _invoiceItems.add(newItem);
      _logger.info('Added new item: ${item.name}, quantity: $quantity');
    }

    // Apply linked discounts to all items
    await _applyLinkedDiscounts();
    
    _emitLoadedState();
  }

  void removeItemFromInvoice(int index) {
    if (index >= 0 && index < _invoiceItems.length) {
      final removedItem = _invoiceItems.removeAt(index);
      _emitLoadedState();
      _logger.info('Item removed: ${removedItem.name}');
    }
  }

  void updateItemQuantity(int index, int newQty) async {
    if (index >= 0 && index < _invoiceItems.length) {
      final item = _invoiceItems[index];
      var updatedItem = item.copyWith(quantity: newQty);
      
      // Apply discounts with new quantity
      updatedItem = await _repository.applyDiscountsToItem(
        updatedItem,
        _invoiceItems,
      );
      
      _invoiceItems[index] = updatedItem;
      _logger.info(
        'New quantity for: ${updatedItem.name}, Quantity: ${updatedItem.quantity}',
      );
      
      // Apply linked discounts to all items
      await _applyLinkedDiscounts();
      
      _emitLoadedState();
    }
  }

  void updateItemBonusQuantity(int index, int newBonusQty) {
    if (index >= 0 && index < _invoiceItems.length) {
      final item = _invoiceItems[index];
      _invoiceItems[index] = item.copyWith(quantityOfBonus: newBonusQty);
      _logger.info(
        'New bonus quantity for: ${_invoiceItems[index].name}, Bonus Quantity: ${_invoiceItems[index].quantityOfBonus}',
      );
      _emitLoadedState();
    }
  }

  // إدارة المدفوعات والملاحظات
  void updatePaidAmount(double amount) {
    _paidAmount = amount;
    _emitLoadedState();
    _logger.info('Updated paid amount: $amount');
  }

  void updateNotes(String notes) {
    _notes = notes;
    _emitLoadedState();
    _logger.info('Updated notes');
  }

  // حفظ الفاتورة
  Future<void> saveInvoice() async {
    // Validation
    if (_invoiceItems.isEmpty) {
      emit(const InvoiceState.error('لا يمكن حفظ فاتورة فارغة'));
      return;
    }

    if (_selectedClient == null) {
      emit(const InvoiceState.error('يرجى اختيار عميل'));
      return;
    }

    emit(const InvoiceState.loading());
    _logger.info('Saving invoice...');

    try {
      final subtotal = _calculateSubtotal();

      // إنشاء نموذج الفاتورة
      final invoice = InvoiceModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        clientId: _selectedClient!.id,
        clientName: _selectedClient!.name,
        items: List.from(_invoiceItems),
        subtotal: subtotal,
        totalAmount: subtotal, // يمكن إضافة ضرائب لاحقاً
        paidAmount: _paidAmount,
        remainingAmount: subtotal - _paidAmount,
        notes: _notes,
        paymentMethod: _selectedPaymentMethod,
        createdAt: DateTime.now(),
      );

      // حفظ في الـ Repository
      await _repository.saveInvoice(invoice);

      _logger.info('Invoice saved successfully with ID: ${invoice.id}');

      // إعادة تعيين البيانات بعد الحفظ
      _resetInvoiceData();
      _emitLoadedState();

      // يمكن إضافة success state أو إظهار رسالة نجاح
    } catch (e) {
      _logger.error('Failed to save invoice: $e');
      emit(InvoiceState.error('فشل في حفظ الفاتورة: ${e.toString()}'));

      // العودة للحالة المحملة بعد إظهار الخطأ
      Future.delayed(const Duration(seconds: 2), () {
        if (!isClosed) {
          _emitLoadedState();
        }
      });
    }
  }

  void _resetInvoiceData() {
    _invoiceItems.clear();
    _selectedClient = null;
    _paidAmount = 0.0;
    _notes = '';
    _logger.info('Invoice data reset');
  }

  void resetInvoiceData() {
    _resetInvoiceData();
    _emitLoadedState();
  }

  bool canSaveInvoice() {
    return _invoiceItems.isNotEmpty && _selectedClient != null;
  }

  // Apply linked discounts to all items
  Future<void> _applyLinkedDiscounts() async {
    final discountedItems = await _repository.applyLinkedDiscounts(
      _invoiceItems,
    );
    
    // Update items that received linked discounts
    for (int i = 0; i < discountedItems.length; i++) {
      if (i < _invoiceItems.length) {
        _invoiceItems[i] = discountedItems[i];
      }
    }
  }

  // الحسابات
  double _calculateSubtotal() {
    return _invoiceItems.fold(
      0.0,
      (sum, item) => sum + (item.finalTotal),
    );
  }

  // إدارة الوقت
  void _startAutoRefresh() {
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (state is Loaded) {
        _emitLoadedState();
      }
    });
  }

  String _getCurrentTime() {
    return DateFormat('h:mm a', 'ar').format(DateTime.now());
  }

  String _getCurrentDate() {
    return DateFormat('dd/MM/yyyy').format(DateTime.now());
  }

  // Getters - استخدام الـ Cache
  List<Client> get allClients => List.unmodifiable(_cachedClients ?? []);
  List<ItemModel> get allItems => List.unmodifiable(_cachedItems ?? []);
  DateTime get dateNow => DateTime.now();

  // معلومات إضافية للـ debugging
  bool get isDataLoaded => _cachedItems != null && _cachedClients != null;
  int get cachedItemsCount => _cachedItems?.length ?? 0;
  int get cachedClientsCount => _cachedClients?.length ?? 0;

  @override
  Future<void> close() {
    _timer?.cancel();
    _logger.info('InvoiceCubit closed');

    clientSearchController.dispose();
    itemSearchController.dispose();
    return super.close();
  }
}
