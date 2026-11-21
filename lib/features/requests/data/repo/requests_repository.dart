import 'package:jawlati/features/clients/data/models/client_model.dart';

import '../models/load_request/load_request.dart';
import '../models/sales_request/sales_request.dart';
import '../models/request_enums.dart';
import '../models/request_item/request_item.dart';
import '../../../invoices/data/model/item/item_model.dart';

abstract class RequestsRepository {
  /// Get all items (for request forms)
  Future<List<ItemModel>> getAllItems();

  /// Get all clients (for request forms)
  Future<List<Client>> getAllClients();

  /// Get all requests
  Future<List<dynamic>> getAllRequests();

  /// Get requests by type
  Future<List<dynamic>> getRequestsByType(RequestType type);

  /// Get requests by status
  Future<List<dynamic>> getRequestsByStatus(RequestStatus status);

  /// Create load request
  Future<LoadRequest> createLoadRequest({
    required List<RequestItem> items,
    required String notes,
  });

  /// Create sales request
  Future<SalesRequest> createSalesRequest({
    required Client client,
    required List<RequestItem> items,
    required double subtotal,
    required double discount,
    required double totalAmount,
    required String notes,
  });

  /// Update request status (for admin/manager)
  Future<bool> updateRequestStatus({
    required String requestId,
    required RequestType type,
    required RequestStatus status,
    String? approvedBy,
    String? rejectionReason,
  });

  /// Search requests
  Future<List<dynamic>> searchRequests(String query);
}


// class RequestsRepository {

//   // Mock data for demonstration
//   static List<LoadRequest> _loadRequests = [];
//   static List<SalesRequest> _salesRequests = [];
//   static int _requestCounter = 1;

//   // Get all items (for request forms)
//   Future<List<ItemModel>> getAllItems() async {
//     await Future.delayed(const Duration(milliseconds: 300));
    
//     // Mock items data - في التطبيق الحقيقي ستأتي من API
//     return [
//       const ItemModel(
//         id: '1',
//         name: 'منتج تجريبي 1',
//         barcode: '1234567890',
//         unit: 'قطعة',
//         price: 10.0,
//         stockQuantity: 100,
//       ),
//       const ItemModel(
//         id: '2',
//         name: 'منتج تجريبي 2',
//         barcode: '0987654321',
//         unit: 'كيلو',
//         price: 25.5,
//         stockQuantity: 50,
//       ),
//     ];
//   }

//   // Get all clients (for request forms)
//   Future<List<Client>> getAllClients() async {
//     await Future.delayed(const Duration(milliseconds: 300));
    
//     // Mock clients data - في التطبيق الحقيقي ستأتي من API
//     return [
//       const Client(
//         id: '1',
//         name: 'عميل تجريبي 1',
//         phone: '123456789',
//         address: 'عنوان تجريبي 1',
//         type: ClientType.individual,
//       ),
//       const Client(
//         id: '2',
//         name: 'عميل تجريبي 2',
//         phone: '987654321',
//         address: 'عنوان تجريبي 2',
//         type: ClientType.company,
//       ),
//     ];
//   }

//   // Get all requests
//   Future<List<dynamic>> getAllRequests() async {
//     await Future.delayed(const Duration(milliseconds: 500));
    
//     final allRequests = <dynamic>[];
//     allRequests.addAll(_loadRequests);
//     allRequests.addAll(_salesRequests);
    
//     // Sort by date descending
//     allRequests.sort((a, b) => b.date.compareTo(a.date));
    
//     return allRequests;
//   }

//   // Get requests by type
//   Future<List<dynamic>> getRequestsByType(RequestType type) async {
//     await Future.delayed(const Duration(milliseconds: 300));
    
//     switch (type) {
//       case RequestType.load:
//         return _loadRequests;
//       case RequestType.sales:
//         return _salesRequests;
//     }
//   }

//   // Get requests by status
//   Future<List<dynamic>> getRequestsByStatus(RequestStatus status) async {
//     await Future.delayed(const Duration(milliseconds: 300));
    
