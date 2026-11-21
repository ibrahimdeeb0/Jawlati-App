import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

class InvoiceSummaryCard extends StatelessWidget {
  final int itemCount;
  final double subtotal;
  final double totalAmount;
  final double taxAmount;
  final double discountAmount;
  final double bonusAmount;

  const InvoiceSummaryCard({
    super.key,
    required this.itemCount,
    required this.subtotal,
    required this.totalAmount,
    this.taxAmount = 0.0,
    this.discountAmount = 0.0,
    this.bonusAmount = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.all(16.r),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Icon(Icons.calculate_outlined, color: AppColors.mainOrange),
                SizedBox(width: 8.w),
                Text(
                  "الملخص المالي",
                  style: AppTextStyles.body18DarkBlueSemiBold,
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // Financial Summary
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: AppColors.backgroundSecondary.colorWithOpacity(0.3),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppColors.borderGray.colorWithOpacity(0.3),
                ),
              ),
              child: Column(
                children: [
                  _summaryLine(label: "عدد المواد", value: "$itemCount مادة"),
                  SizedBox(height: 8.h),
                  _summaryLine(
                    label: "المجموع الفرعي",
                    value: "${subtotal.toStringAsFixed(2)} د.أ",
                  ),
                  if (taxAmount > 0) ...[
                    SizedBox(height: 8.h),
                    _summaryLine(
                      label: "الضريبة",
                      value: "${taxAmount.toStringAsFixed(2)} د.أ",
                    ),
                  ],
                  if (discountAmount > 0) ...[
                    SizedBox(height: 8.h),
                    _summaryLine(
                      label: "الخصم",
                      value: "${discountAmount.toStringAsFixed(2)} د.أ",
                      valueColor: AppColors.red,
                    ),
                  ],
                  if (bonusAmount > 0) ...[
                    SizedBox(height: 8.h),
                    _summaryLine(
                      label: "البونص",
                      value: "${bonusAmount.toStringAsFixed(2)} د.أ",
                      valueColor: AppColors.green,
                    ),
                  ],
                  SizedBox(height: 12.h),
                  Divider(color: AppColors.borderGray.colorWithOpacity(0.5)),
                  SizedBox(height: 8.h),
                  _summaryLine(
                    label: "المجموع الإجمالي",
                    value: "${totalAmount.toStringAsFixed(2)} د.أ",
                    isBold: true,
                    valueColor: AppColors.mainBlue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryLine({
    required String label,
    required String value,
    bool isBold = false,
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.body14DarkBlueRegular),
        Text(
          value,
          style: isBold
              ? AppTextStyles.body16DarkBlueSemiBold.copyWith(color: valueColor)
              : AppTextStyles.body14DarkBlueRegular.copyWith(color: valueColor),
        ),
      ],
    );
  }
}
