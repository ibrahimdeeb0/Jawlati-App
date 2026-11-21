import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jawlati/core/helpers/extensions.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class StatusChip extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;
  final EdgeInsets? padding;

  const StatusChip({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.icon,
    this.padding,
  });

  factory StatusChip.success({
    required String text,
    IconData? icon,
  }) {
    return StatusChip(
      text: text,
      backgroundColor: AppColors.successGreen.colorWithOpacity(0.1),
      textColor: AppColors.successGreen,
      icon: icon,
    );
  }

  factory StatusChip.error({
    required String text,
    IconData? icon,
  }) {
    return StatusChip(
      text: text,
      backgroundColor: AppColors.errorRed.colorWithOpacity(0.1),
      textColor: AppColors.errorRed,
      icon: icon,
    );
  }

  factory StatusChip.warning({
    required String text,
    IconData? icon,
  }) {
    return StatusChip(
      text: text,
      backgroundColor: AppColors.warningOrange.colorWithOpacity(0.1),
      textColor: AppColors.warningOrange,
      icon: icon,
    );
  }

  factory StatusChip.info({
    required String text,
    IconData? icon,
  }) {
    return StatusChip(
      text: text,
      backgroundColor: AppColors.infoBlue.colorWithOpacity(0.1),
      textColor: AppColors.infoBlue,
      icon: icon,
    );
  }

  factory StatusChip.neutral({
    required String text,
    IconData? icon,
  }) {
    return StatusChip(
      text: text,
      backgroundColor: AppColors.gray.colorWithOpacity(0.1),
      textColor: AppColors.gray,
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12.r, color: textColor),
            4.horizontalSpace,
          ],
          Text(
            text,
            style: AppTextStyles.caption12BlueRegular.copyWith(
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
