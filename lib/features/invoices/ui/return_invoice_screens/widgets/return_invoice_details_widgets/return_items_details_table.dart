import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../../data/model/return_invoice_item/return_invoice_item.dart';

class ReturnItemsDetailsTable extends StatelessWidget {
  final List<ReturnInvoiceItem> items;

  const ReturnItemsDetailsTable({
    super.key,
    required this.items,
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
            // Title Row
            Row(
              children: [
                Icon(
                  Icons.inventory_2_outlined,
                  color: AppColors.mainBlue,
                  size: 24.r,
                ),
                12.spacingHorizontal,
                Text(
                  'العناصر المرتجعة',
                  style: AppTextStyles.body18DarkBlueSemiBold,
                ),
              ],
            ),

            16.spacingVertical,

            // Table Header
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Expanded(
                      flex: 3, child: Text('الصنف', style: _headerStyle())),
                  Expanded(
                      flex: 2, child: Text('الكمية', style: _headerStyle())),
                  Expanded(
                      flex: 2, child: Text('السعر', style: _headerStyle())),
                  Expanded(
                      flex: 2, child: Text('المجموع', style: _headerStyle())),
                ],
              ),
            ),

            8.spacingVertical,

            // Table Items
            ...items.asMap().entries.map(
              (entry) {
                final index = entry.key;
                final item = entry.value;
                return Container(
                  margin: EdgeInsets.only(bottom: 8.h),
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: index.isEven
                        ? AppColors.fillColor
                        : AppColors.backgroundPrimary,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.borderGray),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // Item Name and Details
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
                                  item.unit,
                                  style: AppTextStyles.caption12GrayMedium,
                                ),
                              ],
                            ),
                          ),

                          // Quantity
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text(
                                  '${item.returnedQuantity}',
                                  style: AppTextStyles.body14DarkBlueSemiBold,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'من ${item.originalQuantity}',
                                  style: AppTextStyles.caption12GrayMedium,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),

                          // Price
                          Expanded(
                            flex: 2,
                            child: Text(
                              DateTimeHelper.formatCurrency(item.originalPrice),
                              style: AppTextStyles.body14DarkBlueRegular,
                              textAlign: TextAlign.center,
                            ),
                          ),

                          // Total
                          Expanded(
                            flex: 2,
                            child: Text(
                              DateTimeHelper.formatCurrency(item.returnTotal),
                              style:
                                  AppTextStyles.body14DarkBlueSemiBold.copyWith(
                                color: AppColors.errorRed,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),

                      // Return Reason and Percentage
                      if (item.returnReason != null ||
                          item.returnPercentage < 100) ...[
                        8.spacingVertical,
                        Row(
                          children: [
                            if (item.returnReason != null) ...[
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                    color: AppColors.warningOrange
                                        .colorWithOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  child: Text(
                                    'السبب: ${item.returnReason}',
                                    style: AppTextStyles.caption12BlueRegular
                                        .copyWith(
                                      color: AppColors.warningOrange,
                                    ),
                                  ),
                                ),
                              ),
                              8.spacingHorizontal,
                            ],
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: AppColors.successGreen
                                    .colorWithOpacity(0.1),
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Text(
                                '${item.returnPercentage.toStringAsFixed(1)}% مرتجع',
                                style:
                                    AppTextStyles.caption12BlueRegular.copyWith(
                                  color: AppColors.successGreen,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _headerStyle() {
    return AppTextStyles.body14DarkBlueSemiBold;
  }
}
