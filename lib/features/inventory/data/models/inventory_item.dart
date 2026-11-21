import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_item.freezed.dart';
part 'inventory_item.g.dart';

@freezed
abstract class InventoryItem with _$InventoryItem {
  const factory InventoryItem({
    required String id,
    required String name,
    required String unit,
    required double systemQuantity,
    required double price,
    @Default(0.0) double auditQuantity,
    String? barcode,
    String? description,
    @Default(true) bool isActive,
  }) = _InventoryItem;

  factory InventoryItem.fromJson(Map<String, dynamic> json) =>
      _$InventoryItemFromJson(json);
}

extension InventoryItemExtension on InventoryItem {
  double get difference => auditQuantity - systemQuantity;
  
  bool get hasDifference => difference != 0;
  
  InventoryItem updateAuditQuantity(double newQuantity) {
    return copyWith(auditQuantity: newQuantity);
  }
}