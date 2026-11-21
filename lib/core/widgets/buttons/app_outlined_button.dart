import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/theme/app_text_styles.dart';

import '../../theme/app_colors.dart';

class AppOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final IconData? icon;
  const AppOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.icon = Icons.fingerprint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: AppColors.buttonPrimary,
              size: 26.r,
            ),
            // 6.spacingHorizontal,
            Text(
              text,
              style: AppTextStyles.button14BlueSemiBold.copyWith(
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
