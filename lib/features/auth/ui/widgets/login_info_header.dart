import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/assets/images/app_images.dart';
import 'package:jawlati/core/helpers/spacing_extension.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

class LoginHeaderInfo extends StatelessWidget {
  const LoginHeaderInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.backgroundPrimary,
          radius: 40.r,
          child: Image.asset(
            AppImages.appLogo,
          ),
        ),
        18.spacingVertical,
        Text(
          'نظام إدارة المبيعات',
          style: AppTextStyles.heading20BlackBold,
        ),
        4.spacingVertical,
        Text(
          'جولتي',
          style: AppTextStyles.heading24BlueBold.copyWith(
            color: AppColors.darkBlue,
          ),
        ),
        16.spacingVertical,
        Text(
          'نسخة تجريبية للعمليات الميدانية',
          style: AppTextStyles.body16GrayMedium,
        ),
      ],
    );
  }
}
