
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_invoice_item.freezed.dart';
part 'return_invoice_item.g.dart';

@freezed
abstract class ReturnInvoiceItem with _$ReturnInvoiceItem {
  const factory ReturnInvoiceItem({
    required String itemId,
    required String name,
    required String unit,
    required double originalPrice, // السعر في الفاتورة الأصلية
    required int returnedQuantity, // الكمية المرتجعة
    required int originalQuantity, // الكمية الأصلية
    String? returnReason, // سبب إرجاع هذا الصنف
    String? notes,
    @Default(false) bool isDamaged, // هل السلعة تالفة؟
    DateTime? expiryDate, // تاريخ انتهاء الصلاحية إن وجد
  }) = _ReturnInvoiceItem;

  const ReturnInvoiceItem._();

  // حساب المجموع المرتجع
  double get returnTotal => originalPrice * returnedQuantity;
  
  // نسبة الإرجاع
  double get returnPercentage => (returnedQuantity / originalQuantity) * 100;

  factory ReturnInvoiceItem.fromJson(Map<String, dynamic> json) =>
      _$ReturnInvoiceItemFromJson(json);
}
