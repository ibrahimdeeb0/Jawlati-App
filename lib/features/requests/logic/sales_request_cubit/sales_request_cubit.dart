import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/helpers/app_logger.dart';
import 'package:jawlati/core/helpers/toast_helper.dart';
import 'package:jawlati/features/clients/data/models/client_model.dart';

import '../../data/models/request_item/request_item.dart';
import '../../data/repo/requests_repository.dart';
import '../../../invoices/data/model/item/item_model.dart';
import 'sales_request_state.dart';

class SalesRequestCubit extends Cubit<SalesRequestState> {
  final RequestsRepository _repository;

  SalesRequestCubit(this._repository)
      : super(const SalesRequestState.initial()) {
    _initialize();
  }

  final AppLogger _logger = AppLogger();

  // بيانات طلب المبيعات (Local State)
  final List<RequestItem> _requestItems = [];
  Client? _selectedClient;

  double _discount = 0.0;
  String _notes = '';

  // Cache للبيانات من الـ Repository
  List<ItemModel>? _cachedItems;
  List<Client>? _cachedClients;

  // Controllers
  final TextEditingController clientSearchController = TextEditingController();
  final TextEditingController itemSearchController = TextEditingController();

  Future<void> _initialize() async {
    await _loadInitialData();
  }

  // تحميل البيانات الأولية من الـ Repository
  Future<void> _loadInitialData() async {
    try {
      emit(const SalesRequestState.loading());
      _logger.info('Loading initial data for sales request...');

      // تحميل البيانات بشكل متوازي
      final futures = await Future.wait([
        _repository.getAllItems(),
        _repository.getAllClients(),
      ]);

      _cachedItems = futures[0] as List<ItemModel>;
      _cachedClients = futures[1] as List<Client>;

      _logger.info(
          'Loaded ${_cachedItems?.length} items and ${_cachedClients?.length} clients');

      // إصدار الحالة المحملة
      _emitLoadedState();
    } catch (e) {
      _logger.error('Failed to load initial data: $e');
      emit(SalesRequestState.error('فشل في تحميل البيانات: ${e.toString()}'));
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
    final totalAmount = subtotal - _discount;

    filteredItems ??= _cachedItems;
    filteredClients ??= _cachedClients;

    emit(
      SalesRequestState.loaded(
        date: DateTime.now(),
        discount: _discount,
        items: List.from(_requestItems),
        notes: _notes,
        subtotal: subtotal,
        totalAmount: totalAmount,
        selectedClient: _selectedClient,
        selectedItem: null,
        filteredClients: filteredClients,
        filteredItems: filteredItems,
      ),
    );
  }

  // إدارة العملاء
  void selectClient(Client client) {
    _selectedClient = client;
    _emitLoadedState();

    // Recalculate prices based on client
    _recalculatePrices();
    _logger.info('Client selected: ${client.name}');
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
        .where((client) =>
            client.name.toLowerCase().contains(query.toLowerCase()) ||
            client.phone.contains(query))
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
        .where((item) =>
            item.name.toLowerCase().contains(query.toLowerCase()) ||
            item.barcode.contains(query))
        .toList();

    _emitLoadedState(filteredItems: filtered);
    _logger.info('Filtered ${filtered.length} items for query: "$query"');
  }

  void addItemToRequest(ItemModel item, {int quantity = 1}) {
    // التحقق من وجود المادة مسبقاً
    final existingIndex = _requestItems.indexWhere(
      (requestItem) => requestItem.itemId == item.id,
    );

    if (existingIndex != -1) {
      // تحديث الكمية إذا كانت موجودة
      final existingItem = _requestItems[existingIndex];
      _requestItems[existingIndex] = existingItem.copyWith(
        quantity: quantity,
        total: item.price * quantity,
      );
      _logger.info('Updated item quantity: ${item.name} ($quantity)');
    } else {
      // إضافة مادة جديدة
      final requestItem = RequestItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        itemId: item.id,
        name: item.name,
        barcode: item.barcode,
        unit: item.unit,
        price: item.price, // يمكن تطبيق أسعار خاصة بالعميل هنا
        quantity: quantity,
        availableQuantity: item.stockQuantity ?? 0,
        total: item.price * quantity,
        description: item.description,
        category: item.category,
      );

      _requestItems.add(requestItem);
      _logger.info('Added new item: ${item.name}, quantity: $quantity');
    }

    _emitLoadedState();
  }

  void updateItemQuantity(String itemId, int quantity) {
    final itemIndex = _requestItems.indexWhere(
      (item) => item.itemId == itemId,
    );

    if (itemIndex != -1) {
      final item = _requestItems[itemIndex];
      _requestItems[itemIndex] = item.copyWith(
        quantity: quantity,
        total: item.price * quantity,
      );
      _emitLoadedState();
      _logger.info('Updated quantity for item: ${item.name}');
    }
  }

