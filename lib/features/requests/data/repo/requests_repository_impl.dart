import 'package:jawlati/features/clients/data/models/client_model.dart';

import '../models/load_request/load_request.dart';
import '../models/sales_request/sales_request.dart';
import '../models/request_enums.dart';
import '../models/request_item/request_item.dart';
import '../../../invoices/data/model/item/item_model.dart';
import 'requests_repository.dart';

class RequestsRepositoryImpl implements RequestsRepository {
  // Mock data for demonstration
  static final List<LoadRequest> _loadRequests = [];
  static final List<SalesRequest> _salesRequests = [];
  static int _requestCounter = 1;

  // Initialize with sample data for testing
  static bool _isInitialized = false;

  RequestsRepositoryImpl() {
    if (!_isInitialized) {
      _initializeSampleData();
      _isInitialized = true;
    }
  }

  void _initializeSampleData() {
    // Add sample load request with items
    final sampleLoadRequest = LoadRequest(
      id: 'sample_load_1',
      requestNumber: 'LR0001',
      date: DateTime.now().subtract(const Duration(days: 2)),
      status: RequestStatus.pending,
      items: [
        const RequestItem(
          id: '1',
          itemId: '1',
          name: 'منتج تجريبي 1',
          barcode: '1234567890',
          unit: 'قطعة',
          price: 10.0,
          quantity: 5,
          availableQuantity: 100,
          total: 50.0,
          description: 'وصف المنتج التجريبي 1',
        ),
        const RequestItem(
          id: '2',
          itemId: '2',
          name: 'منتج تجريبي 2',
          barcode: '0987654321',
          unit: 'كيلو',
          price: 25.5,
          quantity: 3,
          availableQuantity: 50,
          total: 76.5,
          description: 'وصف المنتج التجريبي 2',
        ),
      ],
      notes: 'ملاحظات تجريبية للطلب',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    );

    _loadRequests.add(sampleLoadRequest);

    // Add sample sales request with items
    final sampleSalesRequest = SalesRequest(
      id: 'sample_sales_1',
      requestNumber: 'SR0001',
      date: DateTime.now().subtract(const Duration(days: 1)),
      status: RequestStatus.approved,
      client: const Client(
        id: '1',
        name: 'عميل تجريبي',
        phone: '123456789',
        address: 'عنوان تجريبي',
        type: ClientType.individual,
      ),
      items: [
        const RequestItem(
          id: '3',
          itemId: '1',
          name: 'منتج تجريبي 1',
          barcode: '1234567890',
          unit: 'قطعة',
          price: 10.0,
          quantity: 2,
          availableQuantity: 100,
          total: 20.0,
          description: 'وصف المنتج التجريبي 1',
        ),
      ],
      subtotal: 20.0,
      discount: 2.0,
      totalAmount: 18.0,
      notes: 'طلب مبيعات تجريبي',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    );

    _salesRequests.add(sampleSalesRequest);
    _requestCounter = 3;

    // print(
    //     '🔍 Sample data initialized - ${_loadRequests.length} load requests, ${_salesRequests.length} sales requests');
  }

  @override
  Future<List<ItemModel>> getAllItems() async {
    await Future.delayed(const Duration(milliseconds: 300));

    // Mock items data - في التطبيق الحقيقي ستأتي من API
    return [
      const ItemModel(
        id: '1',
        name: 'منتج تجريبي 1',
        barcode: '1234567890',
        unit: 'قطعة',
        price: 10.0,
        stockQuantity: 100,
      ),
      const ItemModel(
        id: '2',
        name: 'منتج تجريبي 2',
        barcode: '0987654321',
        unit: 'كيلو',
        price: 25.5,
        stockQuantity: 50,
      ),
    ];
  }

  @override
  Future<List<Client>> getAllClients() async {
    await Future.delayed(const Duration(milliseconds: 300));

    // Mock clients data - في التطبيق الحقيقي ستأتي من API
    return [
      const Client(
        id: '1',
        name: 'عميل تجريبي 1',
        phone: '123456789',
        address: 'عنوان تجريبي 1',
        type: ClientType.individual,
      ),
      const Client(
        id: '2',
        name: 'عميل تجريبي 2',
        phone: '987654321',
        address: 'عنوان تجريبي 2',
        type: ClientType.company,
      ),
    ];
  }

  @override
  Future<List<dynamic>> getAllRequests() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final allRequests = <dynamic>[];
    allRequests.addAll(_loadRequests);
    allRequests.addAll(_salesRequests);

    // Sort by date descending
    allRequests.sort((a, b) => b.date.compareTo(a.date));

