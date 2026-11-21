import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../../data/model/invoice/invoice_model.dart';

class InvoiceSummaryDetails extends StatelessWidget {
  final InvoiceModel invoice;

  const InvoiceSummaryDetails({
    super.key,
    required this.invoice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.backgroundPrimary,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.borderGray.colorWithOpacity(0.3),
        ),
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
                _buildSummaryRow(
                  'عدد المواد:',
                  '${invoice.items.length} مادة',
                ),
                SizedBox(height: 8.h),
                _buildSummaryRow(
                  'المجموع الفرعي:',
                  DateTimeHelper.formatCurrency(invoice.subtotal),
                ),
                // يمكن إضافة الضريبة والخصم والبونص هنا عند توفرها
                SizedBox(height: 12.h),
                Divider(color: AppColors.borderGray.colorWithOpacity(0.5)),
                SizedBox(height: 8.h),
                _buildSummaryRow(
                  'المجموع الإجمالي:',
                  DateTimeHelper.formatCurrency(invoice.totalAmount),
                  isTotal: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? AppTextStyles.body16DarkBlueSemiBold
              : AppTextStyles.body14DarkBlueRegular,
        ),
        Text(
          value,
          style: isTotal
              ? AppTextStyles.body16DarkBlueSemiBold.copyWith(
                  color: AppColors.mainBlue,
                )
              : AppTextStyles.body14DarkBlueRegular,
        ),
      ],
    );
  }

}
