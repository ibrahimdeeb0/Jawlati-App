import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/inventory_item.dart';

part 'inventory_state.freezed.dart';

@freezed
abstract class InventoryState with _$InventoryState {
  const factory InventoryState.initial() = _Initial;
  const factory InventoryState.loading() = _Loading;
  const factory InventoryState.loaded(List<InventoryItem> items) = _Loaded;
  const factory InventoryState.submitting(List<InventoryItem> items) = _Submitting;
  const factory InventoryState.submitted(List<InventoryItem> items) = _Submitted;
  const factory InventoryState.error(String message) = _Error;
}