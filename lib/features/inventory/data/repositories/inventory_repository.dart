import '../models/inventory_item.dart';
import '../models/audit_request.dart';
import '../../../../core/networking/api_result.dart';

abstract class InventoryRepository {
  Future<ApiResult<List<InventoryItem>>> getAllItems();
  Future<ApiResult<void>> submitAudit(AuditRequest request);
}

class InventoryRepositoryImpl implements InventoryRepository {
  @override
  Future<ApiResult<List<InventoryItem>>> getAllItems() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      
      final mockItems = [
        InventoryItem(
          id: '1',
          name: 'منتج أ',
          unit: 'قطعة',
          systemQuantity: 100.0,
          price: 50.0,
        ),
        InventoryItem(
          id: '2',
          name: 'منتج ب',
          unit: 'كيلو',
          systemQuantity: 75.5,
          price: 25.5,
        ),
        InventoryItem(
          id: '3',
          name: 'منتج ج',
          unit: 'بكيت',
          systemQuantity: 200.0,
          price: 15.0,
        ),
      ];
      
      return ApiResult.success(mockItems);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  @override
  Future<ApiResult<void>> submitAudit(AuditRequest request) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}