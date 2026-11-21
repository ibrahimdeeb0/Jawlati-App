import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../../data/models/receipt_voucher_model/receipt_voucher_model.dart';

class ReceiptActionButtons extends StatelessWidget {
  final ReceiptVoucherModel receipt;
  final VoidCallback onPrint;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ReceiptActionButtons({
    super.key,
    required this.receipt,
    required this.onPrint,
    required this.onEdit,
    required this.onDelete,
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
            'إجراءات',
            style: AppTextStyles.body16DarkBlueSemiBold,
          ),
          16.spacingVertical,
          Row(
            children: [
              Expanded(
                child: _buildActionButton(
                  onPressed: onPrint,
                  icon: Icons.print,
                  label: 'طباعة',
                  color: AppColors.infoBlue,
                ),
              ),
              12.spacingHorizontal,
              // Expanded(
              //   child: _buildActionButton(
              //     onPressed: onEdit,
              //     icon: Icons.edit,
              //     label: 'تعديل',
              //     color: AppColors.warningOrange,
              //   ),
              // ),
              // 12.spacingHorizontal,
              // Expanded(
              //   child: _buildActionButton(
              //     onPressed: onDelete,
              //     icon: Icons.delete,
              //     label: 'حذف',
              //     color: AppColors.errorRed,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        elevation: 0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20.r),
          4.spacingVertical,
          Text(
            label,
            style: AppTextStyles.body14DarkBlueRegular.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
