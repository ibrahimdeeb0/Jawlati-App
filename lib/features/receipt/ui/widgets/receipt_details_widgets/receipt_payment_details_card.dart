import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../data/models/receipt_voucher_model/receipt_voucher_model.dart';

class ReceiptPaymentDetailsCard extends StatelessWidget {
  final ReceiptVoucherModel receipt;

  const ReceiptPaymentDetailsCard({
    super.key,
    required this.receipt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.colorWithOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'تفاصيل الدفع',
            style: AppTextStyles.body16DarkBlueSemiBold,
          ),
          12.spacingVertical,
          _buildInfoRow('المبلغ:', '${receipt.amount.toStringAsFixed(2)} دينار'),
          _buildInfoRow('نوع السند:', receipt.receiptType.displayName),
          
          // Show cheque details if receipt has cheque information
          if (receipt.chequeNumber != null || receipt.bankName != null) ...[
            12.spacingVertical,
            Text(
              'تفاصيل الشيك',
              style: AppTextStyles.body14DarkBlueSemiBold,
            ),
            8.spacingVertical,
            if (receipt.chequeNumber != null)
              _buildInfoRow('رقم الشيك:', receipt.chequeNumber!),
            if (receipt.bankName != null)
              _buildInfoRow('اسم البنك:', receipt.bankName!),
            if (receipt.chequeMaturityDate != null)
              _buildInfoRow('تاريخ الاستحقاق:', _formatDate(receipt.chequeMaturityDate!)),
          ],
          
          if (receipt.notes != null && receipt.notes!.isNotEmpty) ...[
            12.spacingVertical,
            Text(
              'ملاحظات',
              style: AppTextStyles.body14DarkBlueSemiBold,
            ),
            8.spacingVertical,
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: AppColors.lightGray.colorWithOpacity(0.3),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                receipt.notes!,
                style: AppTextStyles.body14DarkBlueMedium,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          SizedBox(
            width: 110.w,
            child: Text(
              label,
              style: AppTextStyles.body14DarkBlueMedium.copyWith(
                color: AppColors.gray,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.body14DarkBlueMedium,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}