import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_item.freezed.dart';
part 'invoice_item.g.dart';

@freezed
abstract class InvoiceItem with _$InvoiceItem {
  const factory InvoiceItem({
    required String itemId,
    required String name,
    required String unit,
    required double price,
    required int quantity,
    required int stockQuantity,
    String? notes,
    double? discount,
    @Default(0) int quantityOfBonus,
    
    // Discount information
    double? originalPrice,
    double? discountAmount,
    String? discountDescription,
    String? appliedDiscountType,
    bool? isDiscountApplied,
  }) = _InvoiceItem;

  // حساب المجموع
  const InvoiceItem._();

  double get total => (price * quantity) - (discount ?? 0);
  double get subtotal => price * quantity;
  
  // Discount-aware calculations
  double get effectivePrice => originalPrice != null ? price : price;
  double get totalDiscountAmount => (discountAmount ?? 0) + (discount ?? 0);
  double get finalTotal => (effectivePrice * quantity) - totalDiscountAmount;

  factory InvoiceItem.fromJson(Map<String, dynamic> json) =>
      _$InvoiceItemFromJson(json);
}
