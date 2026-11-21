import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../../data/model/return_invoice_model/return_invoice_model.dart';

class ReturnInvoiceSummaryDetails extends StatelessWidget {
  final ReturnInvoiceModel invoice;

  const ReturnInvoiceSummaryDetails({
    super.key,
    required this.invoice,
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
                  Icons.calculate_outlined,
                  color: AppColors.mainBlue,
                  size: 24.r,
                ),
                12.spacingHorizontal,
                Text(
                  'ملخص فاتورة المرتجع',
                  style: AppTextStyles.body18DarkBlueSemiBold,
                ),
              ],
            ),

            16.spacingVertical,

            // Summary Container
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: AppColors.fillColor,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.borderGray),
              ),
              child: Column(
                children: [
                  _buildSummaryRow(
                    'المجموع الفرعي',
                    DateTimeHelper.formatCurrency(invoice.subtotal),
                  ),

                  if (invoice.taxAmount != null && invoice.taxAmount! > 0) ...[
                    8.spacingVertical,
                    _buildSummaryRow(
                      'الضريبة',
                      DateTimeHelper.formatCurrency(invoice.taxAmount!),
                      valueColor: AppColors.warningOrange,
                    ),
                  ],

                  if (invoice.discountAmount != null &&
                      invoice.discountAmount! > 0) ...[
                    8.spacingVertical,
                    _buildSummaryRow(
                      'الخصم',
                      '- ${DateTimeHelper.formatCurrency(invoice.discountAmount!)}',
                      valueColor: AppColors.successGreen,
                    ),
                  ],

                  8.spacingVertical,
                  _buildSummaryRow(
                    'المجموع الإجمالي',
                    DateTimeHelper.formatCurrency(invoice.totalAmount),
                    isTotal: false,
                  ),

                  12.spacingVertical,
                  Divider(color: AppColors.borderGray, thickness: 1),
                  12.spacingVertical,

                  // Final Refund Amount
                  _buildSummaryRow(
                    'المبلغ المسترد',
                    DateTimeHelper.formatCurrency(invoice.refundAmount),
                    isTotal: true,
                    valueColor: AppColors.errorRed,
                  ),
                ],
              ),
            ),

            16.spacingVertical,

            // Additional Information
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.borderBlue),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: AppColors.mainBlue,
                        size: 16.r,
                      ),
                      8.spacingHorizontal,
                      Text(
                        'معلومات إضافية',
                        style: AppTextStyles.body14DarkBlueSemiBold.copyWith(
                          color: AppColors.mainBlue,
                        ),
                      ),
                    ],
                  ),
                  8.spacingVertical,
                  _buildInfoRow(
                    'عدد العناصر المرتجعة',
                    '${invoice.items.length} عنصر',
                  ),
                  _buildInfoRow(
                    'إجمالي الكمية المرتجعة',
                    '${invoice.items.fold(0, (sum, item) => sum + item.returnedQuantity)} وحدة',
                  ),
                  _buildInfoRow(
                    'متوسط نسبة الإرجاع',
                    '${_calculateAverageReturnPercentage().toStringAsFixed(1)}%',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isTotal = false,
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? AppTextStyles.body16DarkBlueSemiBold
              : AppTextStyles.body14GrayRegular,
        ),
        Text(
          value,
          style: isTotal
              ? AppTextStyles.body16DarkBlueSemiBold.copyWith(
                  color: valueColor ?? AppColors.errorRed,
                )
              : AppTextStyles.body14DarkBlueSemiBold.copyWith(
                  color: valueColor ?? AppColors.darkBlue,
                ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.caption12BlueRegular.copyWith(
              color: AppColors.mainBlue,
            ),
          ),
          Text(
            value,
            style: AppTextStyles.caption12BlueRegular.copyWith(
              color: AppColors.mainBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  double _calculateAverageReturnPercentage() {
    if (invoice.items.isEmpty) return 0.0;
    final totalPercentage = invoice.items.fold<double>(
      0.0,
      (sum, item) => sum + item.returnPercentage,
    );
    return totalPercentage / invoice.items.length;
  }
}
