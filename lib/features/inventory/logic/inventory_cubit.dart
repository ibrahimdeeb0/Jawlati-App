import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawlati/core/networking/api_result.dart';
import '../data/models/inventory_item.dart';
import '../data/models/audit_request.dart';
import '../data/repositories/inventory_repository.dart';
import 'inventory_state.dart';

class InventoryCubit extends Cubit<InventoryState> {
  final InventoryRepository _repository;
  List<InventoryItem> _allItems = [];

  InventoryCubit(this._repository) : super(const InventoryState.initial());

  Future<void> loadItems() async {
    emit(const InventoryState.loading());

    final result = await _repository.getAllItems();
    result.maybeWhen(
      success: (items) {
        _allItems = items;
        emit(InventoryState.loaded(items));
      },
      failure: (error) => emit(InventoryState.error(error)),
      orElse: () => emit(const InventoryState.error('Unknown error')),
    );
  }

  void filterItems(String query) {
    if (query.isEmpty) {
      emit(InventoryState.loaded(_allItems));
    } else {
      final filteredItems = _allItems
          .where((item) =>
              item.name.toLowerCase().contains(query.toLowerCase()) ||
              item.unit.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(InventoryState.loaded(filteredItems));
    }
  }

  void updateItemAuditQuantity(String itemId, double quantity) {
    state.whenOrNull(
      loaded: (items) {
        final updatedItems = _allItems.map((item) {
          if (item.id == itemId) {
            return item.updateAuditQuantity(quantity);
          }
          return item;
        }).toList();

        _allItems = updatedItems;
        emit(InventoryState.loaded(updatedItems));
      },
    );
  }

  Future<void> submitAudit() async {
    await state.whenOrNull(
      loaded: (items) async {
        emit(InventoryState.submitting(_allItems));

        final auditItems = _allItems
            .map(
              (item) =>
                  AuditItem(itemId: item.id, auditQuantity: item.auditQuantity),
            )
            .toList();

        final request = AuditRequest(
          items: auditItems,
          auditDate: DateTime.now(),
        );

        final result = await _repository.submitAudit(request);
        result.maybeWhen(
          success: (_) => emit(InventoryState.submitted(_allItems)),
          failure: (error) => emit(InventoryState.error(error)),
          orElse: () => emit(const InventoryState.error('Unknown error')),
        );
      },
    );
  }

  bool get canSubmitAudit {
    return _allItems.any((item) => item.auditQuantity > 0);
  }
}
