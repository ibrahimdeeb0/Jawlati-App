import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

class ReturnCompanyHeaderCard extends StatelessWidget {
  const ReturnCompanyHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: AppColors.backgroundPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            // Company Logo and Name
            Row(
              children: [
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.mainBlue.colorWithOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.business,
                    color: AppColors.mainBlue,
                    size: 24.r,
                  ),
                ),
                16.spacingHorizontal,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'شركة توزيع تجريبية',
                        style: AppTextStyles.body18DarkBlueSemiBold,
                      ),
                      Text(
                        'Demo Distribution Company',
                        style: AppTextStyles.body14GrayRegular,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            16.spacingVertical,

            // Company Details
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: AppColors.fillColor,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.borderGray),
              ),
              child: Column(
                children: [
                  _buildCompanyInfoRow(
                    Icons.location_on_outlined,
                    'العنوان',
                    'نابلس - فلسطين',
                  ),
                  8.spacingVertical,
                  _buildCompanyInfoRow(
                    Icons.phone_outlined,
                    'الهاتف',
                    '+970 9 123 4567',
                  ),
                  8.spacingVertical,
                  _buildCompanyInfoRow(
                    Icons.email_outlined,
                    'البريد الإلكتروني',
                    'demo@example.com',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16.r, color: AppColors.mainBlue),
        8.spacingHorizontal,
        Text(
          '$label: ',
          style: AppTextStyles.body14GrayRegular,
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.body14DarkBlueRegular,
          ),
        ),
      ],
    );
  }
}
