import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

class AddItemCard extends StatelessWidget {
  final VoidCallback onAddPressed;
  final VoidCallback onScanBarcode;

  const AddItemCard({
    super.key,
    required this.onAddPressed,
    required this.onScanBarcode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.backgroundPrimary,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.borderGray.colorWithOpacity(0.25),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.inventory_2, color: AppColors.mainOrange),
                  SizedBox(width: 8.w),
                  Text('إضافة مادة',
                      style: AppTextStyles.body18DarkBlueSemiBold),
                ],
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainBlue,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: onAddPressed,
                icon: const Icon(Icons.add, color: Colors.white),
                label:
                    Text('إضافة', style: AppTextStyles.button16WhiteSemiBold),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: onScanBarcode,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.borderGray),
              ),
              child: Row(
                children: [
                  const Icon(Icons.qr_code, color: AppColors.gray),
                  SizedBox(width: 8.w),
                  Text(
                    'مسح الباركود أو البحث السريع...',
                    style: AppTextStyles.body16GrayMedium,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
