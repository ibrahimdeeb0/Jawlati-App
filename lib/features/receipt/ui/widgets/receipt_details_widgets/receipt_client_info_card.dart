import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../data/models/receipt_voucher_model/receipt_voucher_model.dart';

class ReceiptClientInfoCard extends StatelessWidget {
  final ReceiptVoucherModel receipt;

  const ReceiptClientInfoCard({
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
            'معلومات العميل',
            style: AppTextStyles.body16DarkBlueSemiBold,
          ),
          12.spacingVertical,
          _buildInfoRow('اسم العميل:', receipt.client.name),
          _buildInfoRow('رقم الهاتف:', receipt.client.phone),
          _buildInfoRow('العنوان:', receipt.client.address ?? 'غير محدد'),
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
            width: 90.w,
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
}