  void updateItemSpecialPrice(String itemId, String newPrice) {
    double? specialPrice = double.tryParse(newPrice.trim());

    if (specialPrice == null) {
      ToastHelper.showToast(
        message: 'تأكد من قيمة السعر المدخل',
        type: ToastType.warning,
      );
    }

    final itemIndex = _requestItems.indexWhere(
      (item) => item.itemId == itemId,
    );

    if (itemIndex != -1 && specialPrice != null) {
      final item = _requestItems[itemIndex];
      _requestItems[itemIndex] = item.copyWith(
        specialPrice: specialPrice,
        total: specialPrice * item.quantity,
      );
      _emitLoadedState();
      _logger.info(
          'Added Special price for item: ${item.name} || new price: ${_requestItems[itemIndex].specialPrice}');
    }
  }

  void onSwitchAddSpecialPrice(bool isEnabled, String itemId) {
    final int itemIndex = _requestItems.indexWhere(
      (item) => item.itemId == itemId,
    );

    debugPrint('isEnabled : $isEnabled');

    if (itemIndex != -1) {
      final item = _requestItems[itemIndex];

      if (isEnabled) {
        final currentSpecialPrice = item.specialPrice ?? item.price;
        _requestItems[itemIndex] = item.copyWith(
          specialPrice: currentSpecialPrice,
          total: currentSpecialPrice * item.quantity,
        );
        _logger.info(
            'Special price enabled for ${item.name}: $currentSpecialPrice');
      } else {
        _requestItems[itemIndex] = item.copyWith(
          specialPrice: null,
          total: item.price * item.quantity,
        );
        _logger.info('Special price disabled for ${item.name}');
      }

      _emitLoadedState();
    }
  }

  void removeItem(String itemId) {
    final removedIndex = _requestItems.indexWhere(
      (item) => item.itemId == itemId,
    );

    if (removedIndex != -1) {
      final removedItem = _requestItems.removeAt(removedIndex);
      _emitLoadedState();
      _logger.info('Item removed: ${removedItem.name}');
    }
  }

  // إدارة الخصم والملاحظات
  void updateDiscount(double discount) {
    _discount = discount;
    _emitLoadedState();
    _logger.info('Updated discount: $discount');
  }

  void updateNotes(String notes) {
    _notes = notes;
    _emitLoadedState();
    _logger.info('Updated notes for sales request');
  }

  void _recalculatePrices() {
    if (_selectedClient == null) return;

    // هنا يمكن تطبيق أسعار خاصة بالعميل
    // للآن سنحتفظ بنفس الأسعار
    _emitLoadedState();
  }

  // حفظ طلب المبيعات
  Future<void> submitRequest() async {
    // Validation
    if (_selectedClient == null) {
      emit(const SalesRequestState.error('يجب اختيار عميل'));
      _returnToLoadedStateAfterError();
      return;
    }

    if (_requestItems.isEmpty) {
      emit(const SalesRequestState.error('يجب إضافة عنصر واحد على الأقل'));
      _returnToLoadedStateAfterError();
      return;
    }

    emit(const SalesRequestState.loading());
    _logger.info('Submitting sales request...');

    try {
      final subtotal = _calculateSubtotal();
      final totalAmount = subtotal - _discount;

      await _repository.createSalesRequest(
        client: _selectedClient!,
        items: _requestItems,
        subtotal: subtotal,
        discount: _discount,
        totalAmount: totalAmount,
        notes: _notes,
      );

      _logger.info('Sales request submitted successfully');

      // إعادة تعيين البيانات بعد الحفظ
      _resetRequestData();
      _emitLoadedState();
      emit(const SalesRequestState.submissionSuccess());

      // يمكن إضافة SnackBar أو Dialog للنجاح هنا
    } catch (e) {
      _logger.error('Failed to submit sales request: $e');
      emit(SalesRequestState.error('فشل في إنشاء الطلب: ${e.toString()}'));
      emit(SalesRequestState.submissionFailure(e.toString()));
      _returnToLoadedStateAfterError();
    }
  }

  void _returnToLoadedStateAfterError() {
    // العودة للحالة المحملة بعد إظهار الخطأ
    Future.delayed(const Duration(seconds: 2), () {
      if (!isClosed) {
        _emitLoadedState();
      }
    });
  }

  void _resetRequestData() {
    _requestItems.clear();
    _selectedClient = null;
    _discount = 0.0;
    _notes = '';
    _logger.info('Sales request data reset');
  }

  void resetRequestData() {
    _resetRequestData();
    _emitLoadedState();
  }

  bool canSubmitRequest() {
    return _requestItems.isNotEmpty && _selectedClient != null;
  }

  // الحسابات
  double _calculateSubtotal() {
    return _requestItems.fold(
      0.0,
      (sum, item) => sum + item.total,
    );
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
    _logger.info('SalesRequestCubit closed');

    clientSearchController.dispose();
    itemSearchController.dispose();
    // _salesRequestSubscription.cancel();
    return super.close();
  }
}
