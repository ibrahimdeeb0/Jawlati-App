import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../../data/model/return_invoice_item/return_invoice_item.dart';

class ReturnItemsTable extends StatelessWidget {
  final List<ReturnInvoiceItem> items;
  final Function(String) onDelete;
  final Function(String, int) onQuantityChanged;

  const ReturnItemsTable({
    super.key,
    required this.items,
    required this.onDelete,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: AppColors.backgroundPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.assignment_return, color: AppColors.mainBlue),
                8.horizontalSpace,
                Text(
                  'العناصر المرتجعة (${items.length})',
                  style: AppTextStyles.body16DarkBlueSemiBold,
                ),
              ],
            ),

            16.spacingVertical,

            // Header
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
              decoration: BoxDecoration(
                color: AppColors.fillColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text('الصنف',
                          style: AppTextStyles.body14DarkBlueSemiBold)),
                  Expanded(
                      flex: 1,
                      child: Text('الوحدة',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.body14DarkBlueSemiBold)),
                  Expanded(
                      flex: 2,
                      child: Text('الكمية',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.body14DarkBlueSemiBold)),
                  Expanded(
                      flex: 2,
                      child: Text('المبلغ',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.body14DarkBlueSemiBold)),
                  SizedBox(width: 40.w),
                ],
              ),
            ),

            8.spacingVertical,

            // Items
            ...items.map((item) => _buildItemRow(context, item)),
          ],
        ),
      ),
    );
  }

  Widget _buildReturnQuantityDropdown(ReturnInvoiceItem item) {
    // إنشاء قائمة الكميات المتاحة (من 1 إلى الكمية الأصلية)
    final List<int> availableQuantities =
        List.generate(item.originalQuantity, (index) => index + 1);

    return Container(
      width: 80.w,
      height: 35.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderGray),
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.backgroundPrimary,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          value: item.returnedQuantity,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 16.r,
            color: AppColors.mainBlue,
          ),
          style: AppTextStyles.body14DarkBlueRegular,
          dropdownColor: AppColors.backgroundPrimary,
          borderRadius: BorderRadius.circular(8.r),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          items: availableQuantities.map<DropdownMenuItem<int>>((int value) {
            return DropdownMenuItem<int>(
              value: value,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  value.toString(),
                  style: AppTextStyles.body14DarkBlueRegular,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList(),
          onChanged: (int? newValue) {
            if (newValue != null && newValue != item.returnedQuantity) {
              onQuantityChanged(item.itemId, newValue);
            }
          },
        ),
      ),
    );
  }

  Widget _buildItemRow(BuildContext context, ReturnInvoiceItem item) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderGray),
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.backgroundPrimary,
      ),
      child: Column(
        children: [
          Row(
            children: [
              // اسم الصنف
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: AppTextStyles.body14DarkBlueSemiBold,
                    ),
                    Text(
                      '${item.originalPrice.toStringAsFixed(2)} د.أ',
                      style: AppTextStyles.caption12GrayMedium,
                    ),
                  ],
                ),
              ),

              // الوحدة
              Expanded(
                flex: 1,
                child: Text(
                  item.unit,
                  style: AppTextStyles.body14DarkBlueRegular,
                  textAlign: TextAlign.center,
                ),
              ),

              // الكمية
              Expanded(
                flex: 2,
                child: Center(
                  child: _buildReturnQuantityDropdown(item),
                ),
              ),

              // المبلغ
              Expanded(
                flex: 2,
                child: Text(
                  '${item.returnTotal.toStringAsFixed(2)} د.أ',
                  style: AppTextStyles.body14DarkBlueSemiBold.copyWith(
                    color: AppColors.errorRed,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // حذف
              IconButton(
                onPressed: () => _showDeleteConfirmation(context, item.itemId),
                icon: Icon(Icons.delete_outline, color: AppColors.errorRed),
                constraints: BoxConstraints(minWidth: 40.w, minHeight: 40.h),
              ),
            ],
          ),
          if (item.returnReason != null) ...[
            4.spacingVertical,
            Row(
              children: [
                Icon(Icons.info_outline,
                    size: 16.r, color: AppColors.warningOrange),
                4.horizontalSpace,
                Expanded(
                  child: Text(
                    'السبب: ${item.returnReason}',
                    style: AppTextStyles.caption12GrayMedium.copyWith(
                      color: AppColors.warningOrange,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ],
          4.spacingVertical,
          Row(
            children: [
              Text(
                'من أصل ${item.originalQuantity} ${item.unit}',
                style: AppTextStyles.caption12GrayMedium,
              ),
              Spacer(),
              Text(
                '${item.returnPercentage.toStringAsFixed(1)}% من الكمية الأصلية',
                style: AppTextStyles.caption12GrayMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, String itemId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: const Text('تأكيد الحذف'),
            content: const Text(
                'هل أنت متأكد من حذف هذا العنصر من قائمة المرتجعات؟'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'إلغاء',
                  style: TextStyle(color: AppColors.gray),
                ),
              ),
              TextButton(
                onPressed: () {
                  onDelete(itemId);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'حذف',
                  style: TextStyle(color: AppColors.errorRed),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
