import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/helpers/app_logger.dart';

import '../../data/models/request_item/request_item.dart';
import '../../data/repo/requests_repository.dart';
import '../../../invoices/data/model/item/item_model.dart';
import 'load_request_state.dart';

class LoadRequestCubit extends Cubit<LoadRequestState> {
  final RequestsRepository _repository;

  LoadRequestCubit(this._repository) : super(const LoadRequestState.initial()) {
    _initialize();
  }

  final AppLogger _logger = AppLogger();

  // بيانات طلب التحميل (Local State)
  final List<RequestItem> _requestItems = [];
  String _notes = '';

  // Cache للبيانات من الـ Repository
  List<ItemModel>? _cachedItems;

  // Controllers
  final TextEditingController itemSearchController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  Future<void> _initialize() async {
    await _loadInitialData();
  }

  // تحميل البيانات الأولية من الـ Repository
  Future<void> _loadInitialData() async {
    try {
      emit(const LoadRequestState.loading());
      _logger.info('Loading initial data for load request...');

      // تحميل المواد المتاحة
      _cachedItems = await _repository.getAllItems();

      _logger.info('Loaded ${_cachedItems?.length} items');

      // إصدار الحالة المحملة
      _emitLoadedState();
    } catch (e) {
      _logger.error('Failed to load initial data: $e');
      emit(LoadRequestState.error('فشل في تحميل البيانات: ${e.toString()}'));
    }
  }

  // إعادة تحميل البيانات
  Future<void> refreshData() async {
    await _loadInitialData();
  }

  void _emitLoadedState({
    List<ItemModel>? filteredItems,
  }) {
    // final totalItems =
    //     _requestItems.fold<int>(0, (sum, item) => sum + item.quantity);

    filteredItems ??= _cachedItems;

    emit(
      LoadRequestState.loaded(
        date: DateTime.now(),
        notes: _notes,
        requestItems: _requestItems,
        filteredItems: filteredItems,
      ),
    );
  }

  void updateNotes(String notes) {
    _notes = notes;

    if (notesController.text != notes) {
      notesController.text = notes;
    }
    _emitLoadedState();
    _logger.info('Updated notes for load request');
  }

  // إدارة المواد
  void searchItems(String query) {
    if (_cachedItems == null) {
      _logger.warning('Items not loaded yet');
      return;
    }

    // هذه الوظيفة ستُستخدم في bottom sheet
    // لا نحتاج إلى emit state هنا
    _logger.info('Searching items with query: "$query"');
  }

  void addItemRequest(ItemModel item, {int quantity = 1}) {
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
        price: item.price,
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

  // حفظ طلب التحميل
  Future<void> submitRequest() async {
    // Debug: Print current request items before validation
    _logger.debug(
        '🔍 [submitRequest] Request items count: ${_requestItems.length}');
    for (int i = 0; i < _requestItems.length; i++) {
      _logger.debug(
          '🔍 [submitRequest] Item $i: ${_requestItems[i].name} - Quantity: ${_requestItems[i].quantity}');
    }

    // Validation
    if (_requestItems.isEmpty) {
      _logger.debug('🔍 [submitRequest] ERROR: No items in request');
      emit(const LoadRequestState.error('يجب إضافة عنصر واحد على الأقل'));
      _returnToLoadedStateAfterError();
      return;
    }

    emit(const LoadRequestState.loading());
    _logger.info('Submitting load request...');

    try {
      _logger
          .debug('🔍 [submitRequest] Calling repository.createLoadRequest...');
      final createdRequest = await _repository.createLoadRequest(
        items: List.from(_requestItems), // Create copy
        notes: _notes,
      );

      _logger.debug(
          '🔍 [submitRequest] Request created with ID: ${createdRequest.id}');
      _logger.debug(
          '🔍 [submitRequest] Created request has ${createdRequest.items.length} items');

      _logger.info('Load request submitted successfully');

      // إعادة تعيين البيانات بعد الحفظ
      _resetRequestData();
      _emitLoadedState();
      emit(const LoadRequestState.submissionSuccess());

      // يمكن إضافة SnackBar أو Dialog للنجاح هنا
    } catch (e) {
      _logger.error('Failed to submit load request: $e');
      emit(LoadRequestState.error('فشل في إرسال الطلب: ${e.toString()}'));
      emit(LoadRequestState.submissionFailure(e.toString()));
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
    _notes = '';
    notesController.clear();
    _logger.info('Load request data reset');
  }

  void resetRequestData() {
    _resetRequestData();
    _emitLoadedState();
  }

  bool canSubmitRequest() {
    return _requestItems.isNotEmpty;
  }

  // Getters - استخدام الـ Cache
  List<ItemModel> get allItems => List.unmodifiable(_cachedItems ?? []);
  DateTime get dateNow => DateTime.now();

  // معلومات إضافية للـ debugging
  bool get isDataLoaded => _cachedItems != null;
  int get cachedItemsCount => _cachedItems?.length ?? 0;

  @override
  Future<void> close() {
    _logger.info('LoadRequestCubit closed');
    itemSearchController.dispose();
    notesController.dispose();
    return super.close();
  }
}
