import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/helpers/date_time_helper.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';
import 'package:jawlati/core/widgets/displays/status_chip.dart';

import '../../../../data/model/enums.dart';
import '../../../../data/model/return_invoice_model/return_invoice_model.dart';

class ReturnInvoiceInfoCard extends StatelessWidget {
  final ReturnInvoiceModel invoice;

  const ReturnInvoiceInfoCard({
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
                  Icons.assignment_return,
                  color: AppColors.mainBlue,
                  size: 24.r,
                ),
                12.spacingHorizontal,
                Expanded(
                  child: Text(
                    'معلومات فاتورة المرتجع',
                    style: AppTextStyles.body18DarkBlueSemiBold,
                  ),
                ),
                _buildStatusChip(invoice.status),
              ],
            ),

            16.spacingVertical,

            // Invoice Information
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: AppColors.fillColor,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.borderGray),
              ),
              child: Column(
                children: [
                  _buildInfoRow(
                    'رقم فاتورة المرتجع',
                    invoice.returnInvoiceNumber ?? invoice.id,
                  ),
                  8.spacingVertical,
                  _buildInfoRow(
                    'تاريخ الإنشاء',
                    DateTimeHelper.formatInvoiceDate(invoice.createdAt),
                  ),
                  if (invoice.originalInvoiceNumber != null) ...[
                    8.spacingVertical,
                    _buildInfoRow(
                      'الفاتورة الأصلية',
                      invoice.originalInvoiceNumber!,
                      valueColor: AppColors.successGreen,
                    ),
                  ],
                  8.spacingVertical,
                  _buildInfoRow(
                    'سبب المرتجع',
                    invoice.returnReason.displayName,
                    valueColor: AppColors.warningOrange,
                  ),
                  if (invoice.processedBy != null) ...[
                    8.spacingVertical,
                    _buildInfoRow(
                      'تم المعالجة بواسطة',
                      invoice.processedBy!,
                      valueColor: AppColors.successGreen,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {Color? valueColor}) {
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
            style: AppTextStyles.body14DarkBlueSemiBold.copyWith(
              color: valueColor ?? AppColors.darkBlue,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusChip(ReturnInvoiceStatus status) {
    switch (status) {
      case ReturnInvoiceStatus.draft:
        return StatusChip.neutral(
          text: status.displayName,
          icon: Icons.edit_outlined,
        );
      case ReturnInvoiceStatus.confirmed:
        return StatusChip.info(
          text: status.displayName,
          icon: Icons.check_outlined,
        );
      case ReturnInvoiceStatus.processed:
        return StatusChip.success(
          text: status.displayName,
          icon: Icons.done_all_outlined,
        );
      case ReturnInvoiceStatus.cancelled:
        return StatusChip.error(
          text: status.displayName,
          icon: Icons.cancel_outlined,
        );
    }
  }
}
