import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/index.dart';

import '../../../../data/model/invoice_item/invoice_item.dart';
import 'item_details_bottom_sheet.dart';

class InvoiceItemsTable extends StatelessWidget {
  final List<InvoiceItem> items;
  final void Function(int index)? onDelete;
  final void Function(int index, int newQty)? onChangedItemQty;
  final void Function(int index, int bonusQty)? onChangedBonusQty;

  const InvoiceItemsTable({
    super.key,
    required this.items,
    this.onDelete,
    this.onChangedItemQty,
    this.onChangedBonusQty,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundPrimary,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.borderGray.colorWithOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.mainBlue, AppColors.darkBlue],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
              ),
              child: Row(
                children: [
                  Icon(Icons.inventory_2, color: Colors.white, size: 20.r),
                  SizedBox(width: 8.w),
                  Text(
                    'المواد المضافة (${items.length})',
                    style: AppTextStyles.body18WhiteSemiBold,
                  ),
                ],
              ),
            ),

            // Table Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.backgroundSecondary.colorWithOpacity(0.5),
              ),
              child: Row(
                children: [
                  Expanded(flex: 3, child: _headerText('اسم المادة')),
                  Expanded(flex: 2, child: _headerText('الوحدة')),
                  Expanded(flex: 2, child: _headerText('الكمية')),
                  Expanded(flex: 2, child: _headerText('السعر')),
                  Expanded(flex: 2, child: _headerText('الإجمالي')),
                  SizedBox(width: 30.w), // Space for delete button
                ],
              ),
            ),

            // Items List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _getExpandedItemCount(),
              separatorBuilder: (context, index) {
                return _buildItemRowDivider(context, index);
              },
              itemBuilder: (context, index) {
                return _buildExpandedItemRow(context, index);
              },
            ),

            // Total Section
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: AppColors.backgroundSecondary.colorWithOpacity(0.3),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'المجموع الفرعي:',
                    style: AppTextStyles.body16DarkBlueSemiBold,
                  ),
                  Text(
                    '${_calculateTotal().toStringAsFixed(2)} د.أ',
                    style: AppTextStyles.body18DarkBlueSemiBold.copyWith(
                      color: AppColors.mainBlue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemRow(BuildContext context, InvoiceItem item, int index) {
    return Material(
      color: AppColors.fillColor.colorWithOpacity(0.3),
      child: InkWell(
        onTap: () {
          AppBottomSheet.showModal(
            context: context,
            title: 'تفاصيل المادة',
            content: ItemDetailsBottomSheet(
              item: item,
              itemIndex: index,
              onBonusQuantityChanged: (bonusQty) {
                onChangedBonusQty?.call(index, bonusQty);
                Navigator.of(context).pop();
              },
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.mainBlue,
                    size: 20.r,
                  ),
                  4.spacingHorizontal,

                  // Item Name with discount info
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: AppTextStyles.body14DarkBlueRegular,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  // Unit
                  Expanded(
                    flex: 2,
                    child: Text(
                      item.unit,
                      style: AppTextStyles.caption12GrayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // Quantity with dropdown
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: QuantityDropdown(
                        value: item.quantity,
                        min: 1,
                        max: item.stockQuantity - item.quantityOfBonus,
                        onChanged: (newQty) {
                          onChangedItemQty?.call(index, newQty);
                        },
                      ),
                    ),
                  ),

                  // Price with discount indicator
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (item.isDiscountApplied == true &&
                            item.originalPrice != null) ...[
                          Text(
                            item.originalPrice!.toStringAsFixed(2),
                            style: AppTextStyles.caption12GrayMedium.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: AppColors.gray,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            item.price.toStringAsFixed(2),
                            style: AppTextStyles.body14DarkBlueRegular.copyWith(
                              color: AppColors.green,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ] else
                          Text(
                            item.price.toStringAsFixed(2),
                            style: AppTextStyles.body14DarkBlueRegular,
                            textAlign: TextAlign.center,
                          ),
                      ],
                    ),
                  ),

                  // Total with discount indicator
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (item.isDiscountApplied == true &&
                            item.totalDiscountAmount > 0) ...[
                          Text(
                            (item.subtotal).toStringAsFixed(2),
                            style: AppTextStyles.caption12GrayMedium.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: AppColors.gray,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            item.finalTotal.toStringAsFixed(2),
                            style: AppTextStyles.body14DarkBlueSemiBold
                                .copyWith(
                                  color: AppColors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ] else
                          Text(
                            item.finalTotal.toStringAsFixed(2),
                            style: AppTextStyles.body14DarkBlueSemiBold
                                .copyWith(color: AppColors.mainBlue),
                            textAlign: TextAlign.center,
                          ),
                      ],
                    ),
                  ),

                  // Delete button
                  SizedBox(
                    width: 40.w,
                    child: IconButton(
                      onPressed: () => onDelete?.call(index),
                      icon: Icon(
                        Icons.delete_outline,
                        color: AppColors.red,
                        size: 20.r,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.red.colorWithOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (item.isDiscountApplied == true &&
                  item.discountDescription != null) ...[
                2.spacingVertical,
                Row(
                  children: [
                    Icon(Icons.local_offer, size: 12.r, color: AppColors.green),
                    4.spacingHorizontal,
                    Expanded(
                      child: Text(
                        item.discountDescription!,
                        style: AppTextStyles.caption12GrayMedium.copyWith(
                          color: AppColors.green,
                          fontStyle: FontStyle.italic,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerText(String text) {
    return Text(
      text,
      style: AppTextStyles.body14DarkBlueSemiBold,
      textAlign: TextAlign.center,
    );
  }

  double _calculateTotal() {
    return items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  int _getExpandedItemCount() {
    int count = 0;
    for (final item in items) {
      count++; // Main item
      if (item.quantityOfBonus > 0) {
        count++; // Bonus item
      }
    }
    return count;
  }

  Widget _buildExpandedItemRow(BuildContext context, int expandedIndex) {
    int currentExpandedIndex = 0;

    for (int i = 0; i < items.length; i++) {
      final item = items[i];

      if (currentExpandedIndex == expandedIndex) {
        return _buildItemRow(context, item, i);
      }
      currentExpandedIndex++;

      if (item.quantityOfBonus > 0) {
        if (currentExpandedIndex == expandedIndex) {
          return _buildBonusRow(context, item, i);
        }
        currentExpandedIndex++;
      }
    }

    return const SizedBox.shrink();
  }

  Widget _buildBonusRow(BuildContext context, InvoiceItem item, int index) {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.fillColor.colorWithOpacity(0.1),
        ),
        child: Row(
          children: [
            // Bonus Item Name with indent
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  // SizedBox(width: 20.w), // Indent for bonus items
                  Icon(Icons.card_giftcard, color: AppColors.green, size: 16.r),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      // 'بونص - ${item.name}',
                      'بونص',
                      style: AppTextStyles.caption12GrayMedium.copyWith(
                        color: AppColors.green,
                        fontStyle: FontStyle.italic,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            // Unit
            Expanded(
              flex: 1,
              child: Text(
                item.unit,
                style: AppTextStyles.caption12GrayMedium,
                textAlign: TextAlign.center,
              ),
            ),

            // Bonus Quantity (non-editable)
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.green.colorWithOpacity(0.1),
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(
                    color: AppColors.green.colorWithOpacity(0.3),
                  ),
                ),
                child: Text(
                  item.quantityOfBonus.toString(),
                  style: AppTextStyles.caption12GrayMedium.copyWith(
                    color: AppColors.green,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // Price (Free)
            Expanded(
              flex: 2,
              child: Text(
                'مجاني',
                style: AppTextStyles.caption12GrayMedium.copyWith(
                  color: AppColors.green,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Total (Free)
            Expanded(
              flex: 2,
              child: Text(
                '0.00',
                style: AppTextStyles.caption12GrayMedium.copyWith(
                  color: AppColors.green,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Delete button for bonus
            SizedBox(
              width: 40.w,
              child: IconButton(
                onPressed: () => onChangedBonusQty?.call(index, 0),
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: AppColors.red,
                  size: 18.r,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.red.colorWithOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemRowDivider(BuildContext context, int expandedIndex) {
    int currentExpandedIndex = 0;

    for (int i = 0; i < items.length; i++) {
      final item = items[i];

      if (currentExpandedIndex == expandedIndex) {
        return (item.quantityOfBonus > 0)
            ? SizedBox.shrink()
            : Divider(
                height: 1,
                color: AppColors.borderGray.colorWithOpacity(0.6),
              );
      }
      currentExpandedIndex++;

      if (item.quantityOfBonus > 0) {
        if (currentExpandedIndex == expandedIndex) {
          return Divider(
            height: 1,
            color: AppColors.green.colorWithOpacity(0.5),
          );
        }
        currentExpandedIndex++;
      }
    }

    return const SizedBox.shrink();
  }
}