    // Debug information
    // print('🔍 getAllRequests returning ${allRequests.length} requests');
    for (int i = 0; i < allRequests.length; i++) {
      final request = allRequests[i];
      if (request is LoadRequest) {
        // print(
        //     '🔍 LoadRequest ${i + 1}: ${request.requestNumber} - Items: ${request.items.length}');
      } else if (request is SalesRequest) {
        // print(
        //     '🔍 SalesRequest ${i + 1}: ${request.requestNumber} - Items: ${request.items.length}');
      }
    }

    return allRequests;
  }

  @override
  Future<List<dynamic>> getRequestsByType(RequestType type) async {
    await Future.delayed(const Duration(milliseconds: 300));

    switch (type) {
      case RequestType.load:
        return _loadRequests;
      case RequestType.sales:
        return _salesRequests;
    }
  }

  @override
  Future<List<dynamic>> getRequestsByStatus(RequestStatus status) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final allRequests = <dynamic>[];
    allRequests.addAll(_loadRequests.where((r) => r.status == status));
    allRequests.addAll(_salesRequests.where((r) => r.status == status));

    return allRequests;
  }

  @override
  Future<LoadRequest> createLoadRequest({
    required List<RequestItem> items,
    required String notes,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));

    // Debug information
    // print('🔍 Creating LoadRequest with ${items.length} items');
    // for (int i = 0; i < items.length; i++) {
    //   print('🔍 Item $i: ${items[i].name} - Quantity: ${items[i].quantity}');
    // }

    final request = LoadRequest(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      requestNumber: 'LR${_requestCounter.toString().padLeft(4, '0')}',
      date: DateTime.now(),
      status: RequestStatus.pending,
      items: List.from(items), // Create a copy to ensure immutability
      notes: notes,
      createdAt: DateTime.now(),
    );

    _loadRequests.add(request);
    _requestCounter++;

    // print('🔍 LoadRequest created with ID: ${request.id}');
    // print('🔍 Total load requests now: ${_loadRequests.length}');

    return request;
  }

  @override
  Future<SalesRequest> createSalesRequest({
    required Client client,
    required List<RequestItem> items,
    required double subtotal,
    required double discount,
    required double totalAmount,
    required String notes,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));

    final request = SalesRequest(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      requestNumber: 'SR${_requestCounter.toString().padLeft(4, '0')}',
      date: DateTime.now(),
      status: RequestStatus.pending,
      client: client,
      items: items,
      subtotal: subtotal,
      discount: discount,
      totalAmount: totalAmount,
      notes: notes,
      createdAt: DateTime.now(),
    );

    _salesRequests.add(request);
    _requestCounter++;

    return request;
  }

  @override
  Future<bool> updateRequestStatus({
    required String requestId,
    required RequestType type,
    required RequestStatus status,
    String? approvedBy,
    String? rejectionReason,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    switch (type) {
      case RequestType.load:
        final index = _loadRequests.indexWhere((r) => r.id == requestId);
        if (index != -1) {
          _loadRequests[index] = _loadRequests[index].copyWith(
            status: status,
            approvedBy: approvedBy,
            approvedAt:
                status == RequestStatus.approved ? DateTime.now() : null,
            rejectionReason: rejectionReason,
            updatedAt: DateTime.now(),
          );
          return true;
        }
        break;
      case RequestType.sales:
        final index = _salesRequests.indexWhere((r) => r.id == requestId);
        if (index != -1) {
          _salesRequests[index] = _salesRequests[index].copyWith(
            status: status,
            approvedBy: approvedBy,
            approvedAt:
                status == RequestStatus.approved ? DateTime.now() : null,
            rejectionReason: rejectionReason,
            updatedAt: DateTime.now(),
          );
          return true;
        }
        break;
    }

    return false;
  }

  @override
  Future<List<dynamic>> searchRequests(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (query.isEmpty) {
      return getAllRequests();
    }

    final allRequests = <dynamic>[];
    allRequests.addAll(_loadRequests);
    allRequests.addAll(_salesRequests);

    return allRequests.where((request) {
      final searchTerm = query.toLowerCase();

      if (request is LoadRequest) {
        return request.requestNumber.toLowerCase().contains(searchTerm) ||
            request.notes.toLowerCase().contains(searchTerm);
      } else if (request is SalesRequest) {
        return request.requestNumber.toLowerCase().contains(searchTerm) ||
            request.client.name.toLowerCase().contains(searchTerm) ||
            request.notes.toLowerCase().contains(searchTerm);
      }

      return false;
    }).toList();
  }
}
