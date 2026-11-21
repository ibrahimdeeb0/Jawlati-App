import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../../data/model/return_invoice_model/return_invoice_model.dart';


class ReturnClientInfoCard extends StatelessWidget {
  final ReturnInvoiceModel invoice;

  const ReturnClientInfoCard({
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
                  Icons.person_outline,
                  color: AppColors.mainBlue,
                  size: 24.r,
                ),
                12.spacingHorizontal,
                Text(
                  'معلومات العميل',
                  style: AppTextStyles.body18DarkBlueSemiBold,
                ),
              ],
            ),

            16.spacingVertical,

            // Client Information
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: AppColors.fillColor,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.borderGray),
              ),
              child: Column(
                children: [
                  _buildInfoRow('اسم العميل', invoice.clientName),
                  8.spacingVertical,
                  _buildInfoRow('معرف العميل', invoice.clientId),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.body14GrayRegular,
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.body14DarkBlueSemiBold,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
