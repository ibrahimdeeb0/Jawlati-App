import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../data/models/sales_request/sales_request.dart';

class RequestSummarySection extends StatelessWidget {
  final dynamic request;

  const RequestSummarySection({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    if (request is! SalesRequest) {
      return const SizedBox.shrink();
    }

    final salesRequest = request as SalesRequest;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.receipt_long_outlined,
                  size: 24.r,
                  color: AppColors.mainBlue,
                ),
                12.spacingHorizontal,
                Text(
                  'ملخص الطلب',
                  style: AppTextStyles.heading20BlackBold,
                ),
              ],
            ),
            16.spacingVertical,
            _buildSummaryContent(salesRequest),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryContent(SalesRequest salesRequest) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          _buildSummaryRow(
            label: 'المجموع الفرعي',
            value: '${salesRequest.subtotal.toStringAsFixed(2)} د.أ',
            isSubtotal: true,
          ),
          12.spacingVertical,
          _buildSummaryRow(
            label: 'الخصم',
            value: '${salesRequest.discount.toStringAsFixed(2)} د.أ',
            isDiscount: true,
          ),
          16.spacingVertical,
          Container(
            height: 1.h,
            width: double.infinity,
            color: AppColors.gray.colorWithOpacity(0.3),
          ),
          16.spacingVertical,
          _buildSummaryRow(
            label: 'المبلغ الإجمالي',
            value: '${salesRequest.totalAmount.toStringAsFixed(2)} د.أ',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow({
    required String label,
    required String value,
    bool isSubtotal = false,
    bool isDiscount = false,
    bool isTotal = false,
  }) {
    TextStyle labelStyle;
    TextStyle valueStyle;

    if (isTotal) {
      labelStyle = AppTextStyles.heading20BlackBold;
      valueStyle = AppTextStyles.heading20BlackBold.copyWith(
        color: AppColors.mainBlue,
      );
    } else if (isDiscount) {
      labelStyle = AppTextStyles.body16GrayMedium;
      valueStyle = AppTextStyles.body16GrayMedium.copyWith(
        color: AppColors.red,
        fontWeight: FontWeight.w600,
      );
    } else {
      labelStyle = AppTextStyles.body16GrayMedium;
      valueStyle = AppTextStyles.body16DarkBlueSemiBold;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: labelStyle,
        ),
        Text(
          value,
          style: valueStyle,
        ),
      ],
    );
  }
}
