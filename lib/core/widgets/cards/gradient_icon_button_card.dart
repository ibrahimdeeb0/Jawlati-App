import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/theme/app_colors.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../containers/gradient_icon_box.dart';

class GradientIconButtonCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final List<Color> gradientColors;

  const GradientIconButtonCard({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.gradientColors = const [AppColors.darkBlue, AppColors.mainBlue],
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.backgroundPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        elevation: 0,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GradientIconBox(
              icon: icon,
              gradientColors: gradientColors,
            ),
            12.verticalSpace,
            Text(
              label,
              style: AppTextStyles.body16DarkBlueSemiBold.copyWith(
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
