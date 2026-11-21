import 'package:freezed_annotation/freezed_annotation.dart';

part 'discount_rule.freezed.dart';
part 'discount_rule.g.dart';

@freezed
abstract class DiscountRule with _$DiscountRule {
  const factory DiscountRule({
    required String discountType,
    required String itemNo,
    required String description,
    
    // Type 1 & 2: Direct price override
    double? itemNoNewPrice,
    
    // Type 2, 3 & 4: Minimum quantity condition
    int? itemNoMinQty,
    
    // Type 3: Buy A get B free
    String? itemNo2ndItemNo,
    int? itemNo2ndQty,
    
    // Type 4: Linked item discount
    String? linkedItemNo,
    double? linkedItemNewPrice,
  }) = _DiscountRule;

  const DiscountRule._();

  // Helper getters for discount types
  bool get isDirectPriceOverride => discountType == "1";
  bool get isConditionalPriceDrop => discountType == "2";
  bool get isBuyAGetBFree => discountType == "3";
  bool get isLinkedItemDiscount => discountType == "4";

  // Validation helpers
  bool get isValid {
    switch (discountType) {
      case "1":
        return itemNoNewPrice != null;
      case "2":
        return itemNoNewPrice != null && itemNoMinQty != null;
      case "3":
        return itemNoMinQty != null && 
               itemNo2ndItemNo != null && 
               itemNo2ndQty != null;
      case "4":
        return itemNoMinQty != null && 
               linkedItemNo != null && 
               linkedItemNewPrice != null;
      default:
        return false;
    }
  }

  factory DiscountRule.fromJson(Map<String, dynamic> json) =>
      _$DiscountRuleFromJson(json);
}