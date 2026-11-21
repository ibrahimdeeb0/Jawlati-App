import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

class ReturnActionButtonsRow extends StatelessWidget {
  final VoidCallback onPrint;
  final VoidCallback onShare;

  const ReturnActionButtonsRow({
    super.key,
    required this.onPrint,
    required this.onShare,
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
            // Title
            Row(
              children: [
                Icon(
                  Icons.settings_outlined,
                  color: AppColors.mainBlue,
                  size: 24.r,
                ),
                12.spacingHorizontal,
                Text(
                  'الإجراءات المتاحة',
                  style: AppTextStyles.body18DarkBlueSemiBold,
                ),
              ],
            ),

            16.spacingVertical,

            // Primary Actions Row
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onPrint,
                    icon: Icon(Icons.print,
                        color: AppColors.textInverse, size: 18.r),
                    label: Text(
                      'طباعة',
                      style: AppTextStyles.button16WhiteSemiBold,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonPrimary,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                ),
                12.spacingHorizontal,
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onShare,
                    icon: Icon(Icons.share,
                        color: AppColors.textInverse, size: 18.r),
                    label: Text(
                      'مشاركة',
                      style: AppTextStyles.button16WhiteSemiBold,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonSecondary,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            16.spacingVertical,
          ],
        ),
      ),
    );
  }
}