//     final allRequests = <dynamic>[];
//     allRequests.addAll(_loadRequests.where((r) => r.status == status));
//     allRequests.addAll(_salesRequests.where((r) => r.status == status));
    
//     return allRequests;
//   }

//   // Create load request
//   Future<LoadRequest> createLoadRequest({
//     required List<RequestItem> items,
//     required String notes,
//   }) async {
//     await Future.delayed(const Duration(milliseconds: 800));
    
//     final request = LoadRequest(
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       requestNumber: 'LR${_requestCounter.toString().padLeft(4, '0')}',
//       date: DateTime.now(),
//       status: RequestStatus.pending,
//       items: items,
//       notes: notes,
//       totalItems: items.fold(0, (sum, item) => sum + item.quantity),
//       createdAt: DateTime.now(),
//     );
    
//     _loadRequests.add(request);
//     _requestCounter++;
    
//     return request;
//   }

//   // Create sales request
//   Future<SalesRequest> createSalesRequest({
//     required Client client,
//     required List<RequestItem> items,
//     required double subtotal,
//     required double discount,
//     required double totalAmount,
//     required String notes,
//   }) async {
//     await Future.delayed(const Duration(milliseconds: 800));
    
//     final request = SalesRequest(
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       requestNumber: 'SR${_requestCounter.toString().padLeft(4, '0')}',
//       date: DateTime.now(),
//       status: RequestStatus.pending,
//       client: client,
//       items: items,
//       subtotal: subtotal,
//       discount: discount,
//       totalAmount: totalAmount,
//       notes: notes,
//       createdAt: DateTime.now(),
//     );
    
//     _salesRequests.add(request);
//     _requestCounter++;
    
//     return request;
//   }

//   // Update request status (for admin/manager)
//   Future<bool> updateRequestStatus({
//     required String requestId,
//     required RequestType type,
//     required RequestStatus status,
//     String? approvedBy,
//     String? rejectionReason,
//   }) async {
//     await Future.delayed(const Duration(milliseconds: 500));
    
//     switch (type) {
//       case RequestType.load:
//         final index = _loadRequests.indexWhere((r) => r.id == requestId);
//         if (index != -1) {
//           _loadRequests[index] = _loadRequests[index].copyWith(
//             status: status,
//             approvedBy: approvedBy,
//             approvedAt: status == RequestStatus.approved ? DateTime.now() : null,
//             rejectionReason: rejectionReason,
//             updatedAt: DateTime.now(),
//           );
//           return true;
//         }
//         break;
//       case RequestType.sales:
//         final index = _salesRequests.indexWhere((r) => r.id == requestId);
//         if (index != -1) {
//           _salesRequests[index] = _salesRequests[index].copyWith(
//             status: status,
//             approvedBy: approvedBy,
//             approvedAt: status == RequestStatus.approved ? DateTime.now() : null,
//             rejectionReason: rejectionReason,
//             updatedAt: DateTime.now(),
//           );
//           return true;
//         }
//         break;
//     }
    
//     return false;
//   }

//   // Search requests
//   Future<List<dynamic>> searchRequests(String query) async {
//     await Future.delayed(const Duration(milliseconds: 300));
    
//     if (query.isEmpty) {
//       return getAllRequests();
//     }
    
//     final allRequests = <dynamic>[];
//     allRequests.addAll(_loadRequests);
//     allRequests.addAll(_salesRequests);
    
//     return allRequests.where((request) {
//       final searchTerm = query.toLowerCase();
      
//       if (request is LoadRequest) {
//         return request.requestNumber.toLowerCase().contains(searchTerm) ||
//             request.notes.toLowerCase().contains(searchTerm);
//       } else if (request is SalesRequest) {
//         return request.requestNumber.toLowerCase().contains(searchTerm) ||
//             request.client.name.toLowerCase().contains(searchTerm) ||
//             request.notes.toLowerCase().contains(searchTerm);
//       }
      
//       return false;
//     }).toList();
//   }
// }
