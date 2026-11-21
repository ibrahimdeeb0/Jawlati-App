import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';

import '../../assets/images/app_images.dart';
import '../../theme/app_text_styles.dart';

class CompanyHeaderCard extends StatelessWidget {
  const CompanyHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.backgroundPrimary,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.borderGray.colorWithOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.backgroundSecondary,
            radius: 40.r,
            child: Image.asset(
              AppImages.appLogo,
            ),
          ),

          12.spacingVertical,

          // Company Name
          Text(
            'شركة توزيع تجريبية',
            style: AppTextStyles.body18DarkBlueSemiBold,
            textAlign: TextAlign.center,
          ),

          8.spacingVertical,

          // Company Info
          _buildInfoRow(
            icon: Icons.location_on_outlined,
            text: 'عمان - خلدة الأمير حسن',
          ),

          4.spacingVertical,

          _buildInfoRow(
            icon: Icons.phone_outlined,
            text: 'هاتف: 065606025 • موبايل: 0795553555',
          ),

          4.spacingVertical,

          _buildInfoRow(
            icon: Icons.receipt_outlined,
            text: 'رقم ضريبة المبيعات: 200123456789',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String text,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 16.r,
          color: AppColors.gray,
        ),
        8.spacingHorizontal,
        Flexible(
          child: Text(
            text,
            style: AppTextStyles.body14DarkBlueRegular,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
